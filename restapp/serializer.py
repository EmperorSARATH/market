
from myapp.models import *
from rest_framework import serializers

class CustomerSerializer(serializers.ModelSerializer):
	class Meta:
		model=Customer
		fields = '__all__'


class CategorySerializer(serializers.ModelSerializer):
	class Meta:
		model = Category
		fields = '__all__'


class ProductSerializer(serializers.ModelSerializer):
	class Meta:
		model = Product
		fields = '__all__'

class WishListSerializer(serializers.ModelSerializer):
	product = ProductSerializer()
	class Meta:
		model = WishList
		fields = '__all__'

class CartSerializer(serializers.ModelSerializer):
	product_id = ProductSerializer()
	class Meta:
		model = Cart
		fields = ('product_id','qty')