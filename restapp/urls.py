from django.urls import path
from django.conf.urls import url
from restapp import views
from django.urls import reverse
from django.conf import settings

urlpatterns=[

	url(r'^apiuser_reg',views.UserReg.as_view()),
	url(r'^apiUserLogin',views.UserLogin.as_view()),
	url(r'^apicategory',views.ViewCategory.as_view()),
	path('apiproduct/<int:catId>',views.ViewProduct.as_view()),
	url(r'^apiaddcart',views.AddCart.as_view()),
	url(r'^apiaddToWishlist',views.AddToWishList.as_view()),
	path('apiWishlist/<int:custId>',views.ViewWishlist.as_view()),
	path('apiviewCart/<int:custId>',views.ViewCart.as_view()),
	path('apiRecommentation/<int:custId>',views.Recommentation.as_view()),
	url(r'^apiPayment',views.Payment.as_view()),

]