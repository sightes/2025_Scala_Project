name := "Simple_scala_api"
version := "0.1.0"
scalaVersion := "2.13.12"


lazy val root = (project in file("."))
  .settings(
    name := "simple_scala_api",
    version := "0.1",
    libraryDependencies ++= Seq(
      "com.typesafe.akka" %% "akka-http" % "10.2.10",
      "com.typesafe.akka" %% "akka-stream" % "2.6.20",
      "de.heikoseeberger" %% "akka-http-circe" % "1.39.2", // Cambiamos a Circe
      "io.circe" %% "circe-generic" % "0.14.3",
      "io.circe" %% "circe-parser" % "0.14.3"
    )
  )