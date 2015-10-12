from django.db import models
import datetime

# Create your models here.


class Users(models.Model):
    ip = models.CharField(max_length=50)
    logo_time = models.DateField(auto_now=True, auto_now_add=True)


class Finisher(models.Model):
    ip = models.CharField(max_length=50)
    apple_number = models.IntegerField()
    leave_time = models.DateField(default=datetime.datetime.now(), auto_now=True, auto_now_add=True)
