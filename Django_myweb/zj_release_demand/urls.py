#-*-coding:utf-8-*-
from django.conf.urls import  url
from zj_release_demand import  views
urlpatterns = [
    url(r'^index/(\d*)',views.index),
    url(r'^publish_type/',views.publish_type),
    url(r'^demand/',views.demand),
    url(r'^demand_handler/',views.demand_handler),

    url(r'^comment/(\d*)/(\d*)/(\d*)',views.comment),
    url(r'^comment_handler/',views.comment_handler),
]