ISC BIND9 DNS Server in Docker with some batteries included - automatic zone reload (rndc) on any zone file changes.

Features:
1. Official Docker image from internetsystemsconsortium/bind9 as a base (alpine currently).
2. Automatically monitors zone files for changes and reloads them in the background if they change, without restarting the server or whole container.
3. dumb-init as pid 1 and my own implementation of entrypoint.sh. The magic of rndc is right here :)

Notes:
Not intended for production. Suitable for test environments, quick deployments, etc.

The list of zones and their corresponding files to watch for changes is implemented as a dictionary in the entrypoint.sh script:
```bash
declare -A arr
arr["lol-kek.lol"]="/etc/bind/zones/db.lol-kek.lol"
arr["dev.lol-kek.lol"]="/etc/bind/zones/db.dev.lol-kek.lol"
```

To build the Docker image, run:
```bash
docker compose build --no-cache
```

To run the container:
```bash
docker compose up --build -d
```

To stop a container:
```bash
docker compose down
```

List of required packages to install in the docker image:
a. dumb-init (as pid 1)
b. bash (for entrypoint.sh code)
c. bind-tools (for rndc-confgen if rndc key need to change)
d. inotify-tools (for inotifywait)
The rest of the packages specified in the Dockerfile are used for convenience and debugging.

