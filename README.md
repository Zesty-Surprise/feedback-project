# feedback-project

## Start the project

### Frontend + Backend + MongoDB
Fill in `.env`: `MONGODB_USERNAME` and `MONGODB_PASSWORD`
```bash
docker compose -f compose-full.yml -p app up --force-recreate --pull=always
```

### Backend + MongoDB
Fill in `.env`: `MONGODB_USERNAME` and `MONGODB_PASSWORD`
```bash
docker compose -f compose-backend.yml -p app up --force-recreate --pull=always
```

### Frontend
Fill in `.env`: `BACKEND_URL` and `BACKEND_PORT`
```bash
docker compose -f compose-frontend.yml -p app up --force-recreate --pull=always
```
