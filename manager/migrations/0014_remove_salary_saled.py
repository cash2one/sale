# -*- coding: utf-8 -*-
# Generated by Django 1.10.4 on 2017-05-17 14:46
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('manager', '0013_auto_20170517_1151'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='salary',
            name='saled',
        ),
    ]
