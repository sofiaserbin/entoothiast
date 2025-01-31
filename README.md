# Entoothiast

This is considered the "main" repository for entoothiast, allowing you to start all middleware services at once, including the DBMS and MQTT Broker.

<mark>Please refer to the wiki for further information, including rationale about the architecture, diagrams, and more. </mark>

# Requirements

- Node.js and npm
- Docker and docker-compose (which is included in Docker Desktop)

For running the load test (using locust):

- python3
- locust, faker (`pip3 install locust faker`)

# Getting started

Recommended: Create a folder for the project and clone all repositories into it.
If you want to run all middleware services at once as explained below, you need this folder structure.

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

<mark>Use the following within the folder entoothiast/entoothiast (folder of this README):</mark>

Starting compose services (DB + MQTT broker):

```bash
npm run compose:up # (re-)starts the MQTT broker and database + inserts test data
npm run compose-prod:up # the same, but without test data
npm run compose:down
npm run compose-prod:down
```

Starting the middleware:

```bash
npm run services:up # (re-)starts the backend services
npm run services-prod:up # the same, but scaled horizontally across CPUs
npm run services:down
npm run services-prod:down

npm run services:status # shows the status of the backend services
npm run serivces:logs # shows and updates the logs of the backend services
```

Note: When using `npm run services:up`, the changed service will automatically restart when you make changes to its code.

<mark>The services will continue running in the background until stopped!</mark>
Use `npm run all:down` to stop all services + DB + MQTT broker at once.

Useful DB-related commands:

```bash
npm run db:cli # starts psql within the docker container
npm run db:logs # shows and updates the logs of the database
```

Useful MQTT-related commands:

```bash
npm run mqtt:watch # shows all MQTT messages that are sent
npx mqtt pub -t "topic" -m "message" # publishes a message to a topic
```

Running the load test (use `http://localhost:3000` as the host - unless you changed the port):

```bash
npm run load-test
```

This assumes that the initial-data (test data) is inserted. So make sure to run `npm run compose:up` and not `npm run compose-prod:up`!

# Useful configuration files

- `pm2-dev.yml`, `pm2-prod.yml`: Configuratin file for pm2, which handles the node services (MQTT services and API-gateway)
- `compose-dev.yml`, `compose-prod.yml`: Configuration file for docker-compose, which handles the database and MQTT broker

# Database

The default database (`localhost:5432`) credentials, unless changed, are:

- username: `postgres`
- password: `postgres`
- database: `entoothiast`

Use those credentials to connect to the database with your favorite tool (e.g. DBeaver) or use `npm run db:cli` to start psql within the docker container

# CI & Integration tests

We use GitLab CI to run integration tests on the API-gateway and the services.
The configuration for the CI can be found in `.gitlab-ci.yml` in this repository, and the test can be found in the API-gateway repository (since the tests are run against the API-gateway).

# Generating & working with diagrams

- We use d2lang to generate the component and sequence diagram, refer to the [d2 installation instructions](https://d2lang.com/tour/install) and [the package.json scripts](./package.json).
- The DB diagram uses [dbdiagram](https://dbdiagram.io)
- The Use Case diagram uses [draw.io](https://draw.io)
