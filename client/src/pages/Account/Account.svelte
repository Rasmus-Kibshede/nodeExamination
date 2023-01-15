<script>
    import { global_user, currentURL } from "../../../store/globals.js";
    import User from "../../components/User/User.svelte";
    import Wand from "../../components/Wand/Wand.svelte";
    import CreateWand from "../../components/Wand/CreateWand.svelte";
    import House from "../../components/House/House.svelte";

    // A part of menu page highlighter
    import { useLocation } from "svelte-navigator";
    const location = useLocation();
    $currentURL = $location.pathname;
    const user = $global_user;
</script>

<h1>Welcome {user.user_firstname} {user.user_lastname}</h1>

<User {user} />

<House house_name={user.user_house} />

{#if user.fk_wand_id != null}
    <Wand />
{:else}
    <CreateWand />
{/if}
