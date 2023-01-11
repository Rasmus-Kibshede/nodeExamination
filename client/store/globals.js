import { readable, writable, get } from "svelte/store";

let localData = localStorage.getItem("global_user")
export const global_user = writable(localData ? JSON.parse(localData) : null);

/* export const global_user = writable(null); */

export const BASE_URL = readable("http://localhost:8080");