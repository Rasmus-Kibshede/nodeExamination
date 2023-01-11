<script>
    import { global_user, BASE_URL } from "../../../store/globals.js";
    const user = $global_user;
    console.log(user);
</script>

<h1>Welcome {user.user_firstname} {user.user_lastname}</h1>

<style>
</style>