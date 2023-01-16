import { Router } from "express";
import db from "../database/connection.js"

const router = Router();


router.get("/api/cores", async (req, res) => {
    const [rows, _] = await db.execute("SELECT * FROM cores");
    if (rows) {
        res.status(200).send({ cores: rows });
    } else {
        res.status(400).send({ message: "could not get cores from database" });
    }
});


export default router;