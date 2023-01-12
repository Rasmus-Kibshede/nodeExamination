import "dotenv/config";
import express from "express";
import { Server } from "socket.io";
import http from "http";


const app = express();
const server = http.createServer(app);
const io = new Server(server, {
    cors: {
        origin: "http://localhost:5173",
        methods: ["GET", "POST", "PUT", "PATCH", "DELETE"]
    }
});


import cors from "cors";
app.use(cors({ credentials: true, origin: true }));

app.use(express.json());

// ------------------ Session ------------------ 
import session from "express-session";
app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false } //false we are not using https, but http
}));


import loginRouter from "./routers/LoginRouter.js"
app.use(loginRouter);

import wandRouter from "./routers/WandRouter.js"
app.use(wandRouter);

import signupRouter from "./routers/SigupRouter.js"
app.use(signupRouter)

import userRouter from "./routers/UserRouter.js"
app.use(userRouter)

import coreRouter from "./routers/CoreRouter.js"
app.use(coreRouter)

import woodRouter from "./routers/WoodRouter.js"
app.use(woodRouter)



// websockets
import db from "./database/connection.js"

let users = [];

async function getUsers() {
    const [rows, _] = await db.execute("SELECT user_id, user_firstname, user_lastname, user_email FROM users");
    return rows;
}

io.on('connection', async (socket) => {

    io.emit("users", await getUsers());

    socket.on("users", async () => {
        users = await getUsers();
    })

    socket.on("update user", async (data) => {
        const [rows, _] = await db.execute("UPDATE users SET user_firstname = ?, user_lastname = ?, user_email = ? WHERE user_id = ?",
            [data.user_firstname, data.user_lastname, data.user_email, data.user_id]);

        io.emit("status", {
            success: rows.affectedRows,
            word: "updated"
        });

    });

    socket.on("delete user", async (data) => {
        const [rows, _] = await db.execute("DELETE FROM users WHERE user_id = ?",
            [data.user_id]);

        io.emit("status", {
            success: rows.affectedRows,
            word: "deleted"
        });

        io.emit("users", await getUsers());
    });
});



const PORT = 8080 || process.env.PORT;
server.listen(PORT, () => console.log("The server is running on port:", PORT))