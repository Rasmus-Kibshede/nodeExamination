import { Router } from "express";
import db from "../database/connection.js";


const router = Router();


router.get("/wand/:id", async (req, res) => {
    const [rows, fields] = await db.execute("SELECT * FROM wands where wand_id = ?", [req.params.id]);

    res.send({ wand: rows[0] })
});




export default router;