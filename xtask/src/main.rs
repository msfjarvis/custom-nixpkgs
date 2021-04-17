use std::error::Error;
use std::process::Command;
use walkdir::WalkDir;

fn main() -> Result<(), Box<dyn Error + 'static>> {
    match std::env::args().nth(1) {
        None => {}
        Some(arg) => match arg.as_str() {
            "clean" => {
                for entry in WalkDir::new(".").into_iter().filter_map(|e| e.ok()) {
                    if entry.path().to_str().unwrap().contains("./result") {
                        std::fs::remove_file(entry.path().to_str().unwrap())?;
                    }
                }
                return Ok(());
            }
            "hash" => {
                let repo = std::env::args().nth(2);
                let tag = std::env::args().nth(3);
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
                return Ok(());
            }
            "format" | "fmt" => {
                let mut cmd = Command::new("nixpkgs-fmt");
                for entry in WalkDir::new(".").into_iter().filter_map(|e| e.ok()) {
                    if entry.path().to_str().unwrap().contains(".nix") {
                        cmd.arg(entry.path().to_str().unwrap());
                    }
                }
                let output = cmd.output()?;
                println!("{}", std::str::from_utf8(&output.stderr).unwrap());
                return Ok(());
            }
            _ => {}
        },
    };
    println!(
        r#"
Available commands:
- clean
- format/fmt
- hash <owner/repo> <tag>
"#
    );
    return Ok(());
}
