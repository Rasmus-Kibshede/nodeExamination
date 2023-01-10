import { Router } from "express";
import { sendMail } from "../util/sendMail.js";
import db from "../database/connection.js";
import { passwordEncryption } from "../util/encryption.js";

const router = Router();

const user = {};


router.post("/signup", async (req, res, next) => {

    user.email = req.body.email;
    user.encrypedPassword = await passwordEncryption(req.body.password);
    user.firstname = req.body.firstname;
    user.lastname = req.body.lastname;
    user.age = req.body.age;

    if (user.email && user.firstname && user.lastname && req.body.password) {
        next();
    } else {
        res.status(400).send({ message: "Asign the information fields" });
    }

}, async (req, res) => {
    const resposne = await db.execute(
        "INSERT INTO users (user_email, user_password, user_firstname, user_lastname) VALUES (?, ?, ?, ?);",
        [user.email, user.encrypedPassword, user.firstname, user.lastname]);

    if (resposne) {
        res.status(200).send({ message: "You are now signed up, you can now login" })
    } else {
        res.status(400).send({ message: "Database error" });
    }

    // remake with async await
    // skal ikke sende mails endnu, da der testes
    /* if (resposne) {
        sendMail(user.email, "Welcome to the pokemon website")
            .then(() => res.status(200).send({ message: "You are now signed up" }))
            .catch(errorMessage => res.status(400).send({ message: errorMessage }));
    } else {
        res.status(400).send({ message: "Database error" });
    } */



});




export default router;