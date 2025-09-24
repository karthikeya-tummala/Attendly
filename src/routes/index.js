import { StudentRouter } from "./StudentRoutes.js";

function routes(app) {
    app.use('/students', StudentRouter);
}

export default routes;