<script>
    import { jwtToken } from "../../../store/globals";
    import Crests from "../../components/Crests/Crests.svelte";

    console.log("cookie test", $jwtToken);
</script>

<h1>Welcome to Hogwarts!</h1>

<Crests />

<style>
</style>
