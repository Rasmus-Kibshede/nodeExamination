<script>
    import { global_user } from "../../../store/globals.js";
    import EditUser from "../../components/User/EditUser.svelte";
    import CreateWand from "../../components/Wand/CreateWand.svelte";
    const user = $global_user;

    let showEditUser = false;
</script>

<h1>Settings</h1>

{#if showEditUser}
    <EditUser />
{/if}
<button on:click={() => (showEditUser = !showEditUser)}>
    {showEditUser ? "Hide" : "Edit user"}
</button>

<CreateWand />
