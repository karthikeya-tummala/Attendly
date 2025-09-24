import { pool } from '../../../config/db.js';

export const GetStudentsByClass = async (req, res) => {
    const { class_id } = req.params;
    
    if (!class_id) {
        return res.status(400).json({ error: 'class_id required' });
    }
    
    try {
        const query = `
            SELECT p.person_id, p.name, p.roll_no
            FROM student_classes sc
            JOIN people p ON sc.student_id = p.person_id
            WHERE sc.class_id = $1
            ORDER BY p.name;
        `;
        
        const { rows } = await pool.query(query, [class_id]);
        
        return res.status(200).json({ students: rows });
    } catch (e) {
        console.error('Error fetching students by class:', e);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};
