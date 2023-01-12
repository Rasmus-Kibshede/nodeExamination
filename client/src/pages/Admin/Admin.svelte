<script>
    import { io } from "socket.io-client";
    // import User from "../../components/User/User.svelte";

    const socket = io("http://127.0.0.1:8080");

    let users = [];

    socket.on("users", (data) => {
        users = data;
    });

    function updateUser(user) {
        socket.emit("update user", user);
    }

    socket.on("status", (data) => {
        if (data) {
            // @ts-ignore
            toastr.success(`User is now ${data.word}`);
        } else {
            // @ts-ignore
            toastr.error(`Error, user was not ${data.word}`);
        }
    });

    function deleteUser(user) {
        socket.emit("delete user", user);
    }
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
            <button on:click={() => updateUser(user)}>Save</button>
            <button on:click={() => deleteUser(user)}>Delete</button>
        </tr>
    {/each}
</table>

<style></style>
