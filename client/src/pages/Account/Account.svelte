<script>
    import { global_user, currentURL } from "../../../store/globals.js";
    import User from "../../components/User/User.svelte";
    import Wand from "../../components/Wand/Wand.svelte";
    import CreateWand from "../../components/Wand/CreateWand.svelte";

    // A part of menu page highlighter
    import { useLocation } from "svelte-navigator";
    const location = useLocation();
    $currentURL = $location.pathname;
</script>

<h1>Welcome {$global_user.user_firstname} {$global_user.user_lastname}</h1>

<User user={$global_user} />

{#if $global_user.fk_wand_id != null}
    <Wand />
{:else}
    <CreateWand />
{/if}
