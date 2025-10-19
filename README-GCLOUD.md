Deploying to Google Cloud Run

Prerequisites:
- Google Cloud SDK installed and configured: `gcloud auth login` and `gcloud config set project YOUR_PROJECT_ID`
- Billing enabled and Cloud Run API enabled.

Quick steps (recommended: Artifact Registry):

1. Build container image (replace REGION and REPO):

   gcloud builds submit --tag REGION-docker.pkg.dev/PROJECT/REPO/attendance-app:latest

2. Deploy to Cloud Run:

   gcloud run deploy attendance-app \
     --image REGION-docker.pkg.dev/PROJECT/REPO/attendance-app:latest \
     --platform managed \
     --region REGION \
     --allow-unauthenticated \
     --set-env-vars MONGODB_URI=YOUR_MONGO_CONNECTION_STRING

Notes:
- Set `MONGODB_URI` to your hosted MongoDB connection string (Atlas or other). The app currently uses `mongoose.connect('mongodb://localhost:27017/attendanceDB')` by default; you should replace that with `process.env.MONGODB_URI` in production or set the environment variable accordingly.
- Cloud Run sets the `PORT` environment variable automatically; the app will use it.

Alternative: Using Container Registry (gcr.io) — change tags accordingly.
