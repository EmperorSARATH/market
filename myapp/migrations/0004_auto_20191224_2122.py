# Generated by Django 2.0 on 2019-12-24 15:52

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0003_auto_20191224_2121'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bill',
            name='date',
            field=models.DateField(default=datetime.datetime(2019, 12, 24, 21, 22, 5, 877553)),
        ),
    ]
