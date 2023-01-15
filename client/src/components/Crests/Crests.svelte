<script>
    import { BASE_URL } from "../../../store/globals.js";
    import { onMount } from "svelte";
    const path = "../../../public/crests/";

    let houses = [];

    async function fetchHouses() {
        const resposne = await fetch(`${$BASE_URL}/api/houses`);

        const result = await resposne.json();

        const message = result.message;

        if (resposne.ok) {
            houses = result.houses;
        } else {
            // @ts-ignore
            toastr.error(message);
        }
    }

    onMount(fetchHouses);
</script>

{#each houses as { house_name, house_description, house_img_name }}
    <div class="flexbox_crest">
        <div>
            <h2>{house_name}</h2>
            <img
                width="200px"
                src={path + house_img_name}
                alt="{house_name} creast"
            />
        </div>
        <p>{house_description}</p>
    </div>
{/each}

<style>
    .flexbox_crest {
        display: flex;
        align-items: baseline;
        margin-bottom: 50px;
        padding: 10px;
        background-color: rgba(0, 0, 0, 0.1);
    }

    .flexbox_crest:nth-child(even) {
        flex-direction: row-reverse;
    }

    p {
        text-align: start;
        line-height: 25px;
    }
</style>
