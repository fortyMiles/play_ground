from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.views.generic import RedirectView

carzy_apple_url = 'crazyApple.urls'
urlpatterns = patterns(
    '',
    url(r'^$', RedirectView.as_view(url='/crazyApple/home')),
    url(r'^crazyApple/', include(carzy_apple_url, namespace='crazyApple')),
    url(r'^admin/', include(admin.site.urls)),
)
