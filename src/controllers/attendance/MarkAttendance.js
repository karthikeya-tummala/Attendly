import { pool } from '../../../config/db.js';

export const MarkAttendance = async (req, res) => {
    const { class_id } = req.params;
    const { course_id, method, marked_by, records } = req.body;
    const attendance_date = new Date().toISOString().split('T')[0];
    
    if (!class_id || !course_id || !method || !marked_by || !records?.length) {
        return res.status(400).json({ error: 'Missing required fields' });
    }
    
    try {
        const queries = records.map(r => {
            return pool.query(
                `INSERT INTO attendance
                    (student_id, class_id, course_id, attendance_date, status, method, marked_by)
                 VALUES ($1, $2, $3, $4, $5, $6, $7)
                 ON CONFLICT (student_id, class_id, attendance_date)
                 DO UPDATE SET status = EXCLUDED.status, method = EXCLUDED.method, updated_at = NOW()`,
                [r.student_id, class_id, course_id, attendance_date, r.status, method, marked_by]
            );
        });
        
        await Promise.all(queries);
        
        return res.status(200).json({ message: 'Attendance marked successfully' });
    } catch (e) {
        console.error('Error marking attendance:', e);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};
