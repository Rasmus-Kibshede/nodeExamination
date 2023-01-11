<script>
    import { global_user } from "../../../store/globals.js";
    const user = $global_user;

    function saveUser() {}
</script>

<div id="user_info_box">
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
        <button on:click={saveUser}>Save</button>
    </div>
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
        border-bottom: solid 1px black;
        display: flex;
        margin: 10px 0;
        justify-content: space-evenly;
    }
</style>
