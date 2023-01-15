import { Router } from "express"
import db from "../database/connection.js"
import { authenticateToken } from "../util/auth.js";

const router = Router();

// Authorization case
router.post("/user", authenticateToken, async (req, res) => {
    const user = req.body;

    const [rows, _] = await db.execute("UPDATE users SET user_firstname = ?, user_lastname = ?, user_email = ? WHERE user_id = ?",
        [user.user_firstname, user.user_lastname, user.user_email, user.user_id]);
    if (rows.affectedRows) {
        res.status(200).send({ message: "User updated" });
    } else {
        res.status(400).send({ message: "Update error" });
    }
});

router.patch("/users/:id", authenticateToken, async (req, res) => {
    const [rows, _] = await db.execute("UPDATE users SET user_house = ? WHERE user_id = ?",
        [req.body.house_name, req.params.id]);

    if (rows) {
        res.status(200).send({ message: "Updated your house" })
    } else {
        res.status(400).send({ message: "You did not get a house, try again" });
    }


});

export default router;