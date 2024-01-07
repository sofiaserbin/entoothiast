# Entoothiast

This is considered the "main" repository for entoothiast, allowing you to start all middleware services at once, including the DBMS and MQTT Broker.

<mark>Please refer to the wiki for further information, including rationale about the architecture, diagrams, and more. </mark>

# Requirements

- Node.js and npm
- Docker and docker-compose (included in Docker Desktop)

For running the load test (using locust):

- python3
- locust, faker (`pip3 install locust faker`)

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

# Useful commands

```bash
# within entoothiast/entoothiast:
npm run compose:up # (re-)starts the MQTT broker and database
npm run services:up # (re-)starts the backend services
npm run serivces:logs # shows and updates the logs of the backend services
npm run services:down # stops the backend services
```

Note: When using `npm run services:up`, the changed service will automatically restart when you make changes to its code.

<mark>The services will continue running in the background until stopped!</mark>
Use `npm run all:down` to stop all services + DB + MQTT broker at once.

See database-related commands below.

# Useful configuration files

- pm2-dev.yaml: Configuratin file for pm2, which handles the node services (MQTT services and API-gateway)
- docker-compose.yml: Configuration file for docker-compose, which handles the database and MQTT broker

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

To keep track of all sent MQTT messages, you can use the following command:

```bash
npm run mqtt:watch
```

# Generating & working with diagrams

- We use d2lang to generate the component and sequence diagram, refer to the [d2 installation instructions](https://d2lang.com/tour/install) and [the package.json scripts](./package.json).
- The DB diagram uses [dbdiagram](https://dbdiagram.io)
- The Use Case diagram uses [draw.io](https://draw.io)
