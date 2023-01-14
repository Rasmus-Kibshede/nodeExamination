<script>
    import {
        BASE_URL,
        global_user,
        saveUser,
        jwtToken,
        currentURL,
    } from "../../../store/globals.js";

    import { useNavigate, useLocation, Link } from "svelte-navigator";

    const navigate = useNavigate();
    const location = useLocation();

    // A part of menu page highlighter
    $currentURL = $location.pathname;

    async function login() {
        const user = {
            // @ts-ignore
            email: document.getElementById("login_email").value,
            // @ts-ignore
            password: document.getElementById("login_password").value,
        };

        if (!user.email || !user.password) {
            // @ts-ignore
            toastr.error("Error", "Fill out the blanks");
        } else {
            let response = await fetch(`${$BASE_URL}/login`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json;charset=utf-8",
                },
                body: JSON.stringify(user),
            });

            const result = await response.json();
            const message = result.message;

            // checks if the server response with a ok and then sets a global user
            if (response.ok) {
                $global_user = result.user;

                // JWT
                // sets a cookie with the jwt token
                $jwtToken = result.jwtToken;
                document.cookie = `token=${result.jwtToken}`;

                saveUser($global_user);

                const from = ($location.state && $location.state.from) || "/";
                navigate(from, { replace: true });

                // @ts-ignore
                toastr.success("Loggedin", message);
                // window.location.replace("/");
            } else {
                // @ts-ignore
                toastr.error("Error", message);
            }
        }
    }
</script>

<div id="div_login">
    <h1>Login</h1>

    <label for="login_email"><i class="fa-solid fa-envelope" />Email: </label>

    <input
        type="email"
        placeholder="Enter Email"
        id="login_email"
        name="email"
        value="ralle@gmail.com"
        required
    />
    <label for="login_password"><i class="fa-solid fa-key" />Password: </label>
    <input
        type="password"
        placeholder="Enter Password"
        id="login_password"
        name="password"
        value="123"
        required
    />
    <button type="submit" on:click={login} class="button"
        ><i class="fa-solid fa-right-to-bracket" />Login</button
    >
</div>

<Link to="/signup"><i class="fa-solid fa-user-plus" /> Signup</Link>

<!-- Forgot <a href="/"> password? </a> -->
<style>
    #div_login {
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
        align-content: space-around;
        width: 50%;
        margin: 0 auto;
    }
</style>
