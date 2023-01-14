<script>
    // @ts-nocheck
    import { global_user, BASE_URL, jwtToken } from "../../../store/globals.js";
    // import { onMount } from "svelte";
    const user = $global_user;

    $: wand = [];

    async function fetchWand() {
        let response = await fetch(`${$BASE_URL}/wand/${user.fk_wand_id}`, {
            method: "GET",
            headers: {
                Authorization: "Bearer " + $jwtToken,
            },
        });

        const result = await response.json();
        console.log(result);
        console.log($global_user);
        wand = result.wand;
    }

    /*  onMount(fetchWand); */
    fetchWand();
</script>

<h2>
    <i class="fa-solid fa-wand-magic-sparkles" />Wand: {wand.wand_name}
    <i class="fa-solid fa-wand-magic-sparkles" />
</h2>

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
        border-radius: 2px;
        padding: 10px 0;
    }

    #wand_box div {
        width: 33%;
    }
</style>
