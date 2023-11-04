# Entoothiast

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

## Generating & working with diagrams

We use d2lang to generate the component diagram, refer to the [d2 installation instructions](https://d2lang.com/tour/install)

# System architecture

## Component diagram

![Component diagram](./diagrams/component-diagram.svg)

The booking subsystem uses MQTT for communication. To abstract the booking (backend) system, we "hide" it behind an API gateway, which the Patient UI and Dentist UI consume.
