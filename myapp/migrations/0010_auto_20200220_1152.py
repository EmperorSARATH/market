# Generated by Django 3.0 on 2020-02-20 06:22

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0009_auto_20200130_0841'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bill',
            name='date',
            field=models.DateField(default=datetime.datetime(2020, 2, 20, 11, 52, 14, 82975)),
        ),
    ]
