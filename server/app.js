import "dotenv/config";
import express from "express";
import { Server } from "socket.io";
import http from "http";
import jwt from "jsonwebtoken"


const app = express();
const server = http.createServer(app);

// ------------------ Session ------------------ 
import cors from "cors";
app.use(cors({ credentials: true, origin: true }));

app.use(express.json());

const io = new Server(server, {
    cors: {
        origin: "http://localhost:5173",
        methods: ["GET", "POST", "PUT", "PATCH", "DELETE"]
    }
});


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

import spellRouter from "./routers/SpellRouter.js";
app.use(spellRouter)

import houseRouter from "./routers/HouseRouter.js";
app.use(houseRouter)



// ------------------------------------------- websockets
import db from "./database/connection.js"

// get users
async function getUsers() {
    const [rows, _] = await db.execute("SELECT * FROM users");

    //Removes password, so password is not visable on frontend
    rows.forEach((row) => { delete row.user_password });
    return rows;
}

//get roles
async function getRoles() {
    const [rows, _] = await db.execute("SELECT * FROM roles");
    return rows;
}


function socket_auth(token, user) {
    // console.log("token", token);

    const userData = user;

    let isAuth = false;

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        // if (err) return res.sendStatus(403)
        // console.log("user", user);
        isAuth = true;
    });

    return isAuth
};


// listen on a connection
io.on('connection', async (socket) => {

    // Sends data on the socket
    socket.emit("users", await getUsers());

    socket.emit("roles", await getRoles())

    socket.on("users", async () => {
        users = await getUsers();
    })

    socket.on("update user", async (data) => {

        if (socket_auth(data.token, data.user)) {
            const user = data.user
            const [rows, _] = await db.execute("UPDATE users SET user_firstname = ?, user_lastname = ?, user_email = ?, fk_role_id = ? WHERE user_id = ?",
                [user.user_firstname, user.user_lastname, user.user_email, user.fk_role_id, user.user_id]);

            socket.emit("status", {
                success: rows.affectedRows,
                word: "updated"
            });
        } else {
            socket.emit("status", {
                success: 0,
                word: "updated"
            });
        }
    });

    socket.on("delete user", async (data) => {
        const [rows, _] = await db.execute("DELETE FROM users WHERE user_id = ?",
            [data.user.user_id]);

        socket.emit("status", {
            success: rows.affectedRows,
            word: "deleted"
        });

        socket.emit("users", await getUsers());
    });
});



const PORT = 8080 || process.env.PORT;
server.listen(PORT, () => console.log("The server is running on port:", PORT))