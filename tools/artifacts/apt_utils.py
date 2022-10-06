import tarfile
import subprocess
from os import listdir
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import List

import click

def get_apt_dependencies(package: str) -> List[str]:
    """Get the list of recursive dependencies for an apt package."""
    result = subprocess.run([
                                "apt-cache",
                                "depends",
                                "--recurse",
                                "--no-recommends",
                                "--no-suggests",
                                "--no-conflicts",
                                "--no-breaks",
                                "--no-replaces",
                                "--no-enhances",
                                package
                            ],
                            capture_output=True,
                            universal_newlines=True)
    result.check_returncode()

    # We only need the lines of stdout that don't start with an space
    return [line for line in result.stdout.splitlines() if not line.startswith(" ")]


def download_apt_package(package: str, directory: Path) -> Path:
    """Download an apt package into a specified directory.
    
    Args:
        package: Name of the package to download
        directory: Directory where the package should be downloaded 

    Returns: Path to the downloaded `.deb` file
    """
    # Download the package
    subprocess.run(["apt-get", "download", package], cwd=directory, check=True)

    # Get the name of the downloaded file (this doesn't download the package again)
    result = subprocess.run(["apt-get", "download", package, "--print-uris"],
                            capture_output=True,
                            universal_newlines=True)
    result.check_returncode()
    deb_files = [out for out in result.stdout.split(" ") if out.endswith(".deb")]
    if len(deb_files) != 1:
        raise ValueError("Unexpected number of outputs.", deb_files)
    return directory / deb_files[0]


def extract_deb_file(deb_file: Path, directory: Path) -> None:
    """Extract a `.deb` file into a specified directory."""
    subprocess.run(["dpkg", "-x", str(deb_file), str(directory)], check=True)


def compress_to_tar_gz(tar_gz_file: Path, directory_to_compress: Path) -> None:
    """Compress a directory into a `.tar.gz` file."""
    with tarfile.open(tar_gz_file, "w:gz") as tar:
        for filename in listdir(directory_to_compress):
            tar.add(directory_to_compress / filename, arcname=filename)


@click.command()
@click.argument("package")
@click.argument("tar_gz_file", type=click.Path(dir_okay=False))
def apt_to_tar(package: str, tar_gz_file: str) -> None:
    """Download an apt package (including all of its dependencies) and compress it into a `.tar.gz` file.
    
    \b
    PACKAGE: The apt package to download and compress
    TAR_GZ_FILE: The name and path of the `.tar.gz` file created by this function 
    """
    if not tar_gz_file.endswith(".tar.gz"):
        raise ValueError("The `TAR_GZ_FILE` must end with `.tar.gz`.")

    packages = get_apt_dependencies(package)
    print("The following pachagees will be downloaded:\n", "\n".join(packages), "\n")

    with TemporaryDirectory() as dir:
        dir_path = Path(dir)
        extracted_dir = dir_path / "extracted"
        extracted_dir.mkdir()
        for pkg in packages:
            print("Downloading", pkg)
            deb_file = download_apt_package(pkg, dir_path)

            print("Extracting", pkg, "\n")
            extract_deb_file(deb_file, extracted_dir)

        print("Compressing into .tar.gz")
        tar_gz_file_path = Path(tar_gz_file)
        compress_to_tar_gz(tar_gz_file_path, extracted_dir)
        print("DONE:", tar_gz_file_path.absolute())


if __name__ == "__main__":
    apt_to_tar()
