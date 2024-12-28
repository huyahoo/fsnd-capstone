<template>
  <div>
    <Navbar />
    <div v-if="isAuthenticated" class="user-info">
      <p>Welcome, {{ user?.name }}</p>
      <p>Email: {{ user?.email }}</p>
    </div>
  </div>
</template>

<script>
import { useAuth0 } from "@auth0/auth0-vue";
import Navbar from "./components/Navbar.vue";

export default {
  name: "App",
  components: {
    Navbar,
  },
  setup() {
    const { isAuthenticated, user } = useAuth0();

    return {
      isAuthenticated,
      user,
    };
  },
};
</script>

<style scoped>
.user-info {
  margin: 20px;
  text-align: center;
}

.user-info p {
  font-size: 1rem;
  margin: 0.5rem;
}
</style>
