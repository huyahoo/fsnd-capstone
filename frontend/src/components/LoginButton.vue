<template>
  <div>
    <div v-if="isAuthenticated" class="auth-button" @click="logout">
      <a>Log Out</a>
    </div>
    <div v-else class="auth-button" @click="login">
      <a>Log In</a>
    </div>
  </div>
</template>

<script>
import { useAuth0 } from "@auth0/auth0-vue";

export default {
  name: "LoginButton",
  setup() {
    const { loginWithRedirect, logout, isAuthenticated } = useAuth0();

    const login = () => {
      loginWithRedirect();
    };

    const logoutUser = () => {
      logout({ returnTo: window.location.origin });
    };

    return {
      login,
      logout: logoutUser,
      isAuthenticated,
    };
  },
};
</script>

<style scoped>
.auth-button {
  padding: 10px 20px;
  background-color: #007bff;
  color: white;
  border-radius: 4px;
  cursor: pointer;
  text-align: center;
  display: inline-block;
}

.auth-button:hover {
  background-color: #0056b3;
}
</style>
