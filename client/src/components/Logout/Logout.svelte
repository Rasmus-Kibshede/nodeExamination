<script>
    import { useNavigate, useLocation } from "svelte-navigator";
    import { global_user, BASE_URL, jwtToken } from "../../../store/globals";

    const navigate = useNavigate();
    const location = useLocation();

    //TODO make logout
    async function handleLogout() {
        $global_user = null;
        localStorage.removeItem("global_user");
        
        // can be made with socket.io
        document.cookie = "token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";

        
        await fetch(`${$BASE_URL}/api/logout`);
        // @ts-ignore
        toastr.success("Logged out", "You are now logged out");

        const from = ($location.state && $location.state.from) || "/";
        navigate(from, { replace: true });
    }
</script>

<button id="button_logout" on:click={handleLogout}
    ><i class="fa-solid fa-right-from-bracket" />Logout</button
>

<style>
</style>
