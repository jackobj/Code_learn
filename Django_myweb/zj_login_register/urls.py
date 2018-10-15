#-*-coding:utf-8-*-
from django.conf.urls import  url
from zj_login_register import views
urlpatterns = [
    url(r'^login/',views.login),
    url(r'^login_handler/',views.login_handler),


    url(r'^register/',views.register),
    url(r'^register_handler/',views.register_handler),

    url(r'^ver/$', views.verifyCode),
    url(r'^getcode/$', views.getcode),
    url(r'^admin_login/',views.admin_login),
    url(r'^admin_login_handler/',views.admin_login_handler),
]