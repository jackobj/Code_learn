from django.db import models
from zj_presonal_center.models import Personal_Center

# Create your models here.
class First_Display(models.Model):
    f_name = models.CharField(max_length=20)
    class Meta():
        db_table='first_display'
class Second_Display(models.Model):
    s_name = models.CharField(max_length=20)
    #定义FK到一级联动first_Display--一对多
    first_display = models.ForeignKey(to=First_Display,on_delete=models.CASCADE)
    class Meta():
        db_table = 'second_display'
class Demand(models.Model):
    #定义FK到personal中心,
    personal_center = models.ForeignKey(to=Personal_Center,on_delete=models.CASCADE)
    #定义FK到second_display，
    second_display = models.ForeignKey(to=Second_Display,on_delete=models.CASCADE)
    title = models.CharField(max_length=60)
    details = models.TextField(max_length=400)
    image = models.ImageField(max_length=50,default='')
    files = models.FileField(max_length=50,default='')
    date  = models.DateField(default='')
    bounty = models.IntegerField(default='')
    demand_tel = models.CharField(max_length=13)
    address = models.CharField(max_length=50,default='')
    add_service =models.IntegerField(default='')
    #增值服务的钱
    taocan = models.CharField(max_length=20,default='无套餐')
    onclick = models.IntegerField(default=0)
    #审核状态默认都是2状态---待审核
    review = models.IntegerField(default=2)
    def create(self,personal_center_id,second_display_id,title,details
               ,taocan,demand_tel,
               bounty,i,f,demand_date,add_service,address):
        self.personal_center_id =personal_center_id
        self.second_display_id = second_display_id
        self.title = title
        self.details = details
        self.taocan = taocan
        self.demand_tel = demand_tel
        self.bounty = bounty
        self.image = i
        self.files = f
        self.date = demand_date
        self.add_service = add_service
        self.address = address
        self.save()
    class Meta():
        db_table = 'demand'
