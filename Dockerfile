# Use the official Spark image as a base image
FROM bitnami/spark:3.4.1

# Set the working directory inside the container
WORKDIR /app

# Copy WineQualityEval (containing the JAR) to the container
COPY wineTesting /app/wineTesting

# Copy WineQualityPredictionModel to /home/ubuntu
COPY WineQualityPredictionModel /home/ubuntu/WineQualityPredictionModel

# Copy ValidationDataset.csv to /home/ubuntu
COPY ValidationDataset.csv /home/ubuntu/ValidationDataset.csv

# Set the command to run your Spark job
CMD ["spark-submit", "--master", "local", "--class", "com.example.WineQualityEval", "/app/wineTesting/target/wine-quality-eval-1.0-SNAPSHOT.jar"]
