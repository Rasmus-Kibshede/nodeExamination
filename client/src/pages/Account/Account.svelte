<script>
    import User from "../../components/User/User.svelte";
    import Wand from "../../components/Wand/Wand.svelte";

    import { global_user } from "../../../store/globals.js";

    console.log("user", $global_user.user_firstname);
</script>

<User />

<Wand />

<style>
</style>
