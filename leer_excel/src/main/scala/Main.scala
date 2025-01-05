import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.io.{FileInputStream, FileOutputStream}

object SimpleExcelCopy {
  def main(args: Array[String]): Unit = {
    // Ruta del archivo de entrada y salida
    val inputFile = "archivo.xlsx"
    val outputFile = "salida.xlsx"

    // Leer el archivo Excel de entrada
    val fis = new FileInputStream(inputFile)
    val workbook = new XSSFWorkbook(fis)

    // Obtener la primera hoja (Hoja 1)
    val sheet = workbook.getSheetAt(0)

    // Crear un nuevo archivo Excel
    val outputWorkbook = new XSSFWorkbook()
    val outputSheet = outputWorkbook.createSheet("Hoja1")

    // Copiar filas y celdas
    val rowIterator = sheet.iterator()
    while (rowIterator.hasNext) {
      val row = rowIterator.next()
      val newRow = outputSheet.createRow(row.getRowNum)

      val cellIterator = row.cellIterator()
      while (cellIterator.hasNext) {
        val cell = cellIterator.next()
        val newCell = newRow.createCell(cell.getColumnIndex)

        // Copiar valor de la celda
        cell.getCellType match {
          case org.apache.poi.ss.usermodel.CellType.STRING  => newCell.setCellValue(cell.getStringCellValue)
          case org.apache.poi.ss.usermodel.CellType.NUMERIC => newCell.setCellValue(cell.getNumericCellValue)
          case org.apache.poi.ss.usermodel.CellType.BOOLEAN => newCell.setCellValue(cell.getBooleanCellValue)
          case _ => // Otros tipos no manejados
        }
      }
    }

    // Guardar el nuevo archivo Excel
    val fos = new FileOutputStream(outputFile)
    outputWorkbook.write(fos)
    fos.close()

    println(s"Archivo Excel copiado y guardado en: $outputFile")
  }
}