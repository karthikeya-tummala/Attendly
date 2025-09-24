import express from "express";
// import { GetStudents, AddStudent, UpdateStudent, DeleteStudent } from "../controllers/students/index.js";
import {GetStudents, GetStudentsByClass, GetStudentScheduleToday} from "../controllers/students/index.js";

export const StudentRouter = express.Router();

StudentRouter.get('/:organisation_code', GetStudents);
StudentRouter.get('/:class_id', GetStudentsByClass);
StudentRouter.get('/schedule/:student_id', GetStudentScheduleToday);