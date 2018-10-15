
from django.shortcuts import render,loader,redirect
from .models import *
from django.http import HttpResponse
from PIL import Image,ImageDraw,ImageFont
import random
from hashlib import md5
import os
from io import BytesIO
import re
from django.db.models import  Max,F,Q,Count
from zj_presonal_center.models import *
# Create your views here.
def login(request):
    request.session.clear()
    return render(request,'login.html')

def login_handler(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    if username == '':
        return HttpResponse('用户名不能为空！')
    res_username = re.compile('^1[34578][0-9]{9}$')
    result=res_username.match(username)
    print(result)
    if result != None:
        username_i = User.objects.filter(username=username)
        if len(username_i)==0:
            return  HttpResponse('用户名不存在！')
        else:
            password_i = User.objects.get(username=username)
            print(password_i.password)
            md=md5()
            md.update(password.encode())
            pwd = md.hexdigest()
            if password_i.password == pwd:
                request.session['user_tel'] = username
                #老用户登录
                try:
                    m = Personal_Center.objects.get(user__username=username)
                    request.session['user'] = m.atname
                    context={
                        'user_tel':username,
                        'user':m.atname,
                    }
                    return render(request,'login_success.html',context)
                #新用户登录
                except:
                    request.session['user'] = ''
                    context = {
                        'user_tel':username,
                        'user':'',
                    }
                    return render(request,'login_success.html',context)
            else:
                return HttpResponse('密码错误!')
    else:
        return HttpResponse('用户名格式不正确')
def register(request):
    return  render(request,'register.html')
def getcode(request):
    code = request.session['code']
    return HttpResponse(code)
def verifyCode(request):

    bgcolor=(random.randrange(10,100),random.randrange(10,100),255)
    width=70
    height=40
    #new一个笔
    im=Image.new('RGB',(width,height),bgcolor)
    #new一个画
    draw=ImageDraw.Draw(im)
    #给一块画布做点
    for i in range(0,20):
        xy=(random.randrange(0,width),random.randrange(0,height))
        fillcolor=(random.randrange(0,255),255,random.randrange(0,255))
        draw.point(xy,fill=fillcolor)
    #给一块画布做线
    for i in range(0,20):
        xy=(random.randrange(0,width),random.randrange(0,height),random.randrange(0,width),random.randrange(0,height))
        fillcolor=(255,random.randrange(0,255),random.randrange(0,255))
        draw.ellipse(xy,fill=fillcolor)
    str='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    rand_str=''
    for i in range(0,4):
        rand_str+=str[random.randrange(0,len(str))]
    print(rand_str)
    request.session['code'] = rand_str
    textcolor=(255,255,255)
    fontz=ImageFont.truetype('fonts-japanese-gothic.ttf',20)
    draw.text((5,random.randrange(0,15)),rand_str[0],fill=textcolor,font=fontz)
    draw.text((15, random.randrange(0, 15)), rand_str[1], fill=textcolor, font=fontz)
    draw.text((25, random.randrange(0, 15)), rand_str[2], fill=textcolor, font=fontz)
    draw.text((40, random.randrange(0, 15)), rand_str[3], fill=textcolor, font=fontz)
    buff=BytesIO()
    im.save(buff,'png')
    return HttpResponse(buff.getvalue(),'images/png')

def register_handler(request):
    #fetch username and password
    ver = request.session.get('code','')
    username=request.POST.get('username')
    print(type(username))
    password=request.POST.get('password')
    cpassword = request.POST.get('cpassword')
    yanzhengma = request.POST.get('yanzhengma')

    if username == '':
        return HttpResponse('用户名不能为空！')
    res_username = re.compile('^1[34578][0-9]{9}$')
    result=res_username.match(username)
    #res_username = re.search(yanzheng_username, username)
    print(result)
    if result !=None:
        print('你的用户名格式正确')
        username_i = User.objects.filter(username=username)
        print(username_i)
        if len(username_i) ==0:
            print('用户名判断完了')
            res_password2 = re.compile('^[a-zA-Z0-9]{8,18}$')
            result2 = res_password2.match(password)
            if result2==None:
                return HttpResponse('密码长度需要在8-18位之间！')
            else:
                print('密码符合要求')
                m=yanzhengma.lower()
                n=ver.lower()
                if yanzhengma == '':
                    return  HttpResponse('验证码输入为空！')
                if m != n:
                    return HttpResponse('验证码输入错误！')
                if n == m:
                    print('验证码是输入正确的')
                    if cpassword == '':
                        return HttpResponse('再次输入密码不能为空！')
                    if cpassword != password:
                        return HttpResponse('两次输入的密码不一致！')
                    if cpassword == password:
                        print('两次输入的密码符合要求')
                        md=md5()
                        md.update(password.encode())
                        pwd = md.hexdigest()
                        print(pwd)
                        user = User()
                        user.create(username,pwd)
                        return render(request,'register_success.html')
        else:
            return HttpResponse('用户名已存在')
    else:
        return HttpResponse('用户名格式错误！')
def admin_login(request):
    return render(request,'admin_login.html')
def admin_login_handler(request):
    admin_username = request.POST.get('admin_username')
    admin_password = request.POST.get('admin_password')
    m = Admin.objects.filter(Q(amin_username=admin_username) and Q(admin_password=admin_password))
    if len(m) == 0:
        return HttpResponse('管理员登录失败')
    else:
        return  HttpResponse('管理员等登录成功！')
