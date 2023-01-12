import "dotenv/config";
import express from "express";

const app = express();

import cors from "cors";
app.use(cors());

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



const PORT = 8080 || process.env.PORT;
app.listen(PORT, () => console.log("The server is running on port:", PORT))