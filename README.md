# Entoothiast

This is considered the "main" repository for entoothiast, allowing you to start all middleware services at once, including the DBMS and MQTT Broker.

<mark>Please refer to the wiki for further information, including rationale about the architecture, diagrams, and more. </mark>

# Requirements

- Node.js and npm
- Docker and docker-compose (included in Docker Desktop)

# Getting started

Recommended: Create a folder for the project and clone all repositories into it.
If you want to run all middleware services at once (explained below), you need this folder structure.

```bash
mkdir entoothiast
cd entoothiast

git clone git@git.chalmers.se:courses/dit355/2023/student-teams/dit356-2023-08/entoothiast.git
git clone git@git.chalmers.se:courses/dit355/2023/student-teams/dit356-2023-08/api-gateway.git
git clone git@git.chalmers.se:courses/dit355/2023/student-teams/dit356-2023-08/authentication-service.git
git clone git@git.chalmers.se:courses/dit355/2023/student-teams/dit356-2023-08/dentist-ui.git
git clone git@git.chalmers.se:courses/dit355/2023/student-teams/dit356-2023-08/logging-service.git
git clone git@git.chalmers.se:courses/dit355/2023/student-teams/dit356-2023-08/patient-ui.git
git clone git@git.chalmers.se:courses/dit355/2023/student-teams/dit356-2023-08/scheduling-service.git
git clone git@git.chalmers.se:courses/dit355/2023/student-teams/dit356-2023-08/statistics-service.git
```

Then, check out the branch you're working on in each repository (+ pull) + run `npm install`.

For developing the middleware + MQTT Broker + DBMS (auto-reload when changes happen), you can use the following commands:

```bash
# within entoothiast/entoothiast:
npm run services:up # starts the backend services
npm run serivces:logs # shows and updates the logs of the backend services
npm run services:stop # stops the backend services
```

This uses the configuration from `pm2-dev.yaml` (node services) and `docker-compose.yml` (database, mqtt broker).

# Database

The database credentials for devevelopment (`localhost:5432`) are:

- username: `postgres`
- password: `postgres`
- database: `entoothiast`

Use those credentials to connect to the database with your favorite tool (e.g. DBeaver) or use the following command to start psql within the docker container:

```bash
npm run db:cli
```

View the DB logs using:

```bash
npm run db:logs
```

# Testing MQTT

To publish/subcribe to MQTT topics, you can use the following commands:

```bash
npx mqtt pub -t "topic" -m "message"
npx mqtt sub -t "topic"
```

# Generating & working with diagrams

- We use d2lang to generate the component and sequence diagram, refer to the [d2 installation instructions](https://d2lang.com/tour/install) and [the package.json scripts](./package.json).
- The DB diagram uses [dbdiagram](https://dbdiagram.io)
- The Use Case diagram uses [draw.io](https://draw.io)
