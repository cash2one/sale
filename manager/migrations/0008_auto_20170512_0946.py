# -*- coding: utf-8 -*-
# Generated by Django 1.10.4 on 2017-05-12 09:46
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('manager', '0007_auto_20170512_0919'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='create_time',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]