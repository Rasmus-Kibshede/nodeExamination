import { readable, writable } from "svelte/store";

let localData = localStorage.getItem("global_user")
export const global_user = writable(localData ? JSON.parse(localData) : null);

export function saveUser(global_user) {
    localStorage.setItem("global_user", JSON.stringify(global_user))
}

function getCookie(cname) {
    let name = cname + "=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let ca = decodedCookie.split(";");
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == " ") {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

export const jwtToken = writable(getCookie("token"));

export const BASE_URL = readable("http://localhost:8080");