mod cmds;
use clap::{crate_authors, crate_description, crate_name, crate_version, AppSettings, Clap};

use color_eyre::eyre::{eyre, Result};
#[derive(Clap)]
#[clap(
    name = crate_name!(),
    version = crate_version!(),
    author = crate_authors!(),
    about = crate_description!(),
    setting = AppSettings::ColoredHelp,
    setting = AppSettings::DeriveDisplayOrder,
    setting = AppSettings::SubcommandRequiredElseHelp,
)]
struct Opts {
    #[clap(subcommand)]
    subcommand: SubCommand,
}

#[derive(Clap)]
enum SubCommand {
    Clean(Clean),
    Format(Format),
    Hash(Hash),
}

/// Delete leftover directories from nix-build tests
#[derive(Clap)]
#[clap(setting = AppSettings::ColoredHelp)]
struct Clean {}

/// Run nixpkgs-format on the entire directory
#[derive(Clap)]
#[clap(setting = AppSettings::ColoredHelp)]
struct Format {}

/// Use nix-prefetch-url to compute the hash for a given GitHub repository at the given revision
#[derive(Clap)]
#[clap(setting = AppSettings::ColoredHelp)]
struct Hash {
    /// Repository name, of the format OWNER/REPO
    #[clap(validator = is_valid_repo_format)]
    repository: String,
    /// Revision to compute hash at
    revision: String,
}

fn main() -> Result<()> {
    color_eyre::install()?;
    let opts = Opts::parse();
    match opts.subcommand {
        SubCommand::Clean(_) => cmds::clean_derivations(),
        SubCommand::Format(_) => cmds::run_nixpkgs_fmt(),
        SubCommand::Hash(hash) => cmds::get_prefetch_hash(hash.repository, hash.revision),
    }
}

fn is_valid_repo_format(value: &str) -> Result<()> {
    if value.contains("/") {
        let split = value.split("/");
        if split.clone().count() == 2 {
            for s in split {
                if s.is_empty() {
                    return Err(eyre!("Neither of OWNER or REPO must be empty"));
                }
            }
        }
        Ok(())
    } else {
        Err(eyre!("Value must of the format OWNER/REPO"))
    }
}
