#[cfg(unix)]
fn symbolic_link(source: &str, target: &str) -> std::io::Result<()> {
    use std::os::unix::fs::symlink;

    symlink(source, target)
}
