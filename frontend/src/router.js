import { createRouter, createWebHistory } from "vue-router";
import Books from "./components/Books.vue";
import Rentals from "./components/Rentals.vue";

const routes = [
  { path: "/", redirect: "/books" },
  { path: "/books", component: Books },
  { path: "/rentals", component: Rentals },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
