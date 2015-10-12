# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('crazyApple', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='finisher',
            name='leave_time',
            field=models.DateField(default=datetime.datetime(2014, 12, 26, 8, 51, 20, 369119), auto_now=True, auto_now_add=True),
            preserve_default=True,
        ),
    ]
