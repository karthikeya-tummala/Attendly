import { pool } from "../../../config/db.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

export const login = async (req, res) => {
    const { email, password } = req.body;
    
    if (!email || !password) {
        return res.status(400).json({
            success: false,
            message: "Missing Required Fields!!!"
        });
    }
    
    const result = await pool.query(
        'SELECT person_id, email, password_hash, role FROM people WHERE email=$1',
        [email]
    );
    const user = result.rows[0];
    if (!user) return res.status(401).json({ message: 'Invalid credentials' });
    
    const valid = bcrypt.compareSync(password, user.password_hash);
    if (!valid) return res.status(401).json({ message: 'Invalid credentials' });
    
    const token = jwt.sign(
        {
            person_id: user.person_id,
            name: user.name,
            email: user.email,
            emp_id: user.emp_id,
            role: user.role
        },
        process.env.JWT_SECRET || "hackathon_secret"
    );
    
    res.json({ token });
}