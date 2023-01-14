import { Router } from "express";
import db from "../database/connection.js";
import { passwordCompare } from "../util/encryption.js";
import jwt from "jsonwebtoken";

const router = Router();

router.post("/login", async (req, res, next) => {
    //Session check

    const authHeader = req.headers['authorization']
    const token = authHeader && authHeader.split(' ')[1]

    if (token != null) {

        jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
            req.user = user
            console.log(user);
        })

        res.status(200).send({ message: `You are already logged in as ${req.body.email}` });
    } else {
        next();
    }

}, async (req, res, next) => {
    //Database check
    const [rows, fields] = await db.execute("SELECT * FROM users WHERE user_email=?", [req.body.email]);
    const user = rows[0];
    let passwordMatch;
    if (user) {
        passwordMatch = await passwordCompare(req.body.password, rows[0].user_password);
    }

    if (passwordMatch) {
        delete user.user_password

        req.user = user
        next();
    } else {
        res.status(400).send({ message: "Wrong email or password" });
    }

}, (req, res) => {

    const accessToken = jwt.sign(req.user, process.env.ACCESS_TOKEN_SECRET);

    res.status(200).send({
        message: `Welcome ${req.body.email}`,
        user: req.user,
        jwtToken: accessToken
    });
});

router.get("/logout", (req, res) => {
<<<<<<< HEAD
    console.log(req.session);
    req.session.destroy();
=======
>>>>>>> jwt
    res.send({ message: "logged out" });
});


export default router;