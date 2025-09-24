import express from "express";
import { GetFacultyScheduleToday } from "../controllers/faculty/index.js";

export const FacultyRouter = express.Router();

FacultyRouter.get('/get_today_schedule/:organisation_code/:emp_id', GetFacultyScheduleToday);