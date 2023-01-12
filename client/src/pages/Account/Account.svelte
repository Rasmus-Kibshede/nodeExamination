<script>
    import { global_user } from "../../../store/globals.js";
    import User from "../../components/User/User.svelte";
    import Wand from "../../components/Wand/Wand.svelte";
    import CreateWand from "../../components/Wand/CreateWand.svelte";
</script>

<User />

{#if $global_user.fk_wand_id != null}
    <Wand />
{:else}
    <CreateWand />
{/if}
