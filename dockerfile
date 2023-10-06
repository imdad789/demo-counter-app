FROM maven as build
WORKDIR /apps
COPY . .
RUN mvn clean package

FROM openjdk:11
WORKDIR /apps
COPY --from=build /apps/target/
