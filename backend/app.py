from flask import Flask, request, jsonify
from flask_migrate import Migrate
from flask_cors import CORS
from models import db, Book, Rental
from auth import requires_auth, AuthError
from config import Config

app = Flask(__name__)
app.config.from_object(Config)

# Enable CORS
CORS(app, resources={r"/*": {"origins": "http://localhost:3000"}})

db.init_app(app)
migrate = Migrate(app, db)

@app.route('/books', methods=['GET'])
@requires_auth('read:books')
def get_books(payload):
    books = Book.query.all()
    return jsonify([book.format() for book in books])

@app.route('/rentals', methods=['GET'])
@requires_auth('read:rentals')
def get_rentals(payload):
    rentals = Rental.query.all()
    return jsonify([rental.format() for rental in rentals])

@app.route('/rentals', methods=['POST'])
@requires_auth('create:rentals')
def create_rental(payload):
    data = request.get_json()
    new_rental = Rental(
        user_name=data['user_name'],
        rental_date=data['rental_date'],
        book_id=data['book_id']
    )
    new_rental.insert()
    return jsonify(new_rental.format()), 201

@app.route('/books/<int:book_id>', methods=['PATCH'])
@requires_auth('update:books')
def update_book(payload, book_id):
    book = Book.query.get(book_id)
    if not book:
        abort(404)
    data = request.get_json()
    book.title = data.get('title', book.title)
    book.author = data.get('author', book.author)
    db.session.commit()
    return jsonify(book.format())

@app.route('/books/<int:book_id>', methods=['DELETE'])
@requires_auth('delete:books')
def delete_book(payload, book_id):
    book = Book.query.get(book_id)
    if not book:
        abort(404)
    book.delete()
    return jsonify({"message": "Book deleted"})


if __name__ == '__main__':
    app.run(debug=True)
