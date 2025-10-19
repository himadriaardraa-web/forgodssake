# Attendance App

This repository contains a Node.js + Express attendance register application with a static front-end in `public/`.

Quick facts

- Start command: `npm start` (runs `node server/app.js`)
- Uses MongoDB (set `MONGODB_URI` in environment)
- JWT secret via `JWT_SECRET`
- Dockerfile present for containerized deploy

Deploy to Render (recommended, simple)

1. Push this repository to GitHub.
2. Create a new Web Service on Render and connect your GitHub repository.
   - If a `Dockerfile` is present, Render will use it automatically. Otherwise set the Start Command to `npm start`.
3. Set environment variables on Render:
   - `MONGODB_URI` - MongoDB connection string (Atlas recommended)
   - `JWT_SECRET` - a long random string
4. Deploy and open the public URL Render provides.

Local run

1. Install dependencies:

```
npm ci
```

2. Start locally (requires a running MongoDB instance):

```
setx MONGODB_URI "mongodb://localhost:27017/attendanceDB"
setx JWT_SECRET "your_jwt_secret"
npm start
```

Health-check endpoint: `GET /` will return the app root page.

If you want me to push and connect this repo to Render, tell me and provide either a GitHub token or run the push yourself and paste the repo URL here.
