<script>
    import {
        global_user,
        currentURL,
        BASE_URL,
        jwtToken,
    } from "../../../store/globals.js";
    import User from "../../components/User/User.svelte";
    import Wand from "../../components/Wand/Wand.svelte";
    import CreateWand from "../../components/Wand/CreateWand.svelte";
    import House from "../../components/House/House.svelte";

    // A part of menu page highlighter
    import { useLocation } from "svelte-navigator";
    const location = useLocation();
    $currentURL = $location.pathname;
    let user = $global_user;

    async function randomHousePick() {
        const houses = ["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"];

        const randomHouseName =
            houses[Math.floor(Math.random() * houses.length)];

        const response = await fetch(`${$BASE_URL}/api/users/${user.user_id}`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json;charset=utf-8",
                Authorization: "Bearer " + $jwtToken,
            },
            body: JSON.stringify({
                house_name: randomHouseName,
                user_id: user.user_id,
            }),
        });

        const result = await response.json();
        const message = result.message;

        if (response.ok) {
            // $global_user.user_house = randomHouseName;
            user.user_house = randomHouseName;

            // @ts-ignore
            toastr.success(message);
        } else {
            // @ts-ignore
            toastr.error(message);
        }
    }
</script>

<h1>Welcome {user.user_firstname} {user.user_lastname}</h1>

<User {user} />

{#if user.fk_wand_id != null}
    <Wand />
{:else}
    <CreateWand />
{/if}

{#if user.user_house}
    <House house_name={user.user_house} />
{:else}
    <i class="fa-solid fa-hat-wizard" />
    <button on:click={randomHousePick}
        >Let the sorting hat pick a house for you</button
    >
{/if}
