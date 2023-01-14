import { Router } from "express";
import db from "../database/connection.js";
import { authenticateToken } from "../util/auth.js";


const router = Router();


router.get("/wand/:id", async (req, res) => {
    const [rows, fields] = await db.execute("SELECT * FROM wands where wand_id = ?", [req.params.id]);

    res.send({ wand: rows[0] })
});

router.post("/wand", authenticateToken, async (req, res) => {
    const wand = req.body;
    const [rows, _] = await db.execute("INSERT INTO wands(wand_name, wand_core, wand_wood, wand_length) VALUES (?,?,?,?)",
        [wand.wand_name, wand.wand_core, wand.wand_wood, wand.wand_length]);

    if (rows.affectedRows) {
        const [result, _] = await db.execute("UPDATE users SET fk_wand_id = ? WHERE user_id = ?",
            [rows.insertId, wand.user_id]);

        if (result.affectedRows) {
            res.status(200).send({
                message: "Wand created",
                wand_id: rows.insertId
            });
        }
    } else {
        res.status(400).send({ message: "ERROR" });
    }
});

export default router;