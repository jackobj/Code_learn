#-*-coding:utf-8-*-
from django.conf.urls import  url
from zj_presonal_center import views
urlpatterns = [

    url(r'user_center/(\d*)',views.user_center),

    url(r'^myinfo/',views.myinfo),
    url(r'myinfo_handler/',views.myinfo_handler),

    url(r'^my_message/(\d*)',views.my_demand),
    url(r'^xiugai_password/',views.xiugai_password),
    url(r'^xiugai_password_handler/',views.xiugai_password_handler),

    url(r'my_task/(\d*)',views.my_task),
    url(r'vip/',views.vip),

    url(r'clear_login/',views.clear_login)

    ]