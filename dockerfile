FROM maven as build
WORKDIR /apps
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /apps
COPY --from=build /apps/target/Uber.jar /apps/
EXPOSE 9090
CMD ["java","-jar","Uber.jar"]
