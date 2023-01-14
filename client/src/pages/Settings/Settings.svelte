<script>
    import { currentURL } from "../../../store/globals";
    import EditUser from "../../components/User/EditUser.svelte";

    // A part of menu page highlighter
    import { useLocation } from "svelte-navigator";
    const location = useLocation();
    $currentURL = $location.pathname;

    let showEditUser = false;
</script>

<h1>Settings</h1>

{#if showEditUser}
    <EditUser />
{/if}
<button on:click={() => (showEditUser = !showEditUser)}>
    {showEditUser ? "Hide" : "Edit user"}
</button>
