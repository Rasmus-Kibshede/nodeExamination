import "dotenv/config";
import mysql from "mysql2/promise";

// need to create the database first!

const connection = await mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: "wizardworld"
});


export default connection;