ARG NODE_VERSION=16.13-alpine

# DEPENDENCIES STAGE
# Install dependencies only when needed
FROM node:${NODE_VERSION} AS build
COPY  /node_modules ./node_modules
COPY package.json package-lock.json ./
COPY /pages ./pages
COPY /docker.tf ./
COPY /hello.yml ./
RUN npm run build


# PRODUCTION STAGE
# Copy the dependencies to the production image and run the application
FROM node:${NODE_VERSION} AS production
ENV NODE_ENV production
COPY --from=build . .

EXPOSE 3000


CMD ["npm", "start"]
