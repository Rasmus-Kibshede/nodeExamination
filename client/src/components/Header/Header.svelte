<script>
    import { Router, Link, useMatch } from "svelte-navigator";
</script>

<header>
    <Router>
        <nav>
            <Link to="/">Home</Link>
            <Link to="/login">Login</Link>
            <Link to="/account">Account</Link>
        </nav>
    </Router>


</header>

<style>
</style>
