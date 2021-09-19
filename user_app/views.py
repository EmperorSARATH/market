from django.shortcuts import render,redirect
from django.contrib.auth.models import User
from django.db import models
from myapp.models import *
from restapp.serializer import *
from django import template
import datetime
register = template.Library()
# Create your views here.

@register.simple_tag()
def multipy(qty,price):
    return qty * price


def user_home(request):
	return render(request,'user/base.html',{})


def user_shop(request):
	p = Product.objects.all()
	c = Category.objects.all()
	return render(request,'user/shop.html',{'p':p,'c':c})


def product_single(request,pid):
	p = Product.objects.get(id=pid)
	return render(request,'user/single.html',{'p':p})


def user_add_cart(request):
	if request.method == 'POST':		
		u = request.user.id
		u = Customer.objects.get(user_id=u)
		qty = request.POST.get('quantity')
		pid = request.POST.get('id')
		p = Product.objects.get(id=pid)
		com = Company.objects.get(id=p.company_id.id)
		c = Cart()
		c.customer_id = u
		c.product_id=p
		c.qty = qty
		c.company = com
		c.save()
		print(pid,qty)
		cartItems = Cart.objects.filter(customer_id=u.id,bill_id__isnull=True).count()
		request.session['cartItems']=cartItems
		p = Product.objects.all()
		c = Category.objects.all()
		return render(request,'user/shop.html',{'m':'Added to cart','itemCounts':cartItems,'p':p,'c':c})
	else:
		pass


def payment(request):
	if request.method=='POST':
		u = request.user.id
		u = Customer.objects.get(user_id=u)
		b = Bill()
		b.date = datetime.datetime.now()
		b.amount = request.POST.get('txtamt')
		b.customer_id = u
		b.payment_type = request.POST.get('optradio')
		b.shippingAddress = request.POST.get('txtname')+" "+request.POST.get('txtlname')+", "+request.POST.get('txtstate')+", "+request.POST.get('txtstreet')+", "+request.POST.get('txtapt')+", "+request.POST.get('txtcity')+", "+request.POST.get('txtpostal')
		b.phoneNo = request.POST.get('txtph')
		b.save()
		request.session['cartItems']=0
		c = Cart.objects.filter(customer_id=u,bill_id__isnull=True)
		for x in c:
			p = Product.objects.get(id=x.product_id.id)
			p.quantity = p.quantity-int(x.qty)
			p.save()
		Cart.objects.filter(customer_id=u,bill_id__isnull=True).update(bill_id=b)
		return render(request,'user/payment.html',{'m':'Successfull'})
	else:
		pass


def view_cart(request):
	u = request.user.id
	u = Customer.objects.get(user_id=u)
	c = Cart.objects.filter(customer_id = u.id,bill_id__isnull=True)
	t = 0
	for x in c:
		if x.product_id.offer==0:
			t+=x.qty*x.product_id.price
		else:
			t+=x.qty*x.product_id.offer_price
	print('Total:',t)	
	# -----------------recommentaions----------------------------
	CartProduct = Cart.objects.filter(customer_id=u).values_list('product_id').distinct()
	print(CartProduct,'CartProduct')
	recommentaionsList = []
	for x in CartProduct:
		productId=x
		billId = Cart.objects.filter(product_id=productId).values_list('bill_id').distinct()
	    # billId = list(billId)
		print("Bill Ids:",billId)
		purchasedProducts=Cart.objects.filter(bill_id__isnull=False,bill_id__in=billId).exclude(product_id=productId).values_list('product_id').distinct()
		#Unique products that are purchased by user    
		purchasedProducts=list(purchasedProducts)
		print("Purchased Products",purchasedProducts)
		#find the count for each product and bind it with that
		productsWithCount={}
		for x in purchasedProducts:
			for y in x:
				print("Product Id:",y)
				productsWithCount[y]=Cart.objects.filter(product_id=y).count()
		print("Product With Count:",productsWithCount)
		sortedProductsWithCount={}
	    # for x in sorted(productsWithCount):
	    #     sortedProductsWithCount[x]=productsWithCount[x]
	    # print(sortedProductsWithCount,"Sorted List")

		sortedProductsWithCount = sorted(productsWithCount.items(),key=lambda kv:(kv[1],kv[0]))
		print("sortedProductsWithCount Initial:",sortedProductsWithCount)

		# sortedProductsWithCount={v: k for k, v in sortedProductsWithCount.items()}
		# print("sortedProductsWithCount",sortedProductsWithCount)
		sortedProductsWithCount = [i for i in reversed(sortedProductsWithCount)]
		print("sortedProductsWithCount",sortedProductsWithCount)


		finalProducts = {}
		for x in sortedProductsWithCount:
			finalProducts[x[0]]=x[1]

		print("Final Product :",finalProducts)

		for x in finalProducts:
			p = Product.objects.get(id=x)
			p = ProductSerializer(p)
			d={}
			d['id']=p.data['id']
			d['name']=p.data['name']
			d['price']=p.data['price']
			d['quantity']=p.data['quantity']
			d['offer']=p.data['offer']
			d['offer_price']=p.data['offer_price']
			d['img']=p.data['img']
			print(p.data['id'])
			recommentaionsList.append(d)
	print('ProductRecommentaions',recommentaionsList)

	return render(request,'user/cart.html',{'c':c,'t':t,'r':recommentaionsList})



def item_remove(request,cid):
	c = Cart.objects.get(id=cid)
	c.delete()
	u = request.user.id
	u = Customer.objects.get(user_id=u)
	cartItems = Cart.objects.filter(customer_id=u.id,bill_id__isnull=True).count()
	request.session['cartItems']=cartItems
	return redirect(view_cart)


def cat_product(request,cid):
	if not Product.objects.filter(category_id=cid):
		c = Category.objects.all()
		return render(request,'user/shop.html',{'c':c,'a':'Nothing to Display'})
	p = Product.objects.filter(category_id=cid)
	c = Category.objects.all()
	return render(request,'user/shop.html',{'p':p,'c':c})


def user_checkout(request):
	u = request.user.id
	u = Customer.objects.get(user_id=u)
	total = 0
	c = Cart.objects.filter(customer_id=u,bill_id__isnull=True)
	for x in c:
		t = x.qty*x.product_id.price
		total+=t
	print(total,'Total')
	return render(request,'user/payment.html',{'t':total})


def userOrder(request):
	u = request.user.id
	u = Customer.objects.get(user_id=u)
	c = Cart.objects.filter(customer_id=u,bill_id__isnull=False)
	return render(request,'user/userOrder.html',{'o':c})