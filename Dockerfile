# --- Build Phase ---
FROM node:16-alpine AS builder

# specify working directory 
WORKDIR '/app'

# install dependencies 
COPY package.json .
RUN npm install 

COPY . .
RUN npm run build

# --- Run Phase ---
FROM nginx
# copy build file from build phase
COPY --from=builder /app/build /usr/share/nginx/html

