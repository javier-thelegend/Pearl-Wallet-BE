#BUILD
#docker build -t pearl-wallet-be:0.1.0 -f Dockerfile .

#RUN
#docker run --rm -p 3800:3800 -e POSTGRE_PASS=admin -e POSTGRE_HOST=192.168.1.37 -d pearl-wallet-be:0.1.0 (ok)
# -rm delete the containes once it's stopped
#docker run -p 3800:3800 -e POSTGRE_PASS=admin -e POSTGRE_HOST=192.168.1.37 -d pearl-wallet-be:0.1.0 (ok)
#docker run -p 3800:3800 -d pearl-wallet-be:0.1.0 (Ok)
#Check the port is mapped
#POSTGRE_HOST is Private IP see it with ipconfig in cmd

#POSTGRESQL
#Modify pg_hba.conf
#Under # IPv4 local connections:
#Add host    all             all             0.0.0.0/0            scram-sha-256
#Comment line host    all             all             127.0.0.1/32            scram-sha-256 under # IPv4 local connections:

#node --version
FROM node:14.17.6 

#Workdir
WORKDIR /app

#Copy all files where this file is located to /app
COPY . /app

#Environment Variables
ENV POSTGRE_USER=postgres
#Using dummy password it is overwritten in RUN command
ENV POSTGRE_PASS=admin
ENV POSTGRE_HOST=172.17.224.1
ENV POSTGRE_DATABASE=pearl-wallet
ENV POSTGRE_PORT=5432

#Install Node
RUN npm install

#Port to use
EXPOSE 3800

#Run App
CMD [ "node", "app.js"]