<template>
  <div>
    <h1>Books</h1>
    <ul>
      <li v-for="book in books" :key="book.id">
        {{ book.title }} by {{ book.author }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "../services/api";
import { useStore } from "../store";

export default {
  setup() {
    const store = useStore();

    const fetchBooks = async () => {
      const response = await axios.get("/books");
      store.setBooks(response.data);
    };

    fetchBooks();

    return {
      books: store.books,
    };
  },
};
</script>
