import { defineStore } from "pinia";

export const useStore = defineStore("main", {
  state: () => ({
    books: [],
    rentals: [],
  }),
  actions: {
    setBooks(books) {
      this.books = books;
    },
    setRentals(rentals) {
      this.rentals = rentals;
    },
  },
});
