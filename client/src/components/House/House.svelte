<script>
    export let house_name;

    import { BASE_URL } from "../../../store/globals.js";
    import { onMount } from "svelte";

    let house = [];
    const path = "../../../public/crests/";

    async function fetchHouse() {
        const resposne = await fetch(`${$BASE_URL}/api/houses/${house_name}`);

        const result = await resposne.json();

        const message = result.message;

        if (resposne.ok) {
            house = result.house;
        } else {
            // @ts-ignore
            toastr.error(message);
        }
    }

    onMount(fetchHouse);

    let showDescription;
</script>

<h2>House: {house.house_name}</h2>
<img
    width="200px"
    src={path + house.house_img_name}
    alt="{house_name} creast"
/>

<button on:click={() => (showDescription = !showDescription)}>
    {showDescription ? "Hide description" : "Show description"}
</button>
{#if showDescription}
    <p>{house.house_description}</p>
{/if}
