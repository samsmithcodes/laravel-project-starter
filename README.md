# Laravel Project Starter

This is a Docker image that will help you setup a new Laravel project via the Laravel installer tool, it will setup with the latest Laravel version which at present is version 12.

<https://laravel.com/docs/12.x/installation>

## Usage

The following command will run a one off Docker container, you should run this from the root of your project directory.

```plaintext
docker run --rm -it \
  -v ${PWD}:/app \
  samsmithcodes/laravel-project-starter:latest
```

Follow the installer prompts and once finished you should have a `DevOps` and `laravel-project` directory.

You should explore these files and make any changes required to fit your environment, by default, it should just work out of the box, and is setup with the following Docker Compose stack:

- Nginx (latest)
- PHP FPM (latest 8.4)
- MariaDB (latest)
- phpMyAdmin (latest)

To run your Laravel project, you can run the following command from the project root:

```plaintext
bash DevOps/Scripts/RunDev.sh
```

You can then head over to <http://localhost>

### Helper Scripts

Also inside the `DevOps/Scripts` directory are a few helper scripts, because everything runs in Docker, these scripts handle all the Docker exec and run commands, and you can just focus on running the command you need.

#### BuildAssets.sh

This script will run NPM install and build, you could run the same commands with the `RunNpm.sh` script but this is just a time saver.

```plaintext
bash DevOps/Scripts/BuildAssets.sh
```

#### RunArtisan.sh

This script will allow you to run an Artisan command.

```plaintext
bash DevOps/Scripts/RunArtisan.sh <command>
```

#### RunComposer.sh

This script will allow you to run a Composer command.

```plaintext
bash DevOps/Scripts/RunComposer.sh <command>
```

#### RunNpm.sh

This script will allow you run an NPM command.

```plaintext
bash DevOps/Scripts/RunNpm.sh <command>
```

## Building

**This section is more for the maintainer, if you have forked the repository, you should update this to match your needs.**

These are the steps to build the image for this Laravel Project Starter tool and push to Docker Hub.

First, make sure you are logged in to Docker using `docker login`, then run the following command to build, tag, and push the image.

```plaintext
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --tag samsmithcodes/laravel-project-starter:latest \
  --push \
  .
```
