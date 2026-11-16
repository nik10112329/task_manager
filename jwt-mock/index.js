import express from "express";
import jwt from "jsonwebtoken";
import cors from "cors";

const app = express();
app.use(cors());
app.use(express.json());

const JWT_SECRET = "super-secret";

// mock users
const users = [
  {
    id: "42",
    email: "user@test.com",
    password: "password",
    role: "user",
  },
];

// POST /login
app.post("/login", (req, res) => {
  const { email, password } = req.body;

  const user = users.find(
    u => u.email === email && u.password === password
  );

  if (!user) {
    return res.status(401).json({ message: "Invalid credentials" });
  }

  const token = jwt.sign(
    {
      sub: user.id,
      email: user.email,
      role: user.role,
    },
    JWT_SECRET,
    {
      expiresIn: "15m", // как в обычных API
    }
  );

  res.json({ access_token: token });
});

// JWT middleware
function authenticate(req, res, next) {
  const auth = req.headers.authorization;
  if (!auth) return res.sendStatus(401);

  const token = auth.split(" ")[1];

  try {
    req.user = jwt.verify(token, JWT_SECRET);
    next();
  } catch {
    res.sendStatus(401);
  }
}

// GET /profile
app.get("/profile", authenticate, (req, res) => {
  res.json({
    id: req.user.sub,
    email: req.user.email,
    role: req.user.role,
  });
});

app.listen(3000, () => {
  console.log("JWT mock server http://localhost:3000");
});
