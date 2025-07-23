use std::env;
use std::io::Error;

use clap::CommandFactory;
use clap_complete::{Shell::Bash, generate_to};

include!("src/cli.rs");

fn main() -> Result<(), Error> {
    let outdir = match env::var_os("OUT_DIR") {
        None => return Ok(()),
        Some(outdir) => outdir,
    };

    println!("Output directory: {:?}", outdir);

    let mut cmd = Cli::command();
    let path = generate_to(Bash, &mut cmd, "configurer", outdir)?;

    println!("cargo:warning=completion file is generated: {path:?}");

    Ok(())
}
