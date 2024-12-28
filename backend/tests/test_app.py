import unittest
from app import app

class BookRentalTestCase(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_get_books(self):
        res = self.client.get('/books', headers={"Authorization": "Bearer VALID_TOKEN"})
        self.assertEqual(res.status_code, 200)

    def test_create_rental(self):
        data = {
            "user_name": "John Doe",
            "rental_date": "2023-01-01",
            "book_id": 1
        }
        res = self.client.post('/rentals', json=data, headers={"Authorization": "Bearer VALID_ADMIN_TOKEN"})
        self.assertEqual(res.status_code, 201)
