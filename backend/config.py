import os
from dotenv import load_dotenv

# Load environment variables from .env
load_dotenv()

class Config:
    SECRET_KEY = os.getenv('SECRET_KEY', 'default_secret_key')
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 'sqlite:///app.db')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    AUTH0_DOMAIN = os.getenv('AUTH0_DOMAIN')
    API_AUDIENCE = os.getenv('API_AUDIENCE')
    ALGORITHMS = ['RS256']
