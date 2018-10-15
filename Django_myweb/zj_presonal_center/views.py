from django.shortcuts import render
from zj_presonal_center.models import  *
from zj_login_register.models import  *
from django.http import  HttpResponse
from zj_release_demand.models import  *
import os
from django.core import paginator
from django.db.models import  Max,F,Q,Count
from zj_comment.models import  *
from hashlib import md5
import re
# Create your views here.
def user_center(request,index):
    user = request.session.get('user')
    user_tel = request.session.get('user_tel')
    if user_tel != '':
        users = User.objects.get(username=user_tel)
        m = users.id
        print(m)
        myinfo = Personal_Center.objects.filter(user_id=m).\
            values('mypic','atname','user__username','company','brand','industry','position','id')
        print(myinfo)

        demands = Demand.objects.filter(personal_center__user_id=m).\
            values('title','details','date','bounty','id')
        print(demands)
        # 使用Paginator方法返回一个分页的对象
        #  这个对象包括岁哦有数据，分页情况
        pag = paginator.Paginator(demands, 4)
        # 使用此判断语句为了在用户跳转www.xxx.com/info/时也能访问第一页
        if index == '':
            index = 1
        # 返回指定（index）页面的数据，用于呈现在指定页上
        page = pag.page(index)
        # 构造上下文，以便html文件中能调用对应的数据
        # Paginator和Page的常用API
        # page.previous_page_number()
        # page.next_page_number()
        # page.has_previous()
        # page.has_next()

        # 构造页面渲染的数据
        '''
        渲染需要的数据:
        - 当前页的博文对象列表
        - 分页页码范围
        - 当前页的页码
        '''
        context = {
            'user_tel':user_tel,
            'user':user,
            'myinfo':myinfo,
            'page':page,
            's':1,
        }
        return render(request,'personal_center/user.html',context)
    else:
        return render(request,'login.html')
def myinfo(request):
    user_tel = request.session.get('user_tel')
    user = request.session.get('user')
    if user_tel != '':
        context = {
            'user_tel':user_tel,
            'user':user,
            's':2,
        }
        return  render(request, 'personal_center/myinfo.html',context)
    else:
        return render(request,'login.html')
def myinfo_handler(request):
    #存入用户信息
    user = request.session.get('user')
    user_tel = request.session.get('user_tel')
    if user_tel !='':
        user_info = User.objects.get(username=user_tel)
        user_id = user_info.id
        wechat = request.POST.get('wechat')
        print('weixin' + wechat)
        qq = request.POST.get('qq')
        email = request.POST.get('email')
        industry = request.POST.get('industry')
        company = request.POST.get('company')
        brand = request.POST.get('brand')
        position = request.POST.get('position')
        atname = request.POST.get('atname', '')
        cprofile = request.POST.get('cprofile')
        mypics = request.FILES.get('mypic')
        mypic = open(os.path.join('static', 'IMG', mypics.name), 'wb')
        print(mypic)
        for pi in mypics:
            mypic.write(pi)
        mypic.close()
        pic = mypic.name
        print(user)
        #如果他已经设置了用户名则进行修改
        if user !='':
            jilu = Personal_Center.objects.filter(id=user_id).\
                update(qq=qq,wechat=wechat,email=email,industry=industry,company=company
                       ,brand=brand,position=position,atname=atname,cprofile=cprofile
                       ,mypic=pic)
            print(jilu)
            if jilu ==1:
                return HttpResponse('更改信息成功')
            else:
                return HttpResponse('输入不能为空！')
            ##加修改语句
        else:
            p=Personal_Center()
            p.wechat=wechat
            p.qq=qq
            p.email=email
            p.industry = industry
            p.company = company
            p.brand = brand
            p.position = position
            p.atname = atname
            p.cprofile = cprofile
            p.user_id = user_id
            p.mypic = pic
            #personal_center表与user表对应关系
            p.save()
            #存了session
            request.session['user'] = atname
            #取session

            return render(request,'personal_center/myinfo.html')
    else:
        return render(request,'login.html')
def my_demand(request,index):
    user_tel = request.session.get('user_tel')
    user = request.session.get('user')
    print(user)
    print(type(user))
    if user_tel !='':
        if user != '':
            user_info = User.objects.get(username=user_tel)
            user_id = user_info.id
            coms = Comment.objects.filter(demand__personal_center__user__id=user_id).\
                values('content','comment_time','demand__id')
            # 使用Paginator方法返回一个分页的对象
            #  这个对象包括岁哦有数据，分页情况
            pag = paginator.Paginator(coms, 4)
            # 使用此判断语句为了在用户跳转www.xxx.com/info/时也能访问第一页
            if index == '':
                index = 1
            # 返回指定（index）页面的数据，用于呈现在指定页上
            page = pag.page(index)
            # 构造上下文，以便html文件中能调用对应的数据
            # Paginator和Page的常用API
            # page.previous_page_number()
            # page.next_page_number()
            # page.has_previous()
            # page.has_next()

            # 构造页面渲染的数据
            '''
            渲染需要的数据:
            - 当前页的博文对象列表
            - 分页页码范围
            - 当前页的页码
            '''

            context = {
                'user_tel':user_tel,
                'user': user,
                'page':page,
                's':4,
            }
            return render(request,'personal_center/message.html',context)

        else:
            return HttpResponse(' 请先设置个人信息！')
    else:
        return  render(request,'login.html')
def xiugai_password(request):
    user_tel = request.session.get('user_tel')
    user = request.session.get('user')
    if user_tel != '':
        context = {
            'user_tel': user_tel,
            'user': user,
            's':6,
        }
        return  render(request,'personal_center/xiugai_password.html',context)
    else:
        return render(request,'login.html')
def xiugai_password_handler(request):
    user_tel = request.session.get('user_tel')
    user = request.session.get('user')
    if user_tel !='':
        password = request.POST.get('password')
        new_password = request.POST.get('new_password')
        cpwd = request.POST.get('npass2')
        md=md5()
        md.update(password.encode())
        pwd=md.hexdigest()
        password_i = User.objects.get(username=user_tel)
        #判断当前密码
        new_password1 = re.compile('^[a-zA-Z0-9]{8,18}$')
        result2 = new_password1.match(new_password)
        # 对新密码进行格式判断
        if result2 == None:
            return HttpResponse('新密码长度需要在8-18位之间！')
        if password_i == pwd:
            #新密码进行加密
            md.update(new_password.encode())
            pwd1 = md.hexdigest()
            if new_password == cpwd:

                User.objects.filter(username=user_tel).update(password=pwd1)

                return HttpResponse('修改密码成功！')
            else:
                return HttpResponse('两次输入的密码不一致！')
        else:
            return HttpResponse('当前密码输入错误')
    else:
        return render(request,'login.html')
def my_task(request,index):
    user = request.session.get('user')
    print(user)
    print(type(user))
    user_tel = request.session.get('user_tel')
    if user_tel != '':
        if user !='':
            user_info = User.objects.get(username=user_tel)
            user_id = user_info.id

            demand2 = Demand.objects.filter(Q(personal_center__user_id=user_id) & Q(review=2)).\
                values('title','date','id','details','bounty','add_service','image')
            demand1 = Demand.objects.filter(Q(personal_center__user_id=user_id) & Q(review=1)). \
                values('title', 'date', 'id', 'details', 'bounty', 'add_service','image')
            demand3 = Demand.objects.filter(Q(personal_center__user_id=user_id) & Q(review=3)). \
                values('title', 'date', 'id', 'details', 'bounty', 'add_service','image')
            pag = paginator.Paginator(demand2, 4)
            if index == '':
                index = 1
            page = pag.page(index)
            context = {
                'user_tel':user_tel,
                'user': user,
                'demand1':demand1,
                'page':page,
                'demand3':demand3,
                's':5,
            }
            return  render(request,'personal_center/task.html',context)
        else:
            return HttpResponse('请先设置个人信息！')
    else:
        return render(request,'login.html')

def vip(request):
    user_tel = request.session.get('user_tel')
    user = request.session.get('user')
    print(user)
    if user_tel != '':
        if user != '':
            context = {
                'user_tel':user_tel,
                'user': user,
                's':3,
            }
            return  render(request,'personal_center/vip.html',context)
        else:
            return HttpResponse('请先设置个人信息！')
    else:
        return render(request,'login.html')
def clear_login(request):
    request.session.clear()
    return  HttpResponse('注销用户成功!')

