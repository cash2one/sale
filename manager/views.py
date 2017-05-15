# -*- coding:utf-8 -*-
from django.shortcuts import render,HttpResponse,redirect
from django import forms
from django.forms import widgets
from manager import models
import json,chardet,sys

# Create your views here.

class AddProduct(forms.Form):
    pname = forms.CharField(
        error_messages={"required":"名称不能为空"},
        widget=widgets.TextInput(attrs={"class":"form-control","id":"name","placeholder":"商品名称"})
    )
    cost = forms.CharField(
        error_messages={"required":"成本不能为空"},
        widget=widgets.TextInput(attrs={"class":"form-control","id":"cost","placeholder":"进价"})
    )
    price = forms.CharField(
        error_messages={"required":"售价不能为空"},
        widget=widgets.TextInput(attrs={"class":"form-control","id":"price","placeholder":"售价"})
    )
    number = forms.CharField(
        error_messages={"required":"进货量不能为空"},
        widget=widgets.TextInput(attrs={"class":"form-control","id":"number","placeholder":"进货量"})
    )
    stok = forms.CharField(
        widget=widgets.TextInput(attrs={"id":"stok","style":"display: none"})
    )

class AddStaff(forms.Form):
    sname = forms.CharField(
        error_messages={"required":"姓名不能为空"},
        widget=widgets.TextInput(attrs={"class":"form-control","id":"sname","placeholder":"姓名"})
    )
    spassword = forms.CharField(
        error_messages={"required":"密码不能为空"},
        widget=widgets.PasswordInput(attrs={"class":"form-control","id":"spassword","placeholder":"密码"})
    )
    sex = forms.Field(
        error_messages={"required":"性别不能为空"},
        widget=widgets.Select(attrs={"class":"form-control","id":"sex"},choices=(("男","男"),("女","女")))
    )
    age = forms.IntegerField(
        error_messages={"required":"年龄不能为空"},
        widget=widgets.TextInput(attrs={"class":"form-control","id":"age","placeholder":"年龄"})
    )
    stelphone = forms.IntegerField(
        error_messages={"required":"电话不能为空"},
        widget=widgets.TextInput(attrs={"class":"form-control","id":"stelphone","placeholder":"电话号码"})
    )
    department = forms.Field(
        error_messages={"required":"部门不能为空"},
        widget=widgets.Select(attrs={"class":"form-control","id":"department"},choices=(("市场","市场"),("财务","财务"),("行政","行政")))
    )
    role = forms.Field(
        error_messages={"required":"职位不能为空"},
        widget=widgets.Select(attrs={"class":"form-control","id":"role"},choices=(("销售","销售"),("会计","会计"),("行政","行政")))
    )

class Login(forms.Form):
    username = forms.CharField(
        error_messages={"required":"用户名不能为空"},
        widget=widgets.TextInput(attrs={"class":"placeholder","placeholder":"用户名"})
    )
    password = forms.CharField(
        error_messages={"required":"密码不能为空"},
        widget=widgets.PasswordInput(attrs={"class":"placeholder","placeholder":"密码"})
    )

class Customer(forms.Form):
    cname = forms.CharField(
        error_messages={'required':'用户姓名不能为空'},
        widget=widgets.TextInput(attrs={'class':'form-control','id':'name','placeholder':'客户姓名'})
    )
    ctelphone = forms.CharField(
        error_messages={'required':'客户联系方式不能为空'},
        widget=widgets.TextInput(attrs={'class':'form-control','id':'ctelphone','placeholder':'电话'})
    )
    car = forms.CharField(
        required=False,
        widget=widgets.TextInput(attrs={'class':'form-control','id':'car','placeholder':'车型'})
    )

class Deal(forms.Form):
    customer = forms.CharField(
        error_messages={'required':'客户不能为空'},
        widget=widgets.TextInput(attrs={"class":"form-control","id":"customer"})
    )

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
    if request.method == "GET":
        if role == "admin":
            data = models.Result.objects.all().values('customer__cname','staff__sname','product__pname','product__price','pay')
        elif role == "sale":
            data = models.Result.objects.filter(staff__sname=user).values('customer__cname','staff__sname','product__pname','product__price','pay')
        return render(request,'deal.html',{"role":role,"data":data,"user":user})
    elif request.method == "POST":
        pass

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