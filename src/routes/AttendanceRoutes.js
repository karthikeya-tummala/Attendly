import express from "express";
import { MarkAttendance } from "../controllers/attendance/index.js";

export const AttendanceRouter = express.Router();

AttendanceRouter.post('/:class_id', MarkAttendance);