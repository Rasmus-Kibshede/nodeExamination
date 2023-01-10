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



const PORT = 8080 || process.env.PORT;
app.listen(PORT, () => console.log("The server is running on port:", PORT))