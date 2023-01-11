<script>
    // @ts-nocheck
    import { onMount } from "svelte";
    import { global_user, BASE_URL } from "../../../store/globals.js";
    const user = $global_user;

    let wand = [];

    async function fetchWand() {
        let response = await fetch(`${$BASE_URL}/wand/${user.fk_wand_id}`);

        const result = await response.json();
        wand = result.wand;
    }

    onMount(fetchWand);
</script>


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
        background-color: rgba(250, 235, 215, 0.5);
        border: solid 1px white;
        padding: 10px 0;
    }

    #wand_box div{
        width: 33%;
    }
</style>
