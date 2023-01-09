import { readable, writable, get } from "svelte/store";

export const global_user = writable(null);
export const user = get(global_user);

export const BASE_URL = readable("http://localhost:8080");