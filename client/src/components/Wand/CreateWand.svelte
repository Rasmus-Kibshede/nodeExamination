<script>
    import { global_user, BASE_URL, saveUser } from "../../../store/globals.js";
    const user = $global_user;
    const wand = {
        wand_name: "",
        wand_core: "",
        wand_wood: "",
        wand_length: 0,
    };

    async function saveUserInfo() {
        const response = await fetch(`${$BASE_URL}/user`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json;charset=utf-8",
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

<div>
    <table id="user_info_box">
        <tr class="flex_box">
            <td><label for="">Wand name: </label></td>
            <td><input bind:value={wand.wand_name} /></td>
        </tr>
        <tr class="flex_box">
            <td><label for="">Core: </label></td>
            <td>
                <select name="Cores">
                    <!-- <option value="test core">test</option> -->
                </select>
            </td>
        </tr>
        <tr class="flex_box">
            <td><label for="">Wood: </label></td>
            <td>
                <select name="Woods">
                    <!-- <option value="test core">test</option> -->
                </select>
            </td>
        </tr>
        <tr class="flex_box">
            <td><label for="">Wand length: </label></td>
            <td><input bind:value={wand.wand_length} /></td>
        </tr>
        <tr>
            <td class="flex_box"
                ><button on:click={saveUserInfo}
                    ><i class="fa-solid fa-floppy-disk" /> Create</button
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
