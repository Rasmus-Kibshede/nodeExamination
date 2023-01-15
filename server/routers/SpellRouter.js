import { Router } from "express"
import db from "../database/connection.js"
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

// Get spells from json file
// router.get("/api/spells", (req, res) => {

//     let data = fs.readFileSync('spells.json');

//     let spells = JSON.parse(data);

//     res.status(200).send({ spells: spells });
// });

export default router;