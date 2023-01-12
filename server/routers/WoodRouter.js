import { Router } from "express";
import db from "../database/connection.js"

const router = Router();


router.get("/wood", async (req, res) => {
    const [rows, _] = await db.execute("SELECT * FROM woods");

    if (rows) {
        res.status(200).send({ wood: rows })
    } else {
        res.status(400).send({ message: "Could not get wood from database" })
    }
});



export default router;