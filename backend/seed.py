from models import db, Book, Rental
from app import app
from datetime import datetime

def seed_data():
    with app.app_context():
        # Drop and recreate all tables
        db.drop_all()
        db.create_all()

        # Seed Books
        books = [
            Book(title="The Great Gatsby", author="F. Scott Fitzgerald", published_date=datetime(1925, 4, 10)),
            Book(title="1984", author="George Orwell", published_date=datetime(1949, 6, 8)),
            Book(title="To Kill a Mockingbird", author="Harper Lee", published_date=datetime(1960, 7, 11))
        ]
        db.session.add_all(books)
        db.session.commit()

        # Seed Rentals
        rentals = [
            Rental(user_name="John Doe", rental_date=datetime.now(), book_id=1),
            Rental(user_name="Jane Smith", rental_date=datetime.now(), book_id=2)
        ]
        db.session.add_all(rentals)
        db.session.commit()

        print("Database seeded successfully!")

if __name__ == "__main__":
    seed_data()
