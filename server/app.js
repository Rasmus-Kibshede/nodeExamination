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

io.on('connection', async (socket) => {
    const [rows, _] = await db.execute("SELECT * FROM users");

    socket.emit("test", rows)
});



const PORT = 8080 || process.env.PORT;
server.listen(PORT, () => console.log("The server is running on port:", PORT))