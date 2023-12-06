from locust import HttpUser, task, between
from faker import Faker
import random
from datetime import datetime, timedelta

class QuickstartUser(HttpUser):
    wait_time = between(1, 5)
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
            "role": "patient"
        } 

        self.client.post("/v1/users/register", json=register_payload)
        
        # Store the generated credentials for later use
        self.users[fake_username] = {
            "username": fake_username,
            "password": fake_password
        }

    @task(2)
    def login(self):
        if self.users:
            random_user = next(iter(self.users.values()))  
            login_payload = {
                "username": random_user["username"],
                "password": random_user["password"]
            } 
            self.client.post("/v1/users/login", json=login_payload)
        else:
            self.environment.runner.quit()  



    @task
    def get_all_clinics(self):
        self.client.get("/v1/clinics")

    @task
    def get_all_timeslots(self):
        self.client.get("/v1/timeslots")

    @task 
    def get_all_dentists(self):
        self.client.get("/v1/dentists")

    @task 
    def create_new_timeslot(self):
        random_dentistId = random.randint(31, 36)
        start_time = datetime.now() + timedelta(days=random.randint(1, 30))
        end_time = start_time + timedelta(hours=random.randint(1, 6))
    
        newTimeslot_payload = {
        "start_time": start_time.strftime("%Y-%m-%d %H:%M:%S"),
        "end_time": end_time.strftime("%Y-%m-%d %H:%M:%S")
         }
        self.client.post(f'/v1/dentists/{random_dentistId}/timeslots', json = newTimeslot_payload)

    @task 
    def rate_dentist(self):
        random_dentistId = random.randint(31, 36)
        rating_payload = {
            "rating": random.randint(1, 5)
        }
        self.client.post(f'/v1/dentists/{random_dentistId}/ratings', json = rating_payload)

    

    

    
  