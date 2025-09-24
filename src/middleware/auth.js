import jwt from 'jsonwebtoken';

const SECRET = process.env.JWT_SECRET || 'hackathon_secret';

export function authenticate(req, res, next) {
    const authHeader = req.headers['authorization'];
    const token = authHeader?.split(' ')[1];
    if (!token) return res.status(401).json({ message: 'No token provided' });
    
    try {
        req.user = jwt.verify(token, SECRET);
        next();
    } catch {
        return res.status(403).json({ message: 'Invalid token' });
    }
}

export function authorize(roles = []) {
    return (req, res, next) => {
        if (!roles.includes(req.user.role)) return res.status(403).json({ message: 'Forbidden' });
        next();
    };
}

export { SECRET };
