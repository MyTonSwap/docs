FROM node:lts as base
ENV FORCE_COLOR=0

RUN npm install -g pnpm

WORKDIR /opt/docusaurus

FROM base as prod

WORKDIR /opt/docusaurus

COPY . /opt/docusaurus/

RUN pnpm i

RUN pnpm run build

FROM prod as serve

EXPOSE 3000

CMD ["npm", "run", "serve", "--", "--host", "0.0.0.0", "--no-open"]
