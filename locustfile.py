import time
from locust import HttpUser, task, between

class QuickstartUser(HttpUser):
    wait_time = between(1, 5)

    def on_start(self):
        register_payload = {
            "username": "JaneTheDentist",
            "password": "iamadentist1234",
            "name": "Jane",
            "role": "dentist"
        } 
        self.client.post("/v1/users/register", json=register_payload)

    @task
    def login(self):
        register_payload = {
            "username": "JaneTheDentist",
            "password": "iamadentist1234"
        } 
        self.client.post("/v1/users/login", json=register_payload)


    @task
    def get_all_clinics(self):
        self.client.get("/v1/clinics")

    
  