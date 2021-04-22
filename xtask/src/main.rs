mod cmds;

use std::error::Error;

fn main() -> Result<(), Box<dyn Error + 'static>> {
    match std::env::args().nth(1) {
        None => Ok(()),
        Some(arg) => match arg.as_str() {
            "clean" => cmds::clean_derivations(),
            "hash" => cmds::get_prefetch_hash(std::env::args()),
            "format" | "fmt" => cmds::run_nixpkgs_fmt(),
            _ => cmds::help(),
        },
    }
}
