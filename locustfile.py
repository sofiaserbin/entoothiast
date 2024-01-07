from locust import FastHttpUser, task, between, TaskSet
from faker import Faker
import random
from datetime import datetime, timedelta


class Authenticate(TaskSet):
    fake = Faker()
    users = {}

    @task
    def register(self):
        fake_username = self.fake.user_name()
        fake_password = self.fake.password()
        fake_name = self.fake.name()

        register_payload = {
            "username": fake_username,
            "password": fake_password,
            "name": fake_name,
            "role": "patient",
        }

        self.client.post("/v1/users/register", json=register_payload)

        self.users[fake_username] = {
            "username": fake_username,
            "password": fake_password,
        }

        login_payload = {"username": fake_username, "password": fake_password}

        self.client.post("/v1/users/login", json=login_payload)


class userFunctionality(TaskSet):
    token = None

    def login(self):
        login_payload = {"username": "patient1", "password": "test"}
        response = self.client.post("/v1/users/login", json=login_payload)
        self.token = response.json().get("token", None)

    def on_start(self):
        self.login()

    @task(3)
    def rate_dentist(self):
        headers = {"Authorization": f"Bearer {self.token}"}
        random_dentistId = 6
        rating_payload = {"rating": random.randint(1, 5)}
        self.client.patch(
            f"/v1/users/dentists/{random_dentistId}",
            json=rating_payload,
            headers=headers,
        )

    @task
    def get_all_appointments_of_a_user(self):
        headers = {"Authorization": f"Bearer {self.token}"}
        random_userId = 1
        self.client.get(f"/v1/users/{random_userId}/appointments", headers=headers)

    @task
    def get_all_notifications_of_a_user(self):
        headers = {"Authorization": f"Bearer {self.token}"}
        random_userId = 1
        self.client.get(f"/v1/users/{random_userId}/notifications", headers=headers)


class QuickstartUser(FastHttpUser):
    tasks = [Authenticate, userFunctionality]

    @task
    def get_all_clinics(self):
        self.client.get("/v1/clinics")

    @task
    def get_all_timeslots(self):
        self.client.get("/v1/timeslots")

    @task
    def get_user(self):
        random_userId = 1
        self.client.get(f"/v1/users/{random_userId}")

    @task
    def get_all_dentists(self):
        self.client.get("/v1/dentists")
