# gws-backend
GWS Backend is a backend application built using Go and the Fiber framework.

## Key Features
1. Mood Tracking API 
   - Create mood entries (POST /api/moods)
   - Retrieve all mood entries (GET /api/moods)
   - Retrieve mood entries by user_id (GET /api/moods/:user_id)
2. Mental Health News API
   - Get mental health news recommendations (GET /api/recommendation)

## Installation
Prerequisites 
- Go: Version 1.23 or later
- Docker
- Google Cloud Firestore

## Steps 
1. Clone this repository
```bash
git clone https://github.com/gws-app/gws-backend.git
cd gws-backend
```
2. Create a .env file
```bash
PORT=8080
```
Add other environment variables as needed.
3. Run the application locally
```bash
go run main.go
```
4. To run with Docker
   - Build the Docker image
```bash
docker build -t gws-backend .
```
  - Run the container
```bash
docker run -p 8080:8080 --env-file .env gws-backend
```

## API Documentation
1. Create a New Mood Entry
  - `POST /api/moods` 
  ```bash
    curl -X POST http://localhost:8080/api/moods \
    -F "user_id=reza" \
    -F "emotion=happy" \
    -F "activities={"kindness":["walking","meth"],"social": ["reading","cooking"]} \
    -F "note=huhahahahah" \
    -F "voice_note=voice_note.mp3"
```
  - Response:
```json
{
    "code": 201,
    "status": "Mood Created",
    "data": {
        "user_id": "test",
        "emotion": "happy",
        "activities": {
            "kindness": [
                "walking",
                "meth"
            ],
            "social": [
                "reading",
                "cooking"
            ]
        },
        "note": "huhahahahah",
        "voice_note_url": "https://storage.googleapis.com/gws-storage/test/vn-20241210074422.mp3",
        "created_at": "2024-12-10T07:44:22.653815692Z"
    }
}
```
2. Retrieve All Moods
  - GET /api/moods
  - Response:
```json
{
  "code": 200,
  "status": "success",
  "data": [
    {
      "user_id": "reza",
      "emotion": "meh",
      "activities": {
        "food": [
          "mie ayam",
          "bakwan jagung",
          "baso"
        ],
        "productivity": [
          "malas",
          "ternak lele"
        ],
        "sleep": [
          "ketindihan"
        ]
      },
      "note": "pusing gw cok, jumat deadline nya",
      "voice_note_url": "https://storage.googleapis.com/gws-storage/reza/vn-20241209153818.mp3",
      "created_at": "2024-12-09T08:38:19.517371Z"
    },
    {
      "user_id": "test",
      "emotion": "brunch",
      "activities": {
        "kindness": [
          "weed",
          "meth"
        ],
        "social": [
          "yapping",
          "barking"
        ]
      },
      "note": "i have no reason to life",
      "voice_note_url": "https://storage.googleapis.com/gws-storage/test/vn-20241203153752.mp3",
      "created_at": "2024-12-03T08:37:52.599917Z"
    },
    ...
  ]
}
```
3. Retrieve Moods by User ID
   - GET /api/moods/:user_id
   - Response:
```json
{
    "code": 200,
    "status": "success",
    "data": [
        {
            "user_id": "reza",
            "emotion": "meh",
            "activities": {
                "food": [
                    "mie ayam",
                    "bakwan jagung",
                    "baso"
                ],
                "productivity": [
                    "malas",
                    "ternak lele"
                ],
                "sleep": [
                    "ketindihan"
                ]
            },
            "note": "pusing gw cok, jumat deadline nya",
            "voice_note_url": "https://storage.googleapis.com/gws-storage/reza/vn-20241209153818.mp3",
            "created_at": "2024-12-09T08:38:19.517371Z"
        },
        ...
      ]
}
```
4. Get All News
  - GET /api/recommendation
  - Response :
```json
{
  "code": 200,
  "status": "success",
  "contents": [
    {
      "headline": "string",
      "description": "string",
      "url": "string",
      "text": "string"
    },
    ...
  ]
}
```