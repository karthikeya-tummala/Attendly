import bcrypt from "bcryptjs";
import { pool } from "../../../config/db.js";
import jwt from "jsonwebtoken";

export const signup = async (req, res) => {
    const { name, email, password, role, organisation_code } = req.body;
    if (!name || !email || !password || !role || !organisation_code) {
        return res.status(400).json({
            success: false,
            message: "Missing required fields!!!"
        });
    }
    
    try {
        // Check if email already exists
        const exists = await pool.query('SELECT person_id FROM people WHERE email=$1', [email]);
        if (exists.rows.length) return res.status(400).json({ message: 'Email exists' });
        
        // Get organisation_id and details from code
        const orgRes = await pool.query(
            'SELECT organisation_id, name AS organisation_name, code AS organisation_code FROM organisations WHERE code = $1',
            [organisation_code]
        );
        if (!orgRes.rows.length) return res.status(404).json({ message: 'Organisation not found' });
        
        const org = orgRes.rows[0];
        
        // Hash password
        const hashed = bcrypt.hashSync(password, 8);
        
        // Insert user
        const insert = await pool.query(
            `INSERT INTO people (name, email, role, organisation_id, password_hash)
             VALUES ($1,$2,$3,$4,$5)
             RETURNING person_id, name, email, role, emp_id, organisation_id`,
            [name, email, role, org.organisation_id, hashed]
        );
        
        const user = insert.rows[0];
        
        // JWT payload same as login
        const payload = {
            person_id: user.person_id,
            name: user.name,
            email: user.email,
            emp_id: user.emp_id,
            role: user.role,
            organisation_id: user.organisation_id,
            organisation_name: org.organisation_name,
            organisation_code: org.organisation_code
        };
        
        const token = jwt.sign(payload, process.env.JWT_SECRET || "hackathon_secret", { expiresIn: '2h' });
        
        res.json({ token });
        
    } catch (e) {
        console.error('Signup error:', e);
        res.status(500).json({ message: 'Internal Server Error' });
    }
};
