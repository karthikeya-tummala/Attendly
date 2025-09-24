import { pool } from '../../../config/db.js';

export const GetFacultyScheduleToday = async (req, res) => {
    const { organisation_code, emp_id } = req.params;
    console.log("Cache not used");
    if (!organisation_code || !emp_id) {
        return res.status(400).json({ error: 'organisation_code and emp_id required' });
    }
    
    try {
        // Get organisation_id
        const orgRes = await pool.query(
            'SELECT organisation_id FROM organisations WHERE code = $1',
            [organisation_code]
        );
        if (!orgRes.rows.length) {
            return res.status(404).json({ error: 'Organisation not found' });
        }
        const orgId = orgRes.rows[0].organisation_id;
        
        // Get teacher's person_id
        const teacherRes = await pool.query(
            'SELECT person_id FROM people WHERE emp_id = $1 AND organisation_id = $2',
            [emp_id, orgId]
        );
        if (!teacherRes.rows.length) {
            return res.status(404).json({ error: 'Faculty not found' });
        }
        const teacherId = teacherRes.rows[0].person_id;
        
        // Compute ISO day_of_week (Monday=1, Sunday=7)
        const dayOfWeek = new Date().getDay(); // Sunday=0
        const isoDay = dayOfWeek === 0 ? 7 : dayOfWeek;
        
        // Get today's schedules first, then filter by teacher
        const { rows } = await pool.query(
            `SELECT sc.schedule_id,
                    sc.slot, sc.location,
                    c.class_id, c.name AS class_name,
                    co.course_id, co.name AS course_name, co.code AS course_code
             FROM schedules sc
             JOIN classes c ON sc.class_id = c.class_id
             JOIN courses co ON c.course_id = co.course_id
             WHERE sc.day_of_week = $1
               AND sc.teacher_id = $2
             ORDER BY sc.slot`,
            [isoDay, teacherId]
        );
        
        return res.status(200).json({ schedule: rows });
    } catch (e) {
        console.error('Error fetching faculty schedule:', e);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};
