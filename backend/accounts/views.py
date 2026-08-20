from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import UserRegisterSerializer

from .models import UserProfile

from django.contrib.auth.hashers import check_password

# Create your views here.

class RegisterView(APIView):

    def post(self, request):

        serializer = UserRegisterSerializer(data=request.data)

        if serializer.is_valid():
            user = serializer.save()
            return Response(
                {
                    "success": True,
                    "message": "User registered successfully!",
                    "user": {
                        "id": user.id,
                        "fullname": user.fullname,
                        "email": user.email,
                    }
                },
                status=status.HTTP_201_CREATED
            )

        return Response(
            {
                "success": False,
                "errors": serializer.errors,
            },
            status=status.HTTP_400_BAD_REQUEST
        )

class LoginView(APIView):

    def post(self, request):

        email = request.data.get("email")
        password = request.data.get("password")

        # Check whether fields are provided
        if not email or not password:
            return Response(
                {
                    "success": False,
                    "message": "Email and password are required."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        # Find user
        try:
            user = UserProfile.objects.get(email=email)
        except UserProfile.DoesNotExist:
            return Response(
                {
                    "success": False,
                    "message": "Invalid email or password."
                },
                status=status.HTTP_401_UNAUTHORIZED
            )

        # Check password
        if not check_password(password, user.password):
            return Response(
                {
                    "success": False,
                    "message": "Invalid email or password."
                },
                status=status.HTTP_401_UNAUTHORIZED
            )

        # Login successful
        return Response(
            {
                "success": True,
                "message": "Login successful!",
                "user": {
                    "id": user.id,
                    "fullname": user.fullname,
                    "email": user.email,
                }
            },
            status=status.HTTP_200_OK
        )