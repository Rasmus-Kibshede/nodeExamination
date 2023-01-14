<script>
  import Home from "./pages/Home/Home.svelte";
  import { Router, Route } from "svelte-navigator";
  import PrivateRoute from "./pages/PrivateRoute.svelte";
  import Account from "./pages/Account/Account.svelte";
  import Header from "./components/Header/Header.svelte";
  import Login from "./components/Login/Login.svelte";
  import Signup from "./components/Signup/Signup.svelte";
  import Admin from "./pages/Admin/Admin.svelte";
  import EditAcount from "./pages/Settings/Settings.svelte";
  import Spells from "./pages/Spells/Spells.svelte";
</script>

<!-- <img src="../public/hogwarts.jpg" width="100%" alt="image of hogwarts shcool"> -->

<Header />

<main>
  <div id="wrapper">
    <Router>
      <Route path="/" component={Home} />
      <Route path="/spells" component={Spells} />
      <Route path="/login" component={Login} />
      <Route path="/signup" component={Signup} />
      <PrivateRoute path="/account" let:location>
        <Account />
      </PrivateRoute>
      <PrivateRoute path="/admin" let:location>
        <Admin />
      </PrivateRoute>
      <PrivateRoute path="/settings" let:location>
        <EditAcount />
      </PrivateRoute>
    </Router>
  </div>
</main>

<!-- Footer her -->
<style>
</style>
