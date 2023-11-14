# feedback-project

## Start the project

### Frontend + Backend + MongoDB
Fill in `.env`: `MONGODB_USERNAME` and `MONGODB_PASSWORD`
```bash
docker compose -f compose-full.yml up --force-recreate --pull=always
```

### Backend + MongoDB
Fill in `.env`: `MONGODB_USERNAME` and `MONGODB_PASSWORD`
```bash
docker compose -f compose-backend.yml up --force-recreate --pull=always
```

### Frontend
Fill in `.env`: `BACKEND_URL` and `BACKEND_PORT`
```bash
docker compose -f compose-frontend.yml up --force-recreate --pull=always
```
