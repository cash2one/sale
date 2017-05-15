# -*- coding:utf-8 -*-
from django.db import models

# Create your models here.

class Customer(models.Model):
    cid = models.AutoField(primary_key=True)
    cname = models.CharField(max_length=32,null=False)
    ctelphone = models.CharField(null=False,max_length=32)
    car = models.CharField(max_length=64)
    create_time = models.DateTimeField(auto_now_add=True)

class Staff(models.Model):
    sid = models.AutoField(primary_key=True)
    sname = models.CharField(max_length=32,null=False)
    spassword = models.CharField(max_length=64,null=False)
    sex = models.CharField(max_length=16,null=False)
    age = models.IntegerField(null=False)
    stelphone = models.CharField(null=False,max_length=32)
    department = models.CharField(default="销售部",max_length=32)
    role = models.CharField(default="salesman",null=False,max_length=32)

class Product(models.Model):
    pid = models.AutoField(primary_key=True)
    pname = models.CharField(max_length=64,null=False)
    cost = models.CharField(null=False,max_length=32)
    price = models.CharField(null=False,max_length=32)
    number = models.IntegerField(null=False)
    stok = models.IntegerField(null=False)

class Result(models.Model):
    customer = models.ForeignKey(to=Customer,to_field='cid')
    staff = models.ForeignKey(to=Staff,to_field='sid')
    product = models.ForeignKey(to=Product,to_field='pid')
    pay = models.CharField(max_length=64,null=False)