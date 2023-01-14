<script>
    import {
        global_user,
        BASE_URL,
        saveUser,
        jwtToken,
    } from "../../../store/globals.js";
    import { onMount } from "svelte";
    const wand = {
        user_id: $global_user.user_id,
        wand_name: "",
        wand_core: "",
        wand_wood: "",
        wand_length: 0,
    };

    let cores = [];
    let wood = [];

    let selectedCore;
    let selectedWood;

    async function fetchCores() {
        const response = await fetch(`${$BASE_URL}/cores`);
        const result = await response.json();

        if (response.ok) {
            cores = result.cores;
        } else {
            // @ts-ignore
            toastr.error("Error", result.messeage);
        }
    }

    async function fetchWood() {
        const response = await fetch(`${$BASE_URL}/wood`);
        const result = await response.json();

        if (response.ok) {
            wood = result.wood;
        } else {
            // @ts-ignore
            toastr.error("Error", result.messeage);
        }
    }

    onMount(fetchCores);
    onMount(fetchWood);

    async function saveWand() {
        if (
            !wand.wand_name ||
            !wand.wand_core ||
            !wand.wand_wood ||
            !wand.wand_length
        ) {
            // @ts-ignore
            toastr.error("All fields must the filled");
        } else {
            const response = await fetch(`${$BASE_URL}/wand`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json;charset=utf-8",
                    Authorization: "Bearer " + $jwtToken,
                },
                body: JSON.stringify(wand),
            });
            const result = await response.json();

            // Update the fk_wand_id on the frontend store
            $global_user.fk_wand_id = result.wand_id;
            saveUser($global_user);

            const message = result.messeage;
            if (response.ok) {
                // @ts-ignore
                toastr.success("Wand created", message);
            }
        }
    }
</script>

{#if $global_user.fk_wand_id == null}
    <div>
        <table id="user_info_box">
            <tr class="flex_box">
                <th><h2>Create your wand</h2></th>
            </tr>
            <tr class="flex_box">
                <td><label for="">Wand name: </label></td>
                <td
                    ><input
                        placeholder="Enter a wand name"
                        bind:value={wand.wand_name}
                    /></td
                >
            </tr>
            <tr class="flex_box">
                <td><label for="">Core: </label></td>
                <td>
                    <select
                        name="Cores"
                        bind:value={selectedCore}
                        on:change={() => (wand.wand_core = selectedCore)}
                    >
                        <option value="0" selected disabled hidden
                            >Choose Core</option
                        >
                        {#each cores as core}
                            <option value={core.core_name}
                                >{core.core_name}</option
                            >
                        {/each}
                    </select>
                </td>
            </tr>
            <tr class="flex_box">
                <td><label for="">Wood: </label></td>
                <td>
                    <select
                        name="Wood"
                        bind:value={selectedWood}
                        on:change={() => (wand.wand_wood = selectedWood)}
                    >
                        <option value="0" selected disabled hidden
                            >Choose Wood</option
                        >
                        {#each wood as w}
                            <option value={w.wood_name}>{w.wood_name}</option>
                        {/each}
                    </select>
                </td>
            </tr>
            <tr class="flex_box">
                <td><label for="">Wand length: </label></td>
                <td><input type="number" bind:value={wand.wand_length} /></td>
            </tr>
            <tr>
                <td class="flex_box"
                    ><button on:click={saveWand}
                        ><i class="fa-solid fa-floppy-disk" /> Create</button
                    ></td
                >
            </tr>
        </table>
    </div>
{:else}
    <h2>You already have a wand</h2>
{/if}

<style>
    #user_info_box {
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
        text-align: start;
        width: 50%;
        margin: 20px auto;
        background-color: rgba(250, 235, 215, 0.5);
        border: solid 1px white;
        border-radius: 2px;
        padding: 10px 0;
    }

    .flex_box {
        display: flex;
        margin: 10px 0;
        flex-direction: column;
        flex-wrap: wrap;
        align-content: center;
    }

    label,
    input {
        font-size: medium;
    }
</style>
