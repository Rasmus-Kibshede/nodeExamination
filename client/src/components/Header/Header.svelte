<script>
    import { Router, Link, useMatch } from "svelte-navigator";
    import { global_user } from "../../../store/globals.js";
    import Admin from "../../pages/Admin/Admin.svelte";
    import Logout from "../Logout/Logout.svelte";
</script>

<header>
    <Router>
        <nav id="main_menu">
            <Link to="/"><span class="menuLink">Home</span></Link>

            {#if $global_user}
                <Link to="/account"><span class="menuLink">Account</span></Link>

                {#if $global_user.fk_role_id == 1}
                    <Link to="/admin"><span class="menuLink">Admin</span></Link>
                {/if}
                <Logout />
            {:else}
                <Link to="/login"><span class="menuLink">Login</span></Link>
            {/if}
        </nav>
    </Router>
</header>

<style>
    header {
        width: 30%;
        border: solid 1px white;
        background-color: rgba(250, 235, 215, 0.9);
    }

    #main_menu {
        display: flex;
        height: 100%;
        flex-direction: column;
        align-content: space-around;
        justify-content: center;
        height: 100vh;
    }

    .menuLink {
        display: inline-block;
        width: 30%;
        color: black;
        font-size: 25px;
        width: 100%;
        padding: 10px 0;
        text-shadow: 1px 1px 1px white;
    }

    .menuLink:hover {
        border-radius: 5px;
        background-color: rgba(0, 0, 0, 0.6);
        border-radius: 10px;
        color: white;
        text-shadow: 1px 1px 1px black;
    }
</style>
