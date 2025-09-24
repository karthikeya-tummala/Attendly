import express from "express";
import "express-async-error";
import dotenv from "dotenv";
import cors from "cors";
import { pool } from './config/db.js';
import routes from "./src/routes/index.js";

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

// Global error handler
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ error: err.message });
});

app.get('/', (req, res) => res.send('Welcome to Attendly'));
// Test DB connection `on startup
try {
    const res = await pool.query('SELECT NOW()');
    console.log('Postgres is up:', res.rows[0]);
} catch (err) {
    console.error('Postgres connection error:', err);
}

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

routes(app);
export default app;