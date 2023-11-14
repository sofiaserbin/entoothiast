# Entoothiast

# Wiki

Please refer to the wiki for further information, including rationale about the architecture, diagrams, and more.

# Getting started

Recommended: Create a folder for the project and clone all repositories into it.

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
npm run dev-up # starts the backend services
npm run logs # shows and updates the logs of the backend services
npm run dev-down # stops the backend services
```

This uses the configuration from `pm2-dev.yaml` (node services) and `docker-compose.yml` (database, mqtt broker).

## Generating & working with diagrams

- We use d2lang to generate the component diagram, refer to the [d2 installation instructions](https://d2lang.com/tour/install)
- The DB diagram uses [dbdiagram](https://dbdiagram.io)
- The Use Case diagram uses [draw.io](https://draw.io)
