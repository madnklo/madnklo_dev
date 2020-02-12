# Docker-based development environment for madnklo

This repository provides a script to setup run and work on [MadNkLO](https://github.com/madnklo/madnklo/) using the [Docker image](https://hub.docker.com/r/madnklo/madnklo_dev) we developped.
The Docker image provides a fully-functional environment for MadNkLO with all dependencies installed and configured properly, which makes it easy for contributors to try out the code and start developing.

## Downloading and setting up

To start setting up, make sure you have Docker up and running on your machine and clone this repository
```
git clone https://github.com/madnklo/madnklo_dev.git
```
This will create a  `madnklo_dev` directory in which you will find a `madnklo_docker.sh` script which is your main way of interacting with the development environment.
Move into the `madnklo_dev` directory and run the initialization script
```
cd madnklo_dev
./madnklo_docker.sh --initialize
```
This downloads the relevant `madnklo/madnklo_dev` Docker image from the Docker hub and creates two subfolders: `madnklo_src` where the source of MadNkLO is located and `madnklo_persistent` from where MadNkLO is run: all output is located there.
The `madnklo_src` directory is itself a git repository, which you can use to pull the latest version of the code or switch to a different branch. The initialization script will pull the latest version of the master branch by itself.

That's it. You can edit the MadNkLO source from your host machine directly in `madnklo_src`, and interact with the `madnklo` git repository as one would in a normal setup.


## Running the code

To run the MadNkLO code located in `madnklo_src`, you need to go through the Docker image, which can conveniently be done by using the `madnklo_docker.sh` script:

```
./madnklo_docker.sh
```

This will start the Docker image and immediately put you in the Madgraph/MadNkLO command-line interface. The Docker image is deleted when leaving the interface. Any output is accessible outside of the Docker image in `madnklo_persistent`.

If you place a madgraph process card `proc_card.mg5` in `madnklo_persistent` it can be passed to the code to automate generation/runs:
```
./madnklo_docker.sh proc_card.mg5
```

Note that autocompletion will not work as the working directory of the madgraph script is mapped to `madnklo_persistent` while we run the script from one directory above. This will be fixed in a future version.



## Under the hood

We use volumes to map `madnklo_src` and `madnklo_persistent` to directories in the Docker image. The following mappings are performed:

- `madnklo_dev/madnklo_src` -> `/home/hep/madnklo`
- `madnklo_dev/madnklo_persistent` -> `/var/madnklo_persistent`

We further edit the `HOME` environment variable to be the persistent folder:
```
"HOME=/var/madnklo_persistent"
```
so that the CLI history is saved there

One can access a bash prompt in the image with the same volume mapping by using
```
./madnklo_docker --bash
```

## Coming soon
- fixing the relative paths for process cards to allow autocompletion
- proper setup to allow the installation of accessory python modules in the persistent folder




