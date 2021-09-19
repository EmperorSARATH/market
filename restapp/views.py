from django.shortcuts import render
from rest_framework.views import APIView
from restapp.serializer import *
from django.http import HttpResponse
from rest_framework.response import Response
from myapp.models import *
import datetime
# Create your views here.

class UserReg(APIView):
	def post(self,request,format=None):
		name = request.POST.get('name')
		ph = request.POST.get('ph')
		pin = request.POST.get('pincode')
		address = request.POST.get('address')
		email = request.POST.get('email')
		password = request.POST.get('password')
		if User.objects.filter(username=email,password=password).exists():
			return Response({"message": "Already Exists"})
		else:
			u = User()
			u.username = email
			u.password = password
			u.is_active = 0
			u.last_name = 'Customer'
			u.save()
			c = Customer()
			c.name = name
			c.ph_no = ph
			c.pincode = pin
			c.address = address
			c.user_id = u
			c.save()
			return Response({"message": "registered"})


class UserLogin(APIView):
	def post(self,request,format=None):
		email = request.POST.get('email')
		password = request.POST.get('password')
		if User.objects.filter(username=email,password=password).exists():
			u = User.objects.get(username=email,password=password)
			if u.last_name == 'Customer':
				std = Customer.objects.get(user_id=u.id)
				s = CustomerSerializer(std)
				return Response({"message":"True","response":s.data})
		else:
			return Response({"message":"False","response":"Invalid Username or password"})
	

class ViewCategory(APIView):
	def get(self,request):
		c = Category.objects.all()
		c = CategorySerializer(c,many=True)
		return Response({"message":'True',"response":c.data})

class ViewProduct(APIView):
	def get(self,request,catId):
		if Product.objects.filter(category_id=catId).exists():
			p = Product.objects.filter(category_id=catId)
			p = ProductSerializer(p,many=True)
			return Response({"message":'True',"response":p.data})
		else:
			return Response({"message":'False',"response":"No items"})


class AddCart(APIView):
	def post(self,request,format=None):
		u = request.POST.get('custId')
		u = Customer.objects.get(id=u)
		p = request.POST.get('productId')
		p = Product.objects.get(id=p)
		comp = Company.objects.get(id=p.company_id.id)
		c = Cart()
		c.customer_id = u
		c.product_id=p
		c.qty = request.POST.get('qty')
		c.company = comp
		c.save()
		return Response({"message":"True","response":"Added to Cart"})

class AddToWishList(APIView):
	def post(self,request,format=None):
		pid = request.POST.get('productId')
		cust = request.POST.get('custId')
		if WishList.objects.filter(cust=cust,product=pid).exists():
			return Response({"message":"False","response":"Already exists"})
		else:
			u = Customer.objects.get(id=cust)
			p = Product.objects.get(id=pid)
			w = WishList()
			w.cust = u
			w.product = p
			w.save()
			return Response({"message":"True","response":"Added to Wish List"})

class ViewWishlist(APIView):
	def get(self,request,custId):
		if WishList.objects.filter(cust=custId).exists():
			w = WishList.objects.filter(cust=custId)
			w = WishListSerializer(w,many=True)
			return Response({"message":"True","response":w.data})
		else:
			return Response({"message":"False","response":"No Items"})

class ViewCart(APIView):
	def get(self,request,custId):
		if Cart.objects.filter(customer_id=custId,bill_id__isnull=True).exists():
			c = Cart.objects.filter(customer_id=custId,bill_id__isnull=True)
			c = CartSerializer(c,many=True)
			return Response({"message":"True","response":c.data})
		else:
			return Response({"message":"False","response":"No Items"})

class Recommentation(APIView):
	def get(self,request,custId):
		if Cart.objects.filter(customer_id=custId).exists():
			CartProduct = Cart.objects.filter(customer_id=custId).values_list('product_id').distinct()
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
				sortedProductsWithCount = sorted(productsWithCount.items(),key=lambda kv:(kv[1],kv[0]))
				print("sortedProductsWithCount Initial:",sortedProductsWithCount)

				# sortedProductsWithCount={v: k for k, v in sortedProductsWithCount.items()}
				# print("sortedProductsWithCount",sortedProductsWithCount)
				sortedProductsWithCount = [i for i in reversed(sortedProductsWithCount)]
				print("sortedProductsWithCount",sortedProductsWithCount)


				finalProducts = {}
				for x in sortedProductsWithCount:
					finalProducts[x[0]]=x[1]
				for x in finalProducts:
					p = Product.objects.get(id=x)	
					p = ProductSerializer(p)
					recommentaionsList.append(p.data)
			return Response({'message':'True',"response":recommentaionsList})
		else:
			return Response({"message":"False","response":'No Recommentations'})


class Payment(APIView):
	def post(self,request,format=None):
		c = request.POST.get('custId')
		c = Customer.objects.get(id = c)
		b = Bill()
		b.date = datetime.datetime.now()
		b.amount = request.POST.get('amount')
		b.customer_id = c
		b.payment_type = request.POST.get('ptype')
		b.shippingAddress = request.POST.get('shippingAddress')
		b.phoneNo = request.POST.get('phoneNo')
		b.save()
		return Response({"message":"True","response":'Payment Successfull'})
