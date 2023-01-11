import { Router } from "express"
import db from "../database/connection.js"
const router = Router();


router.post("/user", async (req, res) => {
    const user = req.body;
    const [rows, _] = await db.execute("UPDATE users SET user_firstname = ?, user_lastname = ?, user_email = ? WHERE user_id = ?",
        [user.user_firstname, user.user_lastname, user.user_email, user.user_id]);
    if (rows.affectedRows) {
        res.status(200).send({ message: "User updated" });
    } else {
        res.status(400).send({ message: "Update error" });
    }
});




export default router;