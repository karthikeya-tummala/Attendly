import { pool } from "../../../config/db.js";
import bcrypt from "bcryptjs";

export const ResetPassword = async (req, res) => {
    try {
        const { email, newPassword } = req.body;
        
        if (!email || !newPassword) {
            return res.status(400).json({
                success: false,
                message: "Email and new password are required"
            });
        }
        
        // Find user by email
        const result = await pool.query(
            "SELECT person_id FROM people WHERE email=$1",
            [email]
        );
        const user = result.rows[0];
        if (!user) {
            return res.status(404).json({
                success: false,
                message: "User not found"
            });
        }
        
        // Hash new password
        const hashed = bcrypt.hashSync(newPassword, 8);
        
        // Update password
        await pool.query(
            "UPDATE people SET password_hash=$1 WHERE person_id=$2",
            [hashed, user.person_id]
        );
        
        return res.json({
            success: true,
            message: "Password reset successfully"
        });
    } catch (e) {
        console.error(e);
        return res.status(500).json({
            success: false,
            message: "Server error"
        });
    }
};
