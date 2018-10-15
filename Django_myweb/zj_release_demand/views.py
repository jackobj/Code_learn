from django.shortcuts import render
from zj_release_demand.models import  *
from zj_login_register.models import  *
from zj_presonal_center.models import  *
from zj_comment.models import  *
from django.db.models import  Max,F,Q,Count
import  os
from  django.http import  HttpResponse
import datetime
from django.core import paginator
# Create your views here.
def index(request,index):

    #user1 = Personal_Center.objects.get(user_id=1)
    # 存session值
    #request.session['user'] = user.atname
    #request.session.set_expiry(600)
    # 取session值
    user_tel = request.session.get('user_tel')
    user = request.session.get('user')
    #获取所有的数据，list是一个列表，包含所有数据对应的实例对象
    demand_all = Demand.objects.all().order_by('bounty').values('title', 'details', 'personal_center__atname',
                                                                     'personal_center__position',
                                                                     'personal_center__mypic', 'date', 'onclick',
                                                                     'demand_tel', 'personal_center__email','id','add_service','personal_center_id')
    print(demand_all)
    #使用Paginator方法返回一个分页的对象
    #这个对象包括岁哦有数据，分页情况
    pag = paginator.Paginator(demand_all,3)
    #使用此判断语句为了在用户跳转www.xxx.com/info/时也能访问第一页
    if index == '':
        index = 1
    #返回指定（index）页面的数据，用于呈现在指定页上
    page = pag.page(index)
    #构造上下文，以便html文件中能调用对应的数据
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
    max = Demand.objects.filter().aggregate(au=Max('bounty'))
    print(max)
    context = {
        'user_tel':user_tel,
        'user':user,
        'page':page,
         'max':max,
    }
    return render(request,'zj_demand/index.html',context)

def publish_type(request):
    user_tel = request.session.get('user_tel')
    user = request.session.get('user')

    context = {
            'user_tel':user_tel,
            'user':user,
        }
    return  render(request,'zj_demand/myweb1.html',context)

def demand(request):
    user_tel = request.session.get('user_tel')
    user = request.session.get('user','')
    print(user_tel)
    print(user)
    print(type(user))
    if user_tel != None:
        if user != None:
            person = Personal_Center.objects.filter(atname=user).values('position', 'industry')
            print(person)
            context = {
                'user_tel':user_tel,
                'user':user,
                'person':person,
            }
            return render(request,'zj_demand/myweb2.html',context)
        else:
            return HttpResponse('请先完成个人信息设置！')
    else:
        return render(request,'login.html')
def demand_handler(request):
    #取出了存在session里的user值
    user = request.session.get('user')
    if user != None:
        second_display_name = request.POST.get('second')
        # 打印出二级分类中的一个对象--·（[属性]）
        second_display = Second_Display.objects.get(s_name=second_display_name)
        print(second_display)

        second_display_id = second_display.id
        #第一个主题
        title = request.POST.get('title')
        #第二个
        details = request.POST.get('details')
        my_add_service = request.POST.get('add_service')
        print(my_add_service)
        taocan = request.POST.get('taocan')
        #地域选择没有存倒数具库
        address = request.POST.get('address')
        print(address)
        demand_tel = request.POST.get('demand_tel')
        bounty = request.POST.get('bounty')
        try:
        #传图片
            image = request.FILES.get('images')
            img = open(os.path.join('static','IMG',image.name),'wb')

            for im in image.chunks():
                img.write(im)
            img.close()
            #demand = Demand()
            #demand.img = img.name
            #传文件
            files = request.FILES.get('files')
            file = open(os.path.join('static', 'Fil', files.name), 'wb')
            for fp in files.chunks():
                file.write(fp)
            file.close()
            demand_date = request.POST.get('demand_date')
            #print(str_demand_date)
            #print(type(str_demand_date))
            #demand_date =datetime.datetime.strptime(str_demand_date,'%Y-%m-%d'),
            #找出demand对应的两个外健的值
            personal = Personal_Center.objects.get(atname=user)
            personal_center_id = personal.id
            d = Demand()
            f= file.name
            i = img.name

            #传两个外健的值不然会报错
            print(demand_date)
            if my_add_service =='':
                add_service =0
                d.create(personal_center_id, second_display_id, title, details
                         , taocan, demand_tel,
                         bounty, i, f, demand_date, add_service, address)
                context = {'user': user, }
                return render(request,'zj_demand/demand_success.html',context)
            else:
                add_service =my_add_service
                d.create(personal_center_id,second_display_id,title,details
                    ,taocan,demand_tel,
                    bounty,i,f,demand_date,add_service,address)
                print('--------------------------------')
        #person = Personal_Center.objects.filter(atname=user).values('position','industry')
        #print(person)
                context = {'user':user,}
                return render(request,'zj_demand/demand_success.html',context)
        except Exception as e:
            print(e)
            return HttpResponse('除增值服务外其他不能为空！')
    else:
        return  HttpResponse('请先登录或注册')


def comment(request,index1,index,index2):
    user_tel = request.session.get('user_tel')
    print(user_tel)
    user = request.session.get('user')
    print(user)
    print(type(user))

    dem = Demand.objects.filter(Q(id=index) & Q(personal_center__id=index1)).annotate(au=Count('comment__id')).\
            values('title', 'au', 'second_display__s_name',
                'personal_center__position', 'demand_tel',
                'onclick', 'personal_center__brand', 'details',
                'address', 'date', 'personal_center__mypic',
                'personal_center__atname','bounty','personal_center__company','personal_center__cprofile','id')
    print(dem)
    #找出这个用户自己所有的帖子的名字
    bo =Personal_Center.objects.filter(atname=user).\
            values('demand__title','demand__date','demand__id')

    ha = Personal_Center.objects.filter(atname=user).values('atname','mypic')
    #找出这个帖子的评论内容 和 评论的人

    ao = Comment.objects.filter(Q(demand_id=index) & Q(demand__personal_center__id=index1)).\
            values('demand__personal_center__mypic', 'demand__personal_center__atname',
               'demand__personal_center__company', 'demand__personal_center__position',
               'comment_time', 'content', 'id')

    # 使用Paginator方法返回一个分页的对象
    # 这个对象包括岁哦有数据，分页情况
    pag = paginator.Paginator(ao, 4)
    # 使用此判断语句为了在用户跳转www.xxx.com/info/时也能访问第一页
    if index2== '':
        index2 = 1
    # 返回指定（index）页面的数据，用于呈现在指定页上
    page = pag.page(index2)
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
    print(bo)
    print(ao)
    context = {
        'user_tel':user_tel,
        'user':user,
        'dem':dem,
        'bo':bo,
        'page':page,
        'ha':ha,
    }
    return  render(request,'zj_demand/myweb4.html',context)

def comment_handler(request):
    user_tel = request.session.get('user_tel')
    user = request.session.get('user','')
    if user_tel != None:
        if user !=None:
            content = request.POST.get('content')
            index = request.POST.get('demand_id')
            com = Comment()
            com.content = content
            com.demand_id = index
            com.save()
            print(type(index))
            context = {
                'user': user,
                'id':index,
            }
    #提交评论实现局部刷新，增加评论.
            return  render(request,'zj_demand/demand_success.html',context)
        else:
            return HttpResponse('请先完成个人信的设置')
    else:
        return render(request,'login.html')