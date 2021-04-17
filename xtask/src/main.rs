use std::error::Error;
use std::process::Command;
use walkdir::WalkDir;

fn main() -> Result<(), Box<dyn Error + 'static>> {
    let args = std::env::args();
    if args.len() == 0 {
        println!("Provide a command");
        return Ok(());
    }
    match std::env::args().nth(1) {
        None => {}
        Some(arg) => match arg.as_str() {
            "clean" => {
                for entry in WalkDir::new(".").into_iter().filter_map(|e| e.ok()) {
                    if entry.path().to_str().unwrap().contains("./result") {
                        std::fs::remove_file(entry.path().to_str().unwrap())?;
                    }
                }
            }
            "hash" => {
                let repo = std::env::args().nth(2).unwrap();
                let tag = std::env::args().nth(3).unwrap();
                let url = format!(
                    "https://github.com/{}/archive/{}.tar.gz",
                    repo, tag
                );
                let output = Command::new("nix-prefetch-url")
                    .args(&["--type", "sha256", "--unpack", url.as_str()])
                    .output()?;
                println!("{}", std::str::from_utf8(&output.stdout).unwrap());
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
            }
            _ => {}
        },
    };
    return Ok(());
}
