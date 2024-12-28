import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import { createPinia } from "pinia";
import { createAuth0 } from "@auth0/auth0-vue";

const app = createApp(App);

// Initialize Pinia
const pinia = createPinia();
app.use(pinia);

// Initialize Router
app.use(router);

// Initialize Auth0
app.use(
  createAuth0({
    domain: import.meta.env.VITE_AUTH0_DOMAIN,
    clientId: import.meta.env.VITE_AUTH0_CLIENT_ID,
    authorizationParams: {
      redirect_uri: window.location.origin,
      // audience: import.meta.env.VITE_API_AUDIENCE,
    },
  })
);

// Mount the app
app.mount("#app");
