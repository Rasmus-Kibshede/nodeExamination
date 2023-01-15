import { Router } from "express";
import db from "../database/connection.js";

const router = Router();


router.get("/api/houses", async (req, res) => {
    const [rows, _] = await db.execute("SELECT * FROM houses");

    if (rows) {
        res.status(200).send({
            houses: rows
        });
    } else {
        res.status(400).send({ message: "Error, houses database error" })
    }
});






export default router;