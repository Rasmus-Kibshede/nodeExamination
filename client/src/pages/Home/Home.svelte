<script>
    import { currentURL } from "../../../store/globals";
    import Crests from "../../components/Crests/Crests.svelte";

    // A part of menu page highlighter
    import { useLocation } from "svelte-navigator";
    const location = useLocation();
    $currentURL = $location.pathname;
</script>

<h1>Welcome to Wizard World!</h1>

<Crests />

<style>
</style>
