import { StudentRouter } from "./StudentRoutes.js";
import {FacultyRouter} from "./FacultyRoutes.js";

function routes(app) {
    app.use('/students', StudentRouter);
    app.use('/faculty', FacultyRouter);
}

export default routes;