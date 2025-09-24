import { pool } from '../../../config/db.js';

export const GetStudents = async (req, res) => {
    const { organisation_code } = req.params;
    
    if (!organisation_code) return res.status(400).json({ error: 'organisation_code required' });
    
    try {
        // Fetch the organisation UUID from code
        const orgRes = await pool.query(
            'SELECT organisation_id FROM organisations WHERE code=$1',
            [organisation_code]
        );
        
        if (!orgRes.rows[0]) {
            return res.status(404).json({ error: 'Organisation not found' });
        }
        
        const orgId = orgRes.rows[0].organisation_id;
        
        // Fetch students for that organisation
        const { rows } = await pool.query(
            `SELECT person_id, name, email, roll_no
             FROM people
             WHERE role='student' AND organisation_id=$1
             ORDER BY name`,
            [orgId]
        );
        
        return res.status(200).json({ students: rows });
    } catch (e) {
        console.error('Error fetching students:', e);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};
