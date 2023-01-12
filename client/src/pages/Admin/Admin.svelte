<script>
    import { io } from "socket.io-client";
    import User from "../../components/User/User.svelte";

    const socket = io("http://127.0.0.1:8080");

    let users = [];

    socket.on("test", (data) => {
        users = data;
    });
</script>

<h1>Admin page</h1>

{#each users as user}
    <User {user} />
{/each}

<style></style>
