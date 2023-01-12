<script>
    /* import { global_user } from "../../../store/globals.js";
    const user = $global_user; */
    export let user;
</script>

<div id="user_info_box">
    <div class="flex_box_span">
        <span>Firstname: </span>
        <span>{user.user_firstname}</span>
    </div>
    <div class="flex_box_span">
        <span>Lastname: </span>
        <span>{user.user_lastname}</span>
    </div>
    <div class="flex_box_span">
        <span>Email: </span>
        <span>{user.user_email}</span>
    </div>
</div>

<style>
    #user_info_box {
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
        align-content: space-around;
        text-align: start;
        width: 50%;
        margin: 20px auto;
        background-color: rgba(250, 235, 215, 0.5);
        border: solid 1px white;
        border-radius: 2px;
        padding: 10px 0;
    }

    #user_info_box span:nth-child(odd) {
        font-weight: bold;
    }

    .flex_box_span {
        border-bottom: solid 1px black;
        display: flex;
        width: 50%;
        justify-content: space-between;
        margin: 10px 0;
    }
</style>
