from django.db import models
from zj_login_register.models import User

# Create your models here.
class Personal_Center(models.Model):
    ###onetoone到User表
    user = models.OneToOneField(to=User,on_delete=models.CASCADE)
    mypic = models.ImageField(max_length=50,default='')
    industry = models.CharField(max_length=30)
    company = models.CharField(max_length=30)
    brand = models.CharField(max_length=20)
    position = models.CharField(max_length=20)
    atname = models.CharField(max_length=20,default='')
    cprofile = models.CharField(max_length=200,default='')
    qq = models.CharField(max_length=20,default='')
    wechat = models.CharField(max_length=20,default='')
    email = models.CharField(max_length=30,default='')
    sdemand = models.IntegerField(default=1)
    vcinformation = models.IntegerField(default=2)
    money = models.IntegerField(default=0)
    class Meta():
        db_table = 'personal_center'