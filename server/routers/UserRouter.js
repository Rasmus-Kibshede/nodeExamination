import { Router } from "express"
import db from "../database/connection.js"
const router = Router();

// Authorization case
router.post("/user", async (req, res) => {
    if (req.session && (req.session.user_user_id == req.body.user_id || req.session.user.fk_role_id == 1)) {
        const user = req.body;
        const [rows, _] = await db.execute("UPDATE users SET user_firstname = ?, user_lastname = ?, user_email = ? WHERE user_id = ?",
            [user.user_firstname, user.user_lastname, user.user_email, user.user_id]);
        if (rows.affectedRows) {
            res.status(200).send({ message: "User updated" });
        } else {
            res.status(400).send({ message: "Update error" });
        }
    } else {
        res.send({ message: "Authorization permission denied" })
    }
});




export default router;