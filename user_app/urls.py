from django.contrib import admin
from django.urls import path,include
import user_app.views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
	path('user_home',user_app.views.user_home,name='user_home_url'),
	path('user_shop',user_app.views.user_shop,name='user_shop_url'),
	path('product_single/<int:pid>',user_app.views.product_single,name='product_single_url'),
	path('user_add_cart',user_app.views.user_add_cart,name='user_add_cart_url'),
	path('payment',user_app.views.payment,name='payment_url'),
	path('view_cart',user_app.views.view_cart,name='view_cart_url'),
	path('item_remove/<int:cid>',user_app.views.item_remove,name='item_remove_url'),
	path('cat_product/<int:cid>',user_app.views.cat_product,name='cat_product_url'),
	path('user_checkout',user_app.views.user_checkout,name='user_checkout_url'),
	path('userOrder',user_app.views.userOrder,name='userOrder_url'),
]
