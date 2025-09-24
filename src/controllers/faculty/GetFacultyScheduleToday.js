import { pool } from '../../../config/db.js';

export const GetFacultyScheduleToday = async (req, res) => {
    const { organisation_code, emp_id, day_of_week } = req.params;
    console.log(organisation_code, emp_id, day_of_week);
    if (!organisation_code || !emp_id || !day_of_week) {
        return res.status(400).json({ error: 'organisation_code, emp_id, and day_of_week are required' });
    }
    
    try {
        // Get organisation_id
        const orgRes = await pool.query(
            'SELECT organisation_id FROM organisations WHERE code = $1',
            [organisation_code]
        );
        if (!orgRes.rows.length) return res.status(404).json({ error: 'Organisation not found' });
        
        const organisationId = orgRes.rows[0].organisation_id;
        
        // Get person_id for the employee in that organisation
        const facultyRes = await pool.query(
            'SELECT person_id FROM people WHERE emp_id = $1 AND organisation_id = $2',
            [emp_id, organisationId]
        );
        if (!facultyRes.rows.length) return res.status(404).json({ error: 'Faculty not found' });
        
        const facultyId = facultyRes.rows[0].person_id;
        
        // Fetch schedules for the given day
        const scheduleRes = await pool.query(
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
            [day_of_week, facultyId]
        );
        
        return res.status(200).json({ schedule: scheduleRes.rows });
    } catch (err) {
        console.error('Error fetching schedule:', err);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};
