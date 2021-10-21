#BUILD
#docker build -t pearl-wallet-be:0.1.0 -f Dockerfile .

#RUN
#docker run -p 3800:3800 -e POSTGRES_PASS=admin POSTGRES_HOST=<ip privada> -d pearl-wallet-be:0.1.0
#docker run -p 3800:3800 -d pearl-wallet-be:0.1.0 (Ok)
#Check the port is mapped

#node --version
FROM node:14.17.6 

#Workdir
WORKDIR /app

#Copy all files where this file is located to /app
COPY . /app

#Environment Variables
ENV POSTGRE_USER=postgres
#Using dummy password it is overwritten in RUN command
ENV POSTGRE_PASS=dummyPassword
ENV POSTGRE_HOST=localhost
ENV POSTGRE_DATABASE=pearl-wallet
ENV POSTGRE_PORT=5432

#Install Node
RUN npm install

#Port to use
EXPOSE 3800

#Run App
CMD [ "node", "app.js"]