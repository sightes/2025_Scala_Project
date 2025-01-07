import akka.actor.ActorSystem
import akka.http.scaladsl.Http
import akka.http.scaladsl.server.Directives._
import akka.stream.ActorMaterializer
import scala.concurrent.Await
import scala.concurrent.duration.Duration
import scala.sys.ShutdownHookThread

object SimpleScalaApi extends App {
  implicit val system: ActorSystem = ActorSystem("simple-scala-api")
  implicit val materializer: ActorMaterializer = ActorMaterializer()
  implicit val executionContext = system.dispatcher

  val routes = pathPrefix("api") {
    concat(
      path("health") {
        get {
          complete("Server is running!")
        }
      }
    )
  }

  val bindingFuture = Http().newServerAt("localhost", 8080).bind(routes)

  println("Server online at http://localhost:8080/api/health")

  ShutdownHookThread {
    println("Shutting down server...")
    system.terminate()
  }

  Await.result(bindingFuture, Duration.Inf)
}
