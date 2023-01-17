<script>
    import {
        BASE_URL,
        currentURL,
        jwtToken,
        global_user,
    } from "../../../store/globals";
    import { onMount } from "svelte";

    // A part of menu page highlighter
    import { useLocation } from "svelte-navigator";
    const location = useLocation();
    $currentURL = $location.pathname;

    let spells = [];
    let searchedSpell;
    let user_spells_ids = [];

    $: searchedSpells = searchedSpell ? search : spells;

    $: search = spells.filter((spell) =>
        spell.spell_name.toLowerCase().includes(searchedSpell)
    );

    async function fecthSpells() {
        const response = await fetch(`${$BASE_URL}/api/spells`);

        const result = await response.json();

        if (response.ok) {
            spells = result.spells;
        }

        if ($jwtToken) {
            const response = await fetch(
                `${$BASE_URL}/api/spells/${$global_user.user_id}`
            );

            const result = await response.json();

            if (response.ok) {
                user_spells_ids = result.spell_ids;
                user_spells_ids[0].test = true;
            }
        }
    }

    async function saveSpells(spell_id) {
        const response = await fetch(`${$BASE_URL}/api/spells`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json;charset=utf-8",
                Authorization: "Bearer " + $jwtToken,
            },
            body: JSON.stringify({
                user_id: $global_user.user_id,
                spell_id: spell_id,
            }),
        });

        const result = await response.json();

        const message = result.message;

        if (response.ok) {
            // @ts-ignore
            toastr.success(message);
        } else {
            // @ts-ignore
            toastr.error(message);
        }
    }

    async function deleteSpell(spell_id) {
        const response = await fetch(`${$BASE_URL}/api/spells/${spell_id}`, {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json;charset=utf-8",
                Authorization: "Bearer " + $jwtToken,
            },
            body: JSON.stringify({
                user_id: $global_user.user_id,
            }),
        });

        const result = await response.json();

        const message = result.message;

        if (response.ok) {
            // @ts-ignore
            toastr.success(message);
        } else {
            // @ts-ignore
            toastr.error(message);
        }
    }

    onMount(fecthSpells);

    function spellActionHandler(spell_id) {
        user_spells_ids.some((item) => item.fk_spell_id === spell_id)
            ? deleteSpell(spell_id)
            : saveSpells(spell_id);
    }
</script>

<h1>Spells</h1>

<input
    type="text"
    placeholder="Search for a spell"
    bind:value={searchedSpell}
/>

{#each searchedSpells as spell}
    <div class="spell_box">
        <div>
            <h4>{spell.spell_name}</h4>
            <p>{spell.spell_description}</p>
        </div>
        {#if $jwtToken}
            <button on:click={() => spellActionHandler(spell.spell_id)}
                >{user_spells_ids.some(
                    (item) => item.fk_spell_id === spell.spell_id
                )
                    ? "Forget"
                    : "Learn"}</button
            >
        {/if}
    </div>
{/each}

<style>
    .spell_box {
        margin-bottom: 50px;
        padding: 10px;
        border: solid 1px black;
        border-radius: 3px;
        background-color: rgba(250, 235, 215, 0.7);
    }
</style>
