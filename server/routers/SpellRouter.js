import { Router } from "express"
import db from "../database/connection.js"
import { authenticateToken } from "../util/auth.js";
// import fs from "fs";

const router = Router();


router.get("/api/spells", async (req, res) => {
    const [rows, _] = await db.execute("SELECT * FROM spells");

    if (rows) {
        res.status(200).send({ spells: rows });
    } else {
        res.status(400).send({ message: "No spells found" });
    }
});

router.get("/api/spells/:id", async (req, res) => {
    const [rows, _] = await db.execute("SELECT fk_spell_id FROM users_spells WHERE fk_user_id = ?",
        [req.params.id]);

    if (rows) {
        res.status(200).send({ spell_ids: rows });
    } else {
        res.status(400).send({ message: "No spells found" });
    }
});

router.delete("/api/spells/:id", authenticateToken, async (req, res) => {
    const [rows, _] = await db.execute("DELETE FROM users_spells WHERE fk_user_id = ? AND fk_spell_id = ?",
        [req.body.user_id, req.params.id]);

    if (rows) {
        res.status(200).send({ message: "Spell deleted" });
    } else {
        res.status(400).send({ message: "No spells found" });
    }
});


router.post("/api/spells", authenticateToken, async (req, res) => {

    const spell_id = req.body.spell_id;
    const user_id = req.body.user_id;

    const [rows, _] = await db.execute("INSERT INTO users_spells (fk_user_id, fk_spell_id) VALUES (?, ?)",
        [user_id, spell_id]);

    if (rows.affectedRows) {
        res.status(200).send({ message: "Spell saved" });
    } else {
        res.status(400).send({ message: "Spell not saved" });
    }


});

// Get spells from json file
// router.get("/api/spells", (req, res) => {

//     let data = fs.readFileSync('spells.json');

//     let spells = JSON.parse(data);

//     res.status(200).send({ spells: spells });
// });

export default router;