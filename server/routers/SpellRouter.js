import { Router } from "express"
import fs from "fs";

const router = Router();


router.get("/api/spells", (req, res) => {

    let data = fs.readFileSync('spells.json');

    let spells = JSON.parse(data);

    res.status(200).send({ spells: spells });
});

export default router;