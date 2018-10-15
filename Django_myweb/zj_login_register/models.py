from django.db import models

# Create your models here.
from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length= 13)
    password = models.CharField(max_length = 64)
    def create(self,username,password):
        self.username = username
        self.password = password
        self.save()
    class   Meta():
        db_table = 'user'

class Admin(models.Model):
    admin_username= models.CharField(max_length = 20)
    admin_password = models.CharField(max_length= 64)
    class Meta():
        db_table = 'admin'
