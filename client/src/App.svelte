<script>
  import Home from "./pages/Home/Home.svelte";
  import { Router, Route } from "svelte-navigator";
  import PrivateRoute from "./pages/PrivateRoute.svelte";
  import Account from "./pages/Account/Account.svelte";
  import Header from "./components/Header/Header.svelte";
  import Login from "./components/Login/Login.svelte";
  import Signup from "./components/Signup/Signup.svelte";
</script>

<!-- <img src="../public/hogwarts.jpg" width="100%" alt="image of hogwarts shcool"> -->

<Header />

<main>
  <Router>
    <Route path="/" component={Home} />
    <Route path="/login" component={Login} />
    <Route path="/signup" component={Signup} />
    <PrivateRoute path="/account" let:location>
      <Account />
    </PrivateRoute>
  </Router>
</main>

<!-- Footer her -->
<style>
</style>
