# -*- coding: utf-8 -*-
# Generated by Django 1.10.4 on 2017-05-10 14:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('manager', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='pid',
            field=models.IntegerField(auto_created=True, primary_key=True, serialize=False),
        ),
    ]
