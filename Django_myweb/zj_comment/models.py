from django.db import models
from zj_release_demand.models import Demand

# Create your models here.
class Comment(models.Model):
    content = models.CharField(max_length=300,default='')
    comment_time = models.DateTimeField(auto_now=True)
    demand = models.ForeignKey(to=Demand,on_delete=models.CASCADE)
    class Meta():
        db_table = 'comment'


