import { Router } from "express";
import db from "../database/connection.js";
import { passwordCompare } from "../util/encryption.js";

const router = Router();

router.post("/login", async (req, res, next) => {
    //Session check
    if (req.session.isLoggedIn) {
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

        /* TODO skal forbinelsen til næste lag laves om? Mangler viden */
        req.session.user = user
        next();
    } else {
        res.status(400).send({ message: "Wrong email or password" });
    }

}, (req, res) => {
    // Session set
    req.session.isLoggedIn = true;
    req.session.email = req.body.email;
    res.status(200).send({
        message: `Welcome ${req.body.email}`,
        user: req.session.user
    });
});

router.get("/logout", (req, res) => {
    req.session.destroy();
    res.send({ message: "logged out" });
});


export default router;