from django.db import models
from django.contrib.auth.models import User
from datetime import datetime
# Create your models here.

class Company(models.Model):
    name = models.CharField(max_length=100)
    contact_no = models.IntegerField()
    pincode = models.IntegerField(unique=True)
    gst_no = models.CharField(unique=True,max_length=30)
    user_id = models.ForeignKey(User,on_delete=models.CASCADE)



class Category(models.Model):
    category_name = models.CharField(max_length=100)


class Customer(models.Model):
    name = models.CharField(max_length=100)
    ph_no = models.IntegerField()
    pincode = models.IntegerField()
    address = models.CharField(max_length=500)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)


class Product(models.Model):
    name = models.CharField(max_length=300)
    price = models.IntegerField()
    quantity = models.IntegerField()
    offer = models.IntegerField(default=0)
    offer_price = models.FloatField(default=0)
    img = models.FileField(upload_to='media',null=True)
    description = models.TextField()
    company_id = models.ForeignKey(Company,on_delete=models.CASCADE)
    category_id = models.ForeignKey(Category,on_delete=models.CASCADE)


class Bill(models.Model):
    date = models.DateField(default=datetime.now())
    amount = models.IntegerField()
    customer_id = models.ForeignKey(Customer,on_delete=models.CASCADE)
    payment_type = models.CharField(max_length=100)
    shippingAddress = models.TextField(null=True)
    phoneNo = models.IntegerField(null=True)
    

class Cart(models.Model):
    customer_id = models.ForeignKey(Customer, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product,on_delete=models.CASCADE)
    bill_id = models.ForeignKey(Bill,on_delete=models.CASCADE,null=True)
    qty = models.IntegerField(null=True)
    company  =models.ForeignKey(Company,on_delete=models.CASCADE,null=True)


class WishList(models.Model):
    cust = models.ForeignKey(Customer,on_delete=models.CASCADE)
    product = models.ForeignKey(Product,on_delete=models.CASCADE)

