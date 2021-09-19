"""market URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
import myapp.views
from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',myapp.views.index,name='index_url'),
    path('cart',myapp.views.cart,name='cart_url'),
    path('shop',myapp.views.shop,name='shop_url'),
    path('reg',myapp.views.reg,name='reg_url'),
    path('login',myapp.views.login1,name='login_url'),
    path('approve',myapp.views.approve_comp,name='approve_url'),
    path(r'^appcompany/(?P<uid>\d+)/$',myapp.views.appcompany,name='appcompany_url'),
    path('view_comp',myapp.views.view_comp,name='view_comp_url'),
    path('logout',myapp.views.logout1,name='logout_url'),
    path('category',myapp.views.category,name='category_url'),
    path('view_category',myapp.views.view_category,name='view_category_url'),
    path('homeadmin',myapp.views.homeadmin,name='homeadmin_url'),
    path('user_reg',myapp.views.user_reg,name='user_reg_url'),


    path('add_products',myapp.views.add_products,name='addproucts_url'),
    path('view_products',myapp.views.view_products,name='view_products_url'),
    path('view_offers',myapp.views.view_offers,name='view_offers_url'),
    path('dashboard',myapp.views.company_home,name='dashboard_url'),
    path('add_offers',myapp.views.add_offers,name='add_offers_url'),
    path('viewOrders',myapp.views.viewOrders,name='viewOrders_url'),
    path('companyPlaceOrder',myapp.views.companyPlaceOrder,name='companyPlaceOrder_url'),
    path('delcat/<int:cid>',myapp.views.delcat,name='delcat_url'),
    path('delproducts/<int:pid>',myapp.views.delproducts,name='delproducts_url'),
    path('editcat/<int:cid>',myapp.views.editcat,name='editcat_url'),
    path('updatecat',myapp.views.updatecat,name='updatecat_url'),
    path('updateproducts',myapp.views.updateproducts,name='updateproducts_url'),
    path('editproducts/<int:pid>',myapp.views.editproducts,name='editproducts_url'),


    url('',include('user_app.urls')),
    url('',include('restapp.urls')),


]+static(settings.MEDIA_URL,document_root = settings.MEDIA_ROOT)
