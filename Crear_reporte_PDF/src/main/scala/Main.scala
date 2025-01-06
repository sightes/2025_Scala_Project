import org.apache.pdfbox.pdmodel._
import org.apache.pdfbox.pdmodel.font.PDType1Font
//aqui armo el objeto pdf
//la idea es imitar lo que mas o menos hace fpdf en python
object PDFReportWithPDFBox {
  def main(args: Array[String]): Unit = {
    val document = new PDDocument()
    val page = new PDPage()
    document.addPage(page)

    val contentStream = new PDPageContentStream(document, page)
    contentStream.beginText()
    contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12)
    contentStream.newLineAtOffset(100, 700)
    contentStream.showText("Reporte Automatizado con Scala y PDFBox")
    contentStream.endText()

    contentStream.close()

    val outputFile = "reporte_pdfbox.pdf"
    document.save(outputFile)
    document.close()

    println(s"PDF generado: $outputFile")
  }
}