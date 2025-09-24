import { pool } from '../../../config/db.js';

export const GetStudentScheduleToday = async (req, res) => {
    const { student_id } = req.params;
    if (!student_id) return res.status(400).json({ error: 'student_id required' });
    
    try {
        const jsDow = new Date().getDay();
        const todayDow = jsDow === 0 ? 7 : jsDow;
        
        const query = `
      SELECT
        s.schedule_id,
        c.class_id,
        c.name       AS class_name,
        co.course_id,
        co.name      AS course_name,
        co.code      AS course_code,
        s.slot,
        s.location
      FROM schedules s
      JOIN classes c        ON s.class_id = c.class_id
      JOIN courses co       ON c.course_id = co.course_id
      JOIN student_classes stc ON stc.class_id = s.class_id
      WHERE stc.student_id = $1
        AND s.day_of_week   = $2
      ORDER BY s.slot;
    `;
        
        const { rows } = await pool.query(query, [student_id, todayDow]);
        return res.status(200).json({ schedule: rows });
    } catch (err) {
        console.error('GetStudentScheduleToday error:', err);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};
