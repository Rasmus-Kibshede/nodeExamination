<script>
    import { BASE_URL } from "../../../store/globals";
    import { onMount } from "svelte";

    let spells = [];

    async function fecthSpells() {
        const response = await fetch(`${$BASE_URL}/api/spells`);

        const result = await response.json();

        if (response.ok) {
            spells = result.spells;
        }
    }

    onMount(fecthSpells);
</script>

<h1>Spells</h1>

{#each spells as { name, description }}
    <h4>{name}</h4>
    <p>{description}</p>
    <br />
{/each}

<style></style>
