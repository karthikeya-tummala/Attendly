import bcrypt from "bcryptjs";
import { pool } from "../../../config/db.js";
import jwt from "jsonwebtoken";


export const signup = async (req, res) => {
    const { name, email, password, role, organisation_id } = req.body;
    if (!name || !email || !password || !role || !organisation_id) {
        return res.status(400).json({
            success: false,
            message: "Missing required fields!!!"
        });
    }
    
    const exists = await pool.query('SELECT person_id FROM people WHERE email=$1', [email]);
    if (exists.rows.length) return res.status(400).json({ message: 'Email exists' });
    
    const hashed = bcrypt.hashSync(password, 8);
    
    const insert = await pool.query(
        `INSERT INTO people (name, email, role, organisation_id, password_hash)
     VALUES ($1,$2,$3,$4,$5)
     RETURNING person_id, email, role`,
        [name, email, role, organisation_id, hashed]
    );
    
    const user = insert.rows[0];
    const token = jwt.sign({ id: user.person_id, role: user.role }, SECRET, { expiresIn: '2h' });
    
    res.json({ token });
}