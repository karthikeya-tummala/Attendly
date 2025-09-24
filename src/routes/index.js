import { StudentRouter } from "./StudentRoutes.js";
import {FacultyRouter} from "./FacultyRoutes.js";
import {AttendanceRouter} from "./AttendanceRoutes.js";

function routes(app) {
    app.use('/students', StudentRouter);
    app.use('/faculty', FacultyRouter);
    app.use('/attendance', AttendanceRouter);
}

export default routes;