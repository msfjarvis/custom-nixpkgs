use std::process::Command;
use std::{env::Args, error::Error};

use walkdir::WalkDir;

pub(crate) fn clean_derivations() -> Result<(), Box<dyn Error>> {
    for entry in WalkDir::new(".").into_iter().filter_map(|e| e.ok()) {
        if entry.path().to_str().unwrap().contains("./result") {
            std::fs::remove_file(entry.path().to_str().unwrap())?;
        }
    }
    Ok(())
}

pub(crate) fn get_prefetch_hash(mut args: Args) -> Result<(), Box<dyn Error>> {
    let repo = args.nth(2);
    let tag = args.nth(3);
    if repo.is_none() {
        println!("Providing a repository is necessary");
        return Ok(());
    }
    if tag.is_none() {
        println!("Providing a tag is necessary");
        return Ok(());
    }
    let url = format!(
        "https://github.com/{}/archive/{}.tar.gz",
        repo.unwrap(),
        tag.unwrap(),
    );
    let output = Command::new("nix-prefetch-url")
        .args(&["--type", "sha256", "--unpack", url.as_str()])
        .output()?;
    println!("{}", std::str::from_utf8(&output.stdout).unwrap());
    Ok(())
}

pub(crate) fn run_nixpkgs_fmt() -> Result<(), Box<dyn Error>> {
    let mut cmd = Command::new("nixpkgs-fmt");
    for entry in WalkDir::new(".").into_iter().filter_map(|e| e.ok()) {
        if entry.path().to_str().unwrap().contains(".nix") {
            cmd.arg(entry.path().to_str().unwrap());
        }
    }
    let output = cmd.output()?;
    println!("{}", std::str::from_utf8(&output.stderr).unwrap());
    Ok(())
}

pub(crate) fn help() -> Result<(), Box<dyn Error>> {
    println!(
        r#"
Available commands:
- clean
- format/fmt
- hash <owner/repo> <tag>
"#
    );
    Ok(())
}
