```
FSND_Capstone/
├── app.py
├── models.py
├── auth.py
├── requirements.txt
├── test_app.py
├── config.py
├── README.md
└── migrations/
```

# Set up Virtual Environment
```bash
python3 -m venv venv
source venv/bin/activate
pip install flask flask-sqlalchemy flask-migrate python-dotenv unittest python-jose gunicorn
```

## Create .env file
Add following contents
```bash
AUTH0_DOMAIN=huyahoo.jp.auth0.com
API_AUDIENCE=fsnd-capstone
ALGORITHMS=RS256
SECRET_KEY=supersecretkey
DATABASE_URL=postgresql://book_rental_user:password@localhost:5432/book_rental
```

# Initialize Database

## Create PostgreSQL
```bash
psql -U postgres
# Then add
CREATE ROLE book_rental_user WITH LOGIN PASSWORD 'password';
# Grant Privileges
ALTER ROLE book_rental_user CREATEDB;
# Create the Database
CREATE DATABASE book_rental OWNER book_rental_user;

```

```bash
export FLASK_APP=app.py

flask db init
flask db migrate -m "Initial migration"
flask db upgrade

# Run
flask run
```

# Test

## Get access Token
```bash
curl --request POST \
  --url https://huyahoo.jp.auth0.com/oauth/token \
  --header 'content-type: application/json' \
  --data '{"client_id":"dUWuWZ9gWDYDMrm45tsqEHRRcuuRl3fh","client_secret":"QuUjCUw623L128sW_E2wp7DcoBEbxJDcLA9U7fZjVM5PQYaE2ExQxARspkjV8DBd","audience":"fsnd-capstone","grant_type":"client_credentials"}'
```
-> OUT
{"access_token":"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InlxUnFsMnJRUmVjQmJGcDhPa1d1MiJ9.eyJpc3MiOiJodHRwczovL2h1eWFob28uanAuYXV0aDAuY29tLyIsInN1YiI6ImRVV3VXWjlnV0RZRE1ybTQ1dHNxRUhSUmN1dVJsM2ZoQGNsaWVudHMiLCJhdWQiOiJmc25kLWNhcHN0b25lIiwiaWF0IjoxNzM1NDA0NTQwLCJleHAiOjE3MzU0OTA5NDAsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyIsImF6cCI6ImRVV3VXWjlnV0RZRE1ybTQ1dHNxRUhSUmN1dVJsM2ZoIn0.IKGbqffkalfZuKflTm4xkeIMuKdiutI0MpK3Q8F7_2_HLTI8mLnviYG4uk20jxlkRGeTdNrWhRPSjDNLgXcTBtzljtUQpb3bM1XJlXgZG0JIOKFI4SIawZMTLbEoMs_fNCpUFC-I6h1qjVcr8q0ag8GXUsZXPG7qWXtb7cDMw474uMU8XRXXxHXg5citWf4hEd8PwXkrxmvQfOADAZKN2M-vbZQFe7aGYSZz7bVmiMXlmDMmCplJMFZI5-GFU1YqV5SmyNwFWMfRGluq3vKapbwQE5jocs8ripYpBmcF2liM4ih163c-h0hpg8GCh3rnRGsgIq0mQFCwO_ZIwdCzgA","expires_in":86400,"token_type":"Bearer"}% 

## Test Reader Role Endpoints
```bash
curl -X GET http://127.0.0.1:5000/books -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InlxUnFsMnJRUmVjQmJGcDhPa1d1MiJ9.eyJpc3MiOiJodHRwczovL2h1eWFob28uanAuYXV0aDAuY29tLyIsInN1YiI6ImRVV3VXWjlnV0RZRE1ybTQ1dHNxRUhSUmN1dVJsM2ZoQGNsaWVudHMiLCJhdWQiOiJmc25kLWNhcHN0b25lIiwiaWF0IjoxNzM1NDA0NTQwLCJleHAiOjE3MzU0OTA5NDAsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyIsImF6cCI6ImRVV3VXWjlnV0RZRE1ybTQ1dHNxRUhSUmN1dVJsM2ZoIn0.IKGbqffkalfZuKflTm4xkeIMuKdiutI0MpK3Q8F7_2_HLTI8mLnviYG4uk20jxlkRGeTdNrWhRPSjDNLgXcTBtzljtUQpb3bM1XJlXgZG0JIOKFI4SIawZMTLbEoMs_fNCpUFC-I6h1qjVcr8q0ag8GXUsZXPG7qWXtb7cDMw474uMU8XRXXxHXg5citWf4hEd8PwXkrxmvQfOADAZKN2M-vbZQFe7aGYSZz7bVmiMXlmDMmCplJMFZI5-GFU1YqV5SmyNwFWMfRGluq3vKapbwQE5jocs8ripYpBmcF2liM4ih163c-h0hpg8GCh3rnRGsgIq0mQFCwO_ZIwdCzgA"

curl -X GET http://127.0.0.1:5000/rentals -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InlxUnFsMnJRUmVjQmJGcDhPa1d1MiJ9.eyJpc3MiOiJodHRwczovL2h1eWFob28uanAuYXV0aDAuY29tLyIsInN1YiI6ImRVV3VXWjlnV0RZRE1ybTQ1dHNxRUhSUmN1dVJsM2ZoQGNsaWVudHMiLCJhdWQiOiJmc25kLWNhcHN0b25lIiwiaWF0IjoxNzM1NDA0NTQwLCJleHAiOjE3MzU0OTA5NDAsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyIsImF6cCI6ImRVV3VXWjlnV0RZRE1ybTQ1dHNxRUhSUmN1dVJsM2ZoIn0.IKGbqffkalfZuKflTm4xkeIMuKdiutI0MpK3Q8F7_2_HLTI8mLnviYG4uk20jxlkRGeTdNrWhRPSjDNLgXcTBtzljtUQpb3bM1XJlXgZG0JIOKFI4SIawZMTLbEoMs_fNCpUFC-I6h1qjVcr8q0ag8GXUsZXPG7qWXtb7cDMw474uMU8XRXXxHXg5citWf4hEd8PwXkrxmvQfOADAZKN2M-vbZQFe7aGYSZz7bVmiMXlmDMmCplJMFZI5-GFU1YqV5SmyNwFWMfRGluq3vKapbwQE5jocs8ripYpBmcF2liM4ih163c-h0hpg8GCh3rnRGsgIq0mQFCwO_ZIwdCzgA"
```

## Test Admin Role Endpoints

```bash
curl -X POST http://127.0.0.1:5000/rentals \
  -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InlxUnFsMnJRUmVjQmJGcDhPa1d1MiJ9.eyJpc3MiOiJodHRwczovL2h1eWFob28uanAuYXV0aDAuY29tLyIsInN1YiI6ImRVV3VXWjlnV0RZRE1ybTQ1dHNxRUhSUmN1dVJsM2ZoQGNsaWVudHMiLCJhdWQiOiJmc25kLWNhcHN0b25lIiwiaWF0IjoxNzM1NDA0NTQwLCJleHAiOjE3MzU0OTA5NDAsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyIsImF6cCI6ImRVV3VXWjlnV0RZRE1ybTQ1dHNxRUhSUmN1dVJsM2ZoIn0.IKGbqffkalfZuKflTm4xkeIMuKdiutI0MpK3Q8F7_2_HLTI8mLnviYG4uk20jxlkRGeTdNrWhRPSjDNLgXcTBtzljtUQpb3bM1XJlXgZG0JIOKFI4SIawZMTLbEoMs_fNCpUFC-I6h1qjVcr8q0ag8GXUsZXPG7qWXtb7cDMw474uMU8XRXXxHXg5citWf4hEd8PwXkrxmvQfOADAZKN2M-vbZQFe7aGYSZz7bVmiMXlmDMmCplJMFZI5-GFU1YqV5SmyNwFWMfRGluq3vKapbwQE5jocs8ripYpBmcF2liM4ih163c-h0hpg8GCh3rnRGsgIq0mQFCwO_ZIwdCzgA" \
  -H "Content-Type: application/json" \
  -d '{"book_id": 1, "user_name": "John Doe", "rental_date": "2024-12-29"}'

```