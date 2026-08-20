from rest_framework import serializers
from .models import UserProfile


class UserRegisterSerializer(serializers.ModelSerializer):

    class Meta:
        model = UserProfile
        fields = ['fullname', 'email', 'password']
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }

    def create(self, validated_data):
        user = UserProfile(
            fullname=validated_data['fullname'],
            email=validated_data['email'],
        )

        user.set_password(validated_data['password'])
        user.save()

        return user