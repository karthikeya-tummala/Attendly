import express from 'express';
import { login, signup, ResetPassword } from "../controllers/auth/index.js";

export const AuthRouter = express.Router();

AuthRouter.post('/login', login);
AuthRouter.post('/signup', signup);
AuthRouter.post('/reset', ResetPassword);