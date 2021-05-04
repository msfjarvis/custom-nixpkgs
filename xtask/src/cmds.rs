use color_eyre::eyre::Result;
use std::process::Command;

use walkdir::WalkDir;

pub(crate) fn clean_derivations() -> Result<()> {
    for entry in WalkDir::new(".").into_iter().filter_map(|e| e.ok()) {
        if entry.path().to_str().unwrap().contains("./result") {
            std::fs::remove_file(entry.path().to_str().unwrap())?;
        }
    }
    Ok(())
}

pub(crate) fn get_prefetch_hash(repo: String, tag: String) -> Result<()> {
    let url = format!("https://github.com/{}/archive/{}.tar.gz", repo, tag,);
    let output = Command::new("nix-prefetch-url")
        .args(&["--type", "sha256", "--unpack", url.as_str()])
        .output()?;
    println!("{}", std::str::from_utf8(&output.stdout).unwrap());
    Ok(())
}

pub(crate) fn run_nixfmt() -> Result<()> {
    let mut cmd = Command::new("nixfmt");
    for entry in WalkDir::new(".").into_iter().filter_map(|e| e.ok()) {
        if entry.path().to_str().unwrap().contains(".nix") {
            cmd.arg(entry.path().to_str().unwrap());
        }
    }
    let output = cmd.output()?;
    println!("{}", std::str::from_utf8(&output.stderr).unwrap());
    Ok(())
}