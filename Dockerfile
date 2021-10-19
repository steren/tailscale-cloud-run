FROM node:14
WORKDIR /app

ENV TSFILE=tailscale_1.16.0_amd64.tgz
RUN wget https://pkgs.tailscale.com/stable/${TSFILE} && \
  tar xzf ${TSFILE} --strip-components=1

COPY package*.json ./
RUN npm install --only=production
COPY . ./

CMD ["/app/start.sh"]
