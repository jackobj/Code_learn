# Generated by Django 2.1 on 2018-09-07 13:17

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('zj_login_register', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Personal_Center',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mypic', models.ImageField(default='', max_length=50, upload_to='')),
                ('industry', models.CharField(max_length=30)),
                ('company', models.CharField(max_length=30)),
                ('brand', models.CharField(max_length=20)),
                ('position', models.CharField(max_length=20)),
                ('atname', models.CharField(default='', max_length=20)),
                ('cprofile', models.CharField(default='', max_length=200)),
                ('qq', models.CharField(default='', max_length=20)),
                ('wechat', models.CharField(default='', max_length=20)),
                ('email', models.CharField(default='', max_length=30)),
                ('sdemand', models.IntegerField(default=1)),
                ('vcinformation', models.IntegerField(default=2)),
                ('money', models.IntegerField(default=0)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='zj_login_register.User')),
            ],
            options={
                'db_table': 'personal_center',
            },
        ),
    ]
