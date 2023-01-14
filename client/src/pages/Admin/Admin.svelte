<script>
    import { io } from "socket.io-client";
    import { jwtToken, currentURL } from "../../../store/globals";

    // A part of menu page highlighter
    import { useLocation } from "svelte-navigator";
    const location = useLocation();
    $currentURL = $location.pathname;

    const socket = io("http://127.0.0.1:8080");

    let users = [];
    let roles = [];

    function updateUser(user) {
        socket.emit("update user", { user: user, token: $jwtToken });
    }

    function deleteUser(user) {
        socket.emit("delete user", { user: user, token: $jwtToken });
    }

    socket.on("users", (data) => {
        users = data;
    });

    socket.on("roles", (data) => {
        roles = data;
    });

    socket.on("status", (data) => {
        if (data) {
            // @ts-ignore
            toastr.success(`User is now ${data.word}`);
        } else {
            // @ts-ignore
            toastr.error(`Error, user was not ${data.word}`);
        }
    });
</script>

<h1>Admin page</h1>
<!-- 
{#each users as user}
    <User {user} />
{/each} -->

<table>
    <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
    </tr>
    {#each users as user}
        <tr>
            <td><input type="text" bind:value={user.user_firstname} /></td>
            <td><input type="text" bind:value={user.user_lastname} /></td>
            <td><input type="text" bind:value={user.user_email} /></td>
            <td
                ><select bind:value={user.fk_role_id}>
                    {#each roles as { role_id, role_name }}
                        <option value={role_id}>{role_name}</option>
                    {/each}
                </select></td
            >
            <td><button on:click={() => updateUser(user)}>Save</button></td>
            <td><button on:click={() => deleteUser(user)}>Delete</button></td>
        </tr>
    {/each}
</table>

<style></style>
