<template>
  <nav>
    <ul>
      <li>
        <router-link to="/books">Books</router-link>
      </li>
      <li>
        <router-link to="/rentals">Rentals</router-link>
      </li>
      <li>
        <LoginButton />
      </li>
    </ul>
  </nav>
</template>

<script>
import LoginButton from "./LoginButton.vue";

export default {
  name: "Navbar",
  components: {
    LoginButton,
  },
};
</script>

<style scoped>
nav {
  background-color: #f8f9fa;
  padding: 1rem;
}

ul {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
  justify-content: center;
}

li {
  margin: 1rem 1rem;
}

a {
  text-decoration: none;
  color: #007bff;
}

a:hover {
  text-decoration: underline;
}
</style>
