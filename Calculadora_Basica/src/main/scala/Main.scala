import scala.io.StdIn.readLine

object BasicCalculator {
  def main(args: Array[String]): Unit = {
    println("=== Calculadora Básica en Scala ===")
    var continue = true

    while (continue) {
      try {
        // Solicitar entrada al usuario
        println("Introduce el primer número:")
        val num1 = readLine().toDouble

        println("Introduce el segundo número:")
        val num2 = readLine().toDouble

        println("Introduce la operación (+, -, *, /):")
        val operator = readLine()

        // Calcular el resultado
        val result = operator match {
          case "+" => num1 + num2
          case "-" => num1 - num2
          case "*" => num1 * num2
          case "/" => 
            if (num2 != 0) num1 / num2 
            else throw new ArithmeticException("No se puede dividir entre cero.")
          case _ => throw new IllegalArgumentException("Operador no válido.")
        }

        // Mostrar el resultado
        println(s"El resultado de $num1 $operator $num2 es: $result")

      } catch {
        case e: NumberFormatException => println("Error: Por favor introduce un número válido.")
        case e: ArithmeticException   => println(s"Error: ${e.getMessage}")
        case e: IllegalArgumentException => println(s"Error: ${e.getMessage}")
      }

      // Preguntar si el usuario quiere continuar
      println("¿Quieres realizar otra operación? (s/n):")
      continue = readLine().toLowerCase == "s"
    }

    println("¡Gracias por usar la calculadora!")
  }
}