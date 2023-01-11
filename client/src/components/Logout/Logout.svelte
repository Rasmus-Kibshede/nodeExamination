<script>
    import { useNavigate, useLocation } from "svelte-navigator";
    import { global_user, BASE_URL } from "../../../store/globals";

    const navigate = useNavigate();
    const location = useLocation();

    //TODO make logout
    async function handleLogout() {
        $global_user = null;
        localStorage.removeItem("global_user");
        await fetch(`${$BASE_URL}/logout`);
        // @ts-ignore
        toastr.success("Logged out", "You are now logged out");

        const from = ($location.state && $location.state.from) || "/";
        navigate(from, { replace: true });
    }
</script>

<button id="button_logout" on:click={handleLogout}>Logout</button>

<style>
</style>
