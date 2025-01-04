import java.sql.{Connection, DriverManager, PreparedStatement}

object SQLiteApp {
  def main(args: Array[String]): Unit = {
    // Solicitar palabra desde la línea de comandos
    print("Por favor, ingresa una palabra: ")
    val palabra = scala.io.StdIn.readLine()

    // Ruta del archivo SQLite
    val databasePath = "palabras.db"

    // Crear conexión a la base de datos
    val connection: Connection = DriverManager.getConnection(s"jdbc:sqlite:$databasePath")

    try {
      // Crear tabla si no existe
      val createTableSQL =
        """
          |CREATE TABLE IF NOT EXISTS palabras (
          |    id INTEGER PRIMARY KEY AUTOINCREMENT,
          |    texto TEXT NOT NULL
          |);
          |""".stripMargin
      val statement = connection.createStatement()
      statement.execute(createTableSQL)

      // Insertar la palabra en la tabla
      val insertSQL = "INSERT INTO palabras (texto) VALUES (?)"
      val preparedStatement: PreparedStatement = connection.prepareStatement(insertSQL)
      preparedStatement.setString(1, palabra)
      preparedStatement.executeUpdate()

      println(s"La palabra '$palabra' se ha agregado correctamente a la base de datos.")
    } catch {
      case e: Exception => println(s"Ocurrió un error: ${e.getMessage}")
    } finally {
      connection.close()
    }
  }
}