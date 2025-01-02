.PHONY: all clean

# Nombre del proyecto
PROJECT = $(project)

# Ruta del directorio del proyecto
SRC_DIR = $(PROJECT)/src/main/scala

all: $(PROJECT)

$(PROJECT):
	@echo "Creando estructura de directorios para $(PROJECT)..."
	mkdir -p $(SRC_DIR)
	mkdir -p $(PROJECT)/src/main/resources
	mkdir -p $(PROJECT)/src/test/scala
	touch $(SRC_DIR)/Main.scala
	touch $(PROJECT)/build.sbt
	touch $(PROJECT)/README.md
	@echo "name := \"$(PROJECT)\"" > $(PROJECT)/build.sbt
	@echo "version := \"0.1.0\"" >> $(PROJECT)/build.sbt
	@echo "scalaVersion := \"2.13.12\"" >> $(PROJECT)/build.sbt
	@echo "" > $(PROJECT)/README.md
	@echo "# $(PROJECT)" >> $(PROJECT)/README.md
	@echo "object Main {" > $(SRC_DIR)/Main.scala
	@echo "  def main(args: Array[String]): Unit = {" >> $(SRC_DIR)/Main.scala
	@echo "    println(\"Hello, $(PROJECT)!\")" >> $(SRC_DIR)/Main.scala
	@echo "  }" >> $(SRC_DIR)/Main.scala
	@echo "}" >> $(SRC_DIR)/Main.scala
	@echo "Estructura de directorios y archivos para $(PROJECT) creada."

clean:
	rm -rf $(PROJECT)
	@echo "Directorio $(PROJECT) eliminado."