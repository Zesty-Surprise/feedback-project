# YourSurprise feedback collection system
This guide's main objective is to explain how to deploy the feedback collection solution developed by [HZ ICT students](https://github.com/orgs/Zesty-Surprise/people). Moreover, details on its architectures and difficulties encountered are shared.

## 1. With Docker Compose (might not work)
Warning: Compose fails to allow SMTP traffic. As of the end of 2023, we were not able to send emails by deploying with the configuration files provided in this repository.
Nonetheless, multiple files are present in `w-compose`. Once in the folder, edit `.env` before executing the commands below. See **Environment variables details** to know which values should be used.

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

## 2. Without Docker Compose (not full-proof)
The scripts present in `wout-compose` were used by a CI/CD pipeline. Although this method should work in most environments, it is not guaranteed.

### Configure start.sh
Edit `start.sh` to set the environment variables. See **Environment variables details** to know which values should be used.
### Start and Stop
Use `./start.sh` to start or restart the containers. Be careful, (re)starting prunes the MongoDB volume, and all persistent data will be lost.<\br>
Use `./stop.sh` to stop and prune the containers.


## 3. Manually without Docker containers
Due to differencies between production and development variables, it is not recomended to deploy the solution this way. 

### MongoDB
Any MongoDB instance should work. MongoDB 7 was used during development. There is no need to pre-create the schemas/documents.

### Backend
Fill in `.env`: `MONGODB_USERNAME` and `MONGODB_PASSWORD`
The backend is available at https://github.com/Zesty-Surprise/feedback-backend. Use `./start.sh` to run the development server.

### Frontend
Fill in `.env`: `BACKEND_URL` and `BACKEND_PORT`
The frontend is available at https://github.com/Zesty-Surprise/feedback-frontend. First run `npm install` before executing `npm run dev` to run the development server.


## Environment variables details
|    Variable   | Info                                                                                                                                                      |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| MONGODB_URL   | Connection string for the MongoDB. Should have the following format `mongodb://$MONGO_USERNAME:$MONGO_PASSWORD@$ADDRESS:27017/`                           |
| MAIL_USERNAME | Username of the Gmail account sending emails. Should be the string that prefixes `@` in an email address                                                    |
| MAIL_PASSWORD | Unique password of the Gmail account sending emails. Can be obtained by following this guide: https://support.google.com/mail/answer/185833?hl=en        |
| MAIL_FROM     | Sender's email address                                                                                                                                    |
| MAIL_PORT     | This variable should be set to 465                                                                                                                        |
| MAIL_SERVER   | SMTP server from which emails will be sent. `smtp.gmail.com` from Gmail                                                                                   |
| BACKEND_HOST  | HTTPS domain name of the backend server. AMP requires HTTP requests to be secure with the backend. Should have the following format `mybackendserver.com` |
