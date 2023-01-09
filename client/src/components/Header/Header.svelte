<script>
    import { Router, Link, useMatch } from "svelte-navigator";
    import { global_user } from "../../../store/globals.js";
    import Logout from "../Logout/Logout.svelte";
</script>

<header>
    <Router>
        <nav>
            <Link to="/">Home</Link>

            {#if $global_user}
                <Link to="/account">Account</Link>
                <Logout />
            {:else}
                <Link to="/login">Login</Link>
            {/if}
        </nav>
    </Router>
</header>

<style>
</style>
