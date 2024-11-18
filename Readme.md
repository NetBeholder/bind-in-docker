# ISC BIND9 DNS Server in Docker with some batteries included

## Features:
1. Official Docker image from internetsystemsconsortium/bind9 as a base (alpine currently).
2. Automatically monitors zone files for changes and reloads them in the background if they change, without restarting the server or whole container.
3. dumb-init as pid 1 and my own implementation of entrypoint.sh. The magic is right here :)

![Alt text](/misc/htop.png?raw=true "process tree in the container")


_Notes_:
Not intended for production. Suitable for test environments, quick deployments, etc.

The list of zones and their corresponding files to watch for changes is implemented as a dictionary in the _entrypoint.sh_ script:
```bash
declare -A arr
arr["lol-kek.lol"]="/etc/bind/zones/db.lol-kek.lol"
arr["dev.lol-kek.lol"]="/etc/bind/zones/db.dev.lol-kek.lol"
```

To build a Docker image, run:
```bash
docker compose build --no-cache
```

To run a container:
```bash
docker compose up --build -d
```

To stop a container:
```bash
docker compose down
```

To show logs:
```bash
watch docker compose logs
```

## List of required packages to install in the docker image:
1. dumb-init (as pid 1);
2. bash (for entrypoint.sh code);
3. bind-tools (for rndc-confgen if rndc key need to change);
4. inotify-tools (for inotifywait);
The rest of the packages specified in the Dockerfile are used for convenience and debugging.
