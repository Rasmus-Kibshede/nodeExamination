<script>
  import Home from "./pages/Home/Home.svelte";
  import { Router, Route } from "svelte-navigator";
  import PrivateRoute from "./pages/PrivateRoute.svelte";
  import Account from "./pages/Account/Account.svelte";
  import Header from "./components/Header/Header.svelte";
  import Logout from "./components/Logout/Logout.svelte";
  import Login from "./components/Login/Login.svelte";
</script>

<Header />

<main>
  <Router>
    <Route path="/" component={Home} />
    <Route path="/login" component={Login} />
    <!-- <Route path="/signup" component={Signup} /> -->
    <PrivateRoute path="/account" let:location>
      <Account />
      <Logout />
    </PrivateRoute>
  </Router>
</main>

<!-- Footer her -->
<style>
</style>
