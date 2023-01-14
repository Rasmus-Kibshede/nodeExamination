<script>
    import {
        global_user,
        BASE_URL,
        saveUser,
        jwtToken,
    } from "../../../store/globals.js";
    const user = $global_user;

    async function saveUserInfo() {
        const response = await fetch(`${$BASE_URL}/user`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json;charset=utf-8",
                Authorization: "Bearer " + $jwtToken,
            },
            body: JSON.stringify(user),
        });
        const result = await response.json();

        const message = result.messeage;
        if (response.ok) {
            saveUser($global_user);
            // @ts-ignore
            toastr.success("Updated", message);
        }
    }
</script>

<!-- <div id="user_info_box">
    <div class="flex_box">
        <label for="">Firstname: </label>
        <input bind:value={user.user_firstname} />
    </div>
    <div class="flex_box">
        <label for="">Lastname: </label>
        <input bind:value={user.user_lastname} />
    </div>
    <div class="flex_box">
        <label for="">Email: </label>
        <input bind:value={user.user_email} />
    </div>

    <div class="flex_box">
        <button on:click={saveUserInfo}>Save</button>
    </div>
</div> -->

<div>
    <table id="user_info_box">
        <tr class="flex_box">
            <td><label for="">Firstname: </label></td>
            <td><input bind:value={user.user_firstname} /></td>
        </tr>
        <tr class="flex_box">
            <td><label for="">Lastname: </label></td>
            <td><input bind:value={user.user_lastname} /></td>
        </tr>
        <tr class="flex_box">
            <td><label for="">Email: </label></td>
            <td><input bind:value={user.user_email} /></td>
        </tr>
        <tr>
            <td class="flex_box"
                ><button on:click={saveUserInfo}
                    ><i class="fa-solid fa-floppy-disk" /> Save</button
                ></td
            >
        </tr>
    </table>
</div>

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
