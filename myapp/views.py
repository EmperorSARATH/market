from django.shortcuts import render,redirect
from django.contrib import auth
from django.contrib.auth import login, authenticate,logout
from django.contrib.auth.models import User
from django.db import models
from myapp.models import *
from django.db.models import Q
from django import template
register = template.Library()

# Create your views here.

@register.simple_tag()
def multipy(qty,price):
    return qty * price


def index(request):
    p = Product.objects.all()
    return render(request,'index.html',{'p':p})


def cart(request):
    return render(request,'cart.html',{})


def shop(request):
    return render(request,'shop.html',{})


def reg(request):
    if request.method=='POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        phone = request.POST.get('contact')
        gst = request.POST.get('gst')
        pincode = request.POST.get('pincode')
        password = request.POST.get('password')
        u = User()
        u.username = email
        u.password = password
        u.is_active = 0
        u.last_name = 'Company'
        u.save()

        c = Company()
        c.user_id = u
        c.name = name
        c.gst_no = gst
        c.pincode = pincode
        c.contact_no = phone
        c.save()
        return render(request, 'login.html', {'r':'Registered'})
    else:
        return render(request,'registration.html',{})


def login1(request):
    if request.method == 'POST':
        uname = request.POST.get('txtusername')
        password = request.POST.get('txtpass')
        print(uname)
        print(password)
        # user = auth.authenticate(request,username=uname,password=password)
        # if user is not None:
        #     auth.login(request,user)
   
        if User.objects.filter(username=uname,password=password,is_active=1).exists():
            # user = authenticate(request,username=uname,password=password)
            u = User.objects.get(username=uname,password=password,is_active=1)
            request.session['mem_id'] = u.id
            if u.last_name == 'Admin':
                login(request,u)
                return render(request, 'system_admin/home.html', {})
            elif u.last_name == 'Company':
                login(request,u)
                return render(request,'comp_admin/add_products.html',{})
            elif u.last_name == 'Customer':
                login(request,u)
                c = Customer.objects.get(user_id=u.id)
                cartItems = Cart.objects.filter(customer_id=c.id,bill_id__isnull=True).count()
                request.session['cartItems']=cartItems
                p = Product.objects.all()
                c = Category.objects.all()
                return render(request,'user/shop.html',{'itemCounts':cartItems,'p':p,'c':c})
        else:
            return render(request, 'login.html', {'r':'invalid'})
    else:
        return render(request,'login.html',{})


def approve_comp(request):
    c = Company.objects.raw(" SELECT * FROM myapp_company WHERE user_id_id IN(SELECT id FROM auth_user WHERE is_active=0 and last_name='Company') ")
    return render(request,'system_admin/approve.html',{'r': c})


def view_comp(request):
    c = Company.objects.raw("SELECT * FROM myapp_company WHERE user_id_id IN(SELECT id FROM auth_user WHERE is_active=1 and last_name='Company') ")
    return render(request, 'system_admin/view_comp.html', {'r':c})


def logout1(request):
    logout(request)
    p = Product.objects.all()
    return render(request,'index.html',{'p':p})


def category(request):
    if request.method=='POST':
        cat = request.POST.get('txtcat')
        c = Category()
        c.category_name = cat
        c.save()
        return render(request, 'system_admin/category.html', {'r':'Registered'})
    else:
        return render(request,'system_admin/category.html',{})


def view_category(request):
    c = Category.objects.all()
    return render(request,'system_admin/view_cat.html',{'r':c})


def homeadmin(request):
    return render(request,'system_admin/home.html',{})


def appcompany(request,uid):
    print(type(uid))
    c = Company.objects.get(user_id_id=int(uid))
    u = User.objects.get(id=c.user_id_id)
    u.is_active = 1
    u.save()
    c = Company.objects.raw(" SELECT * FROM myapp_company WHERE user_id_id IN(SELECT id FROM auth_user WHERE is_active=0 and last_name='Company') ")
    return render(request, 'system_admin/approve.html', {'r': c})


def add_products(request):
    if request.method=='POST':
        u = request.user
        u = User.objects.get(username=u)
        print(u,'1111111111111111')
        c  = Company.objects.get(user_id=u.id)
        print(c,'222222222222')
        p = Product()
        p.name = request.POST.get('txtname')
        p.price = request.POST.get('txtprice')
        p.quantity = request.POST.get('quantity')
        p.img = request.FILES['img']
        # pim =  request.FILES['img']
        # print('pim')
        p.description = request.POST.get('description')
        p.company_id = c
        catid = request.POST.get('catid')
        catid = Category.objects.get(id=catid)
        p.category_id = catid
        p.save()
        c = Category.objects.all()
        return render(request,'comp_admin/add_products.html',{'d':'Product Added','r':c})
        # p.company_id=
    else:
        u = request.user
        print(u,'1111111111111111')
        c = Category.objects.all()
        return render(request,'comp_admin/add_products.html',{'r':c})


def view_products(request):
    u = request.user
    u = User.objects.get(username=u)
    c = Company.objects.get(user_id=u.id)
    p = Product.objects.filter(company_id=c.id)
    return render(request,'comp_admin/view_products.html',{'d':p})


def view_offers(request):
    u = request.user
    u = User.objects.get(username=u)
    c = Company.objects.get(user_id=u.id)
    p = Product.objects.filter(~Q(offer=0),company_id=c.id)
    return render(request,'comp_admin/view_offers.html',{'d':p})


def company_home(request):
    return render(request,'comp_admin/home.html',{})


def add_offers(request):
    if request.method=='POST':
        p = Product.objects.get(id=request.POST.get('txtid'))
        p.offer = request.POST.get('txtoffer')
        p.offer_price = request.POST.get('txtoprice')
        p.save()
        u = request.user
        u = User.objects.get(username=u)
        c = Company.objects.get(user_id=u.id)
        p = Product.objects.filter(company_id=c.id)
        return render(request,'comp_admin/add_offers.html',{'d':p,'m':'Offer Added'})
    else:
        u = request.user
        u = User.objects.get(username=u)
        c = Company.objects.get(user_id=u.id)
        p = Product.objects.filter(company_id=c.id)
        return render(request,'comp_admin/add_offers.html',{'d':p})


def viewOrders(request):
    u = request.user.id
    c = Company.objects.get(user_id=u)
    orederedItems = Cart.objects.filter(bill_id__isnull=False,company=c).order_by('bill_id')
    return render(request,'comp_admin/viewOrder.html',{'o':orederedItems})



def companyPlaceOrder(request):
    pass

def delcat(request,cid):
    cid = Category.objects.get(id=cid)
    cid.delete()
    return redirect(view_category)

def delproducts(request,pid):
    pid = Product.objects.get(id=pid)
    pid.delete()
    return redirect(view_products)



def editcat(request,cid):
    cid = Category.objects.get(id=cid)
    return render(request,'system_admin/editcat.html',{'cid':cid})


def updatecat(request):
    if request.method=='POST':
        cid =  request.POST.get('txtid')
        cat = request.POST.get('txtcat')
        c = Category.objects.get(id=cid)
        c.category_name= cat
        c.save()
        return redirect(view_category)

def editproducts(request,pid):
    pid = Product.objects.get(id=pid)
    c = Category.objects.all()
    return render(request,'comp_admin/editproducts.html',{'pid':pid,'c':c})


def updateproducts(request):
    if request.method=='POST':
        pid = request.POST.get('txtxid')
        p = Product.objects.get(id=pid)
        name =request.POST.get('txtname')
        price =request.POST.get('txtprice')
        quantity =request.POST.get('quantity')
        ProductCategory =request.POST.get('catid')
        description =request.POST.get('description')
        # Image =request.FILES['img']
        try:
            print('111111111111111111111')
            Image=request.FILES['img']
            print(Image)
            p.name=name
            p.price=price
            p.quantity=quantity
            p.ProductCategory=ProductCategory
            p.description=description
            p.img=Image
            p.save()
        except:
            print('222222222222222222222222222222')
            p.name=name
            p.price=price
            p.quantity=quantity
            p.ProductCategory=ProductCategory
            p.description=description
            p.save()
        return redirect(view_products)

def user_reg(request):
    if request.method=='POST':
        name = request.POST.get('name')
        ph_no = request.POST.get('ph_no')
        pincode = request.POST.get('pincode')
        address = request.POST.get('address')
        email = request.POST.get('email')
        password = request.POST.get('password')
      
        u = User()
        u.username = email
        u.password = password
        u.is_active = 1
        u.last_name = 'Customer'
        u.save()

        c = Customer()
        c.user_id = u
        c.name = name
        c.pincode = pincode
        c.ph_no = ph_no
        c.address = address
        c.save()
        return render(request, 'login.html', {'r':'Registered'})
    else:
        return render(request,'user_reg.html',{})
