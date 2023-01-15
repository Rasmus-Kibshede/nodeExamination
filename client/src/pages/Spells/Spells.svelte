<script>
    import { BASE_URL, currentURL } from "../../../store/globals";
    import { onMount } from "svelte";

    // A part of menu page highlighter
    import { useLocation } from "svelte-navigator";
    const location = useLocation();
    $currentURL = $location.pathname;

    async function fecthSpells() {
        const response = await fetch(`${$BASE_URL}/api/spells`);

        const result = await response.json();

        if (response.ok) {
            spells = result.spells;
        }
    }

    onMount(fecthSpells);

    let spells = [];

    let searchedSpell;

    $: search = spells.filter((spell) =>
        spell.spell_name.toLowerCase().includes(searchedSpell)
    );

    $: newSpells = searchedSpell ? search : spells;
</script>

<h1>Spells</h1>

<input
    type="text"
    placeholder="Search for a spell"
    bind:value={searchedSpell}
/>

{#each newSpells as { spell_name, spell_description }}
    <h4>{spell_name}</h4>
    <p>{spell_description}</p>
    <br />
{/each}

<style></style>
