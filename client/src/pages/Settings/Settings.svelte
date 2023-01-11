<script>
    import { global_user } from "../../../store/globals.js";
    import EditUser from "../../components/User/EditUser.svelte";
    const user = $global_user;
</script>

<h1>Settings</h1>

<EditUser />
