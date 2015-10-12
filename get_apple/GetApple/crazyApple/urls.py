from django.conf.urls import patterns, url

from crazyApple.views import AppleGetter
from crazyApple.views import FinishHandler

urlpatterns = patterns(
    '', url(r'^home/$', AppleGetter.as_view(), name='crazy_apple_home'),
    url(r'^finish/$', FinishHandler.as_view(), name='finish'),
)
