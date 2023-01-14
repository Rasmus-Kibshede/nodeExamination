<script>
    import { jwtToken, currentURL } from "../../../store/globals";
    import Crests from "../../components/Crests/Crests.svelte";

    console.log("cookie test", $jwtToken);

    // A part of menu page highlighter
    import { useLocation } from "svelte-navigator";
    const location = useLocation();
    $currentURL = $location.pathname;
</script>

<h1>Welcome to Hogwarts!</h1>

<Crests />

<style>
</style>
