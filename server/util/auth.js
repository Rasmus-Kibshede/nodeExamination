import jwt from "jsonwebtoken";


export function authenticateToken(req, res, next) {
    const authHeader = req.headers['authorization']
    const token = authHeader && authHeader.split(' ')[1]
    if (token == null) return res.status(401).send({ message: "Authorization permission denied" })

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).send({ message: "Authorization permission denied" })

        // authorization of user
        if (req.body.user_id !== user.user_id && user.fk_role_id !== 1) return res.status(403).send({ message: "Authorization permission denied" })

        next()
    })
}




