<script>
    import { Router, Link, useMatch } from "svelte-navigator";
    import { global_user } from "../../../store/globals.js";
    import Admin from "../../pages/Admin/Admin.svelte";
    import Logout from "../Logout/Logout.svelte";
</script>

<header>
    <img
        width="200px"
        src="https://icons-for-free.com/iconfiles/png/512/hallows+harry+outline+potter+icon-1320183608275058865.png"
        alt="The deadly hallows"
    />

    <Router>
        <nav id="main_menu">
            <!-- <table>
                <tr>
                    <Link to="/">
                        <div class="menuLink">
                            <i class="fa-solid fa-house" />
                            <span>Home</span>
                        </div>
                    </Link>
                </tr>
                {#if $global_user}
                    <tr>
                        <Link to="/account">
                            <div class="menuLink">
                                <i class="fa-solid fa-user" />
                                <span>Account</span>
                            </div>
                        </Link>
                    </tr>
                    <tr>
                        <Link to="settings">
                            <div class="menuLink">
                                <span class="fa-solid fa-gear" />
                                <span>Settings</span>
                            </div>
                        </Link>
                    </tr>
                    {#if $global_user.fk_role_id == 1}
                        <tr>
                            <Link to="/admin">
                                <div class="menuLink">
                                    <i class="fa-solid fa-lock" />
                                    <span>Admin</span>
                                </div>
                            </Link>
                        </tr>
                    {/if}
                    <tr>
                        <Logout />
                    </tr>
                {:else}
                    <tr>
                        <Link to="/login">
                            <div class="menuLink">
                                <i class="fa-solid fa-right-to-bracket" />
                                <span>Login</span>
                            </div>
                        </Link>
                    </tr>
                {/if}
            </table> -->
            <Link to="/">
                <div class="menuLink">
                    <i class="fa-solid fa-house" />
                    <span>Home</span>
                </div>
            </Link>

            {#if $global_user}
                <Link to="/account">
                    <div class="menuLink">
                        <i class="fa-solid fa-user" />
                        <span>Account</span>
                    </div>
                </Link>
                <Link to="settings">
                    <div class="menuLink">
                        <i class="fa-solid fa-gear" />
                        <span>Settings</span>
                    </div>
                </Link>

                {#if $global_user.fk_role_id == 1}
                    <Link to="/admin">
                        <div class="menuLink">
                            <i class="fa-solid fa-user-secret" />
                            <span>Admin</span>
                        </div>
                    </Link>
                {/if}
                <Logout />
            {:else}
                <Link to="/login">
                    <div class="menuLink">
                        <i class="fa-solid fa-right-to-bracket" />
                        <span>Login</span>
                    </div>
                </Link>
            {/if}
        </nav>
    </Router>
</header>

<style>
    header {
        width: 30%;
        border: solid 1px white;
        background-color: rgba(250, 235, 215, 0.9);
        height: 100vh;
        max-height: 100vh;
    }

    #main_menu {
        display: flex;
        flex-direction: column;
        /* height: calc(100vh - 400px); */
        justify-content: center;
    }

    /*  #main_menu img {
        margin: 0 auto;
        margin-bottom: 50px;
    } */

    .menuLink {
        display: inline-block;
        width: 100%;
        color: black;
        font-size: 25px;
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
