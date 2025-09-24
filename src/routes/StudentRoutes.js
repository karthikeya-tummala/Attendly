import express from "express";
// import { GetStudents, AddStudent, UpdateStudent, DeleteStudent } from "../controllers/students/index.js";
import { GetStudents, GetStudentsByClass } from "../controllers/students/index.js";

export const StudentRouter = express.Router();

StudentRouter.get('/:organisation_code', GetStudents);
StudentRouter.get('/:organisation_code/:class_id', GetStudentsByClass);
