<script>
    import EditUser from "../../components/User/EditUser.svelte";

    let showEditUser = false;
</script>

<h1>Settings</h1>

{#if showEditUser}
    <EditUser />
{/if}
<button on:click={() => (showEditUser = !showEditUser)}>
    {showEditUser ? "Hide" : "Edit user"}
</button>
