# -*- coding:utf-8 -*-
from django.shortcuts import render,HttpResponse,redirect
from django import forms
from django.forms import widgets as dwidgets
from manager import models
import json,datetime,time
from django.forms import fields

# Create your views here.

class AddProduct(forms.Form):
    pname = forms.CharField(
        error_messages={"required":"名称不能为空"},
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"name","placeholder":"商品名称"})
    )
    cost = forms.CharField(
        error_messages={"required":"成本不能为空"},
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"cost","placeholder":"进价"})
    )
    price = forms.CharField(
        error_messages={"required":"售价不能为空"},
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"price","placeholder":"售价"})
    )
    number = forms.CharField(
        error_messages={"required":"进货量不能为空"},
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"number","placeholder":"进货量"})
    )
    stok = forms.CharField(
        widget=dwidgets.TextInput(attrs={"id":"stok","style":"display: none"})
    )

class AddStaff(forms.Form):
    sname = forms.CharField(
        error_messages={"required":"姓名不能为空"},
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"sname","placeholder":"姓名"})
    )
    spassword = forms.CharField(
        error_messages={"required":"密码不能为空"},
        widget=dwidgets.PasswordInput(attrs={"class":"form-control","id":"spassword","placeholder":"密码"})
    )
    sex = forms.Field(
        error_messages={"required":"性别不能为空"},
        widget=dwidgets.Select(attrs={"class":"form-control","id":"sex"},choices=(("男","男"),("女","女")))
    )
    age = forms.IntegerField(
        error_messages={"required":"年龄不能为空"},
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"age","placeholder":"年龄"})
    )
    stelphone = forms.IntegerField(
        error_messages={"required":"电话不能为空"},
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"stelphone","placeholder":"电话号码"})
    )
    department = forms.Field(
        error_messages={"required":"部门不能为空"},
        widget=dwidgets.Select(attrs={"class":"form-control","id":"department"},choices=(("市场","市场"),("财务","财务"),("行政","行政")))
    )
    role = forms.Field(
        error_messages={"required":"职位不能为空"},
        widget=dwidgets.Select(attrs={"class":"form-control","id":"role"},choices=(("销售","销售"),("会计","会计"),("行政","行政")))
    )
    basic = forms.IntegerField(
        required=False,
        initial=3000,
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"basic","placeholder":"底薪"})
    )

class Login(forms.Form):
    username = forms.CharField(
        error_messages={"required":"用户名不能为空"},
        widget=dwidgets.TextInput(attrs={"class":"placeholder","placeholder":"用户名"})
    )
    password = forms.CharField(
        error_messages={"required":"密码不能为空"},
        widget=dwidgets.PasswordInput(attrs={"class":"placeholder","placeholder":"密码"})
    )

class Customer(forms.Form):
    cname = forms.CharField(
        error_messages={'required':'用户姓名不能为空'},
        widget=dwidgets.TextInput(attrs={'class':'form-control','id':'name','placeholder':'客户姓名'})
    )
    ctelphone = forms.CharField(
        error_messages={'required':'客户联系方式不能为空'},
        widget=dwidgets.TextInput(attrs={'class':'form-control','id':'ctelphone','placeholder':'电话'})
    )
    car = forms.CharField(
        required=False,
        widget=dwidgets.TextInput(attrs={'class':'form-control','id':'car','placeholder':'车型'})
    )

class Deal(forms.Form):
    # customer_id = forms.ModelChoiceField(
    #     error_messages={'required':'客户姓名不能为空'},
    #     widget=dwidgets.Select(attrs={"class":"form-control","id":"customer"}),
    #     # choices=models.Customer.objects.all().values_list('cid', 'cname'),
    # )
    #
    # staff_id = fields.ChoiceField(
    #     error_messages={'required':'出单员工不能为空'},
    #     widget=dwidgets.Select(attrs={"class":"form-control","id":"staff"}),
    #     choices=models.Staff.objects.exclude(role='admin').values_list('sid', 'sname'),
    # )
    #
    # product_id = fields.ChoiceField(
    #     widget=dwidgets.Select(attrs={"class":"form-control","id":"product"}),
    #     choices=models.Product.objects.all().values_list('pid', 'pname'),
    # )
    pay = fields.CharField(
        error_messages={'required':'成交价不能为空'},
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"price"})
    )
    number = fields.IntegerField(
        error_messages={'required':'购买数量不能为空'},
        min_value=1,
        initial=1,
        widget=dwidgets.TextInput(attrs={"class":"form-control","id":"number"})
    )

    # def __init__(self,*args,**kwargs):
    #     super(Deal,self).__init__(*args,**kwargs)
    #     self.fields['customer_id'].choice = models.Customer.objects.all().values_list('cid', 'cname')
    #     self.fields['staff_id'].choice = models.Staff.objects.exclude(role='admin').values_list('sid', 'sname')
    #     self.fields['product_id'].choice = models.Product.objects.all().values_list('pid', 'pname')

def auth(func):
    def inner(request,*args,**kwargs):
        if request.session.get("is_login", None):
            return func(request, *args, **kwargs)
        else:
            return redirect("/login/")
    return inner

def getrole(request):
    r = request.session.get("role",None)
    if r == "admin":
        role = r
    elif r == "销售":
        role = "sale"
    elif r == "会计":
        role = "accounting"
    return role

def login(request):
    if request.method == "GET":
        login_obj = Login()
        return render(request,'login.html',{'data':login_obj})
    elif request.method == "POST":
        login_obj = Login(request.POST)
        res = login_obj.is_valid()
        if res:
            username = request.POST.get('username',None)
            passwd = request.POST.get('password',None)
            auth_res = models.Staff.objects.filter(sname=username,spassword=passwd).values('sname','role')
            if auth_res:
                request.session['username'] = username
                request.session['is_login'] = True
                request.session['role'] = auth_res[0]['role']
                request.session.set_expiry(0)
                return redirect("/")
        return redirect("/login/")

def logout(request):
    del request.session['is_login']
    return redirect('/login/')

@auth
def index(request):
    role = getrole(request)
    user = request.session['username']
    response = render(request,'index.html',{"role":role,"user":user})
    return response

@auth
def product(request):
    role = getrole(request)
    if request.method == "GET":
        proobj = AddProduct()
        data = models.Product.objects.all()
        user = request.session['username']
        return render(request,'product.html',{"role":role,'obj':proobj,'data':data,"user":user})
    elif request.method == "POST":
        proobj = AddProduct(request.POST)
        res = proobj.is_valid()
        models.Product.objects.create(**proobj.cleaned_data)
        return redirect("/product/")

@auth
def delprodect(request):
    data = {}
    if request.method == "POST":
        del_id = request.POST.get('pid',None)
        del_id = int(del_id)
        models.Product.objects.filter(pid=del_id).delete()
        data['status'] = "OK"
        return HttpResponse(json.dumps(data))
    else:
        return redirect("/product/")

@auth
def deal(request):
    role = getrole(request)
    user = request.session['username']
    all_cus = models.Customer.objects.all().values_list('cid', 'cname')
    all_staff = models.Staff.objects.filter(role='销售').values_list('sid', 'sname')
    all_pro = models.Product.objects.all().values_list('pid', 'pname')
    if request.method == "GET":
        dealobj = Deal()
        if role == "admin":
            data = models.Result.objects.all().values('customer__cname','staff__sname','product__pname','product__price','pay','dealtime','number')
        elif role == "sale":
            data = models.Result.objects.filter(staff__sname=user).values('customer__cname','staff__sname','product__pname','product__price','pay','dealtime','number')
        return render(request,'deal.html',{"role":role,"data":data,"user":user,'obj':dealobj,"all_cus":all_cus,"all_staff":all_staff,"all_pro":all_pro})
    elif request.method == "POST":
        dealobj = Deal(request.POST)
        tag = dealobj.is_valid()
        if tag:
            deal_data = dealobj.cleaned_data
            customer_id = request.POST.get('customer_id',None)
            staff_id = request.POST.get('staff_id',None)
            product_id = request.POST.get('product_id',None)
            customer_id,staff_id,product_id = int(customer_id),int(staff_id),int(product_id)
            deal_data['customer_id'] = request.POST.get('customer_id',None)
            deal_data['staff_id'] = request.POST.get('staff_id',None)
            deal_data['product_id'] = request.POST.get('product_id',None)
            res_dic = {}
            stoktag = checkstock(request)
            if stoktag[0]:
                newstok = stoktag[1]['stok'] - stoktag[1]['number']
                models.Product.objects.filter(pid=stoktag[1]['pid']).update(stok=newstok)
                models.Result.objects.create(**deal_data)
                res_dic['status'] = "OK"
            else:
                res_dic['status'] = 'error'
                res_dic['msg'] = '库存不足，该商品剩余%s件' %stoktag[1]['stok']
            return HttpResponse(json.dumps(res_dic))
        else:
            return HttpResponse('error')

@auth
def checkstock(request):
    pid = request.POST.get('product_id')
    num = request.POST.get('number')
    pid,num = int(pid),int(num)
    stok = models.Product.objects.filter(pid=pid).values_list('stok')[0][0]
    if  num > stok:
        return (0,{"pid":pid,"stok":stok,"number":num})
    else:
        return (1,{"pid":pid,"stok":stok,"number":num})

@auth
def customer(request):
    role = getrole(request)
    user = request.session['username']
    if request.method == "GET":
        cusobj = Customer()
        data = models.Customer.objects.all().values()
        return render(request,'customer.html',{"role":role,"data":data,"user":user,'obj':cusobj})
    elif request.method == "POST":
        res_data = {}
        cusobj = Customer(request.POST)
        res = cusobj.is_valid()
        if res:
            name = cusobj.cleaned_data['cname']
            tel = cusobj.cleaned_data['ctelphone']
            check = models.Customer.objects.filter(cname=name,ctelphone=tel)
            if check:
                res_data['status'] = 'ERROR'
                res_data['msg'] = '客户已存在'
                return HttpResponse(json.dumps(res_data))
            else:
                models.Customer.objects.create(**cusobj.cleaned_data)
                res_data['status'] = 'OK'
                res_data['msg'] = '客户录入成功'
                return HttpResponse(json.dumps(res_data))
        else:
            res_data['status'] = 'ERROR'
            res_data['msg'] = '输入数据错误'
            return HttpResponse(json.dumps(res_data))

@auth
def staff(request):
    role = getrole(request)
    user = request.session['username']
    if request.method == "GET":
        staobj = AddStaff()
        data = models.Staff.objects.all().values()
        return render(request,'staff.html',{"role":role,"data":data,"obj":staobj,"user":user})
    elif request.method == "POST":
        staobj = AddStaff(request.POST)
        res = staobj.is_valid()
        if res:
            models.Staff.objects.create(**staobj.cleaned_data)
        return redirect("/staff/")

@auth
def delstaff(request):
    res = {}
    if request.method == "POST":
        del_sid = request.POST.get('sid',None)
        if del_sid:
            models.Staff.objects.filter(sid=del_sid).delete()
            res['status'] = "OK"
        else:
            res['status'] = 'ERROR'
        return HttpResponse(json.dumps(res))
    else:
        return redirect('/staff/')

@auth
def salary(request):
    role = getrole(request)
    user = request.session['username']
    local = time.localtime()
    local_year = local.tm_year
    allstaff = models.Staff.objects.exclude(role='admin').values()
    if request.method == "GET":
        month = [x for x in range(1, 13)]
        year = [y for y in range(local_year - 2, local_year + 3)]
        data = models.Salary.objects.all().values('staff__sname','staff__department','staff__role','staff__basic','commission','month','final')
        return render(request,'salary.html',{'role':role,'user':user,"year":year,"month":month,'data':data})
    elif request.method == "POST":
        year = request.POST.get('year',None)
        month = request.POST.get('month',None)
        month_str = "%s-%s" %(year,month)
        createsalary(request,allstaff)
        commission_list = calculatesalary(request,allstaff)
        for line in commission_list:
            sid = line['sid']
            commission = line['commission']
            for l in allstaff:
                if l['sid'] == sid:
                    basic = int(l['basic'])
            final = basic + commission
            data_dic = {}
            data_dic['staff_id'],data_dic['commission'],data_dic['month'],data_dic['final'] = sid,commission,month_str,final
            models.Salary.objects.filter(staff_id=sid,month=month_str).update(**data_dic)
        return redirect("/salary/")

@auth
def createsalary(request,staff):
    createyear = request.POST.get('year',None)
    createmonth = request.POST.get('month',None)
    if createyear and createmonth:
        month = "%s-%s" %(createyear,createmonth)
        for item in staff:
            sid = item['sid']
            salary_tag = models.Salary.objects.filter(staff_id=sid,month=month)
            if not salary_tag:
                models.Salary.objects.create(staff_id=sid,month=month)

@auth
def calculatesalary(request,staff):
    if request.method == "POST":
        year = request.POST.get('year', None)
        month = request.POST.get('month', None)
        year,month = int(year),int(month)
        start = datetime.datetime(year, month, 1, 0, 0)
        if month == 12:
            year += 1
            month = 1
            end = datetime.datetime(year, month, 1, 0, 0)
        else:
            end = datetime.datetime(year, month+1, 1, 0, 0)
        all_result = models.Result.objects.filter(dealtime__range=(start,end)).values('staff_id','product__cost','number','pay')
        result = []
        for item in all_result:
            pay = item['pay']
            pay = int(pay)
            profit = pay*item['number'] - int(item['product__cost'])*int(item['number'])
            commission = int(profit*0.15)
            item['profit'] = profit
            item['commission'] = commission
            result.append(item)
        r = []
        for s in staff:
            tmp = []
            c = {}
            for line in result:
                if line['staff_id'] == s['sid']:
                    commission = line['commission']
                    tmp.append(commission)
            sum_commission = 0
            for i in tmp:
                sum_commission += i
            c['sid'] = s['sid']
            c['commission'] = sum_commission
            r.append(c)
        return r