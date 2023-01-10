<script>
// @ts-nocheck

    import { onMount } from "svelte";
    import { global_user, BASE_URL } from "../../../store/globals.js";
    const user = $global_user.user;

    let wand = [];

    async function fetchWand() {
        let response = await fetch(`${$BASE_URL}/wand/${user.fk_wand_id}`);

        const result = await response.json();
        const message = result.message;
        console.log(message);
        wand = result.wand;
        console.log(wand);
    }

    onMount(fetchWand);
</script>

<h1>Welcome {user.user_firstname} {user.user_lastname}</h1>

<h2>Wand: {wand.wand_name}</h2>

<div id="wand_box">
    <div>
        <h4>Core</h4>
        <span>{wand.wand_core}</span>
    </div>
    <div>
        <h4>Wood</h4>
        <span>{wand.wand_wood}</span>
    </div>
    <div>
        <h4>length</h4>
        <span>{wand.wand_length}</span>
    </div>
</div>

<style>
    #wand_box {
        display: flex;
        justify-content: space-around;
    }
</style>
