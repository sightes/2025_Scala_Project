.PHONY: all clean

# Nombre del proyecto y tipo de proyecto
PROJECT = $(project)
TYPE = $(type)

# Directorios comunes
SRC_DIR = $(PROJECT)/src/main/scala
RESOURCE_DIR = $(PROJECT)/src/main/resources
TEST_DIR = $(PROJECT)/src/test/scala

# Validación de entrada
ifneq ($(TYPE),sbt)
ifneq ($(TYPE),maven)
$(error Debes especificar type=maven o type=sbt al ejecutar el comando make)
endif
endif

all: $(PROJECT)

$(PROJECT):
ifeq ($(TYPE),sbt)
	@echo "Creando estructura para proyecto SBT: $(PROJECT)..."
	mkdir -p $(SRC_DIR)
	mkdir -p $(RESOURCE_DIR)
	mkdir -p $(TEST_DIR)
	mkdir -p $(PROJECT)/src/test/resources
	mkdir -p $(PROJECT)/target
	touch $(PROJECT)/README.md
	echo "" > $(PROJECT)/README.md
	echo "# $(PROJECT)" >> $(PROJECT)/README.md
	@echo "name := \"$(PROJECT)\"" > $(PROJECT)/build.sbt
	@echo "version := \"0.1.0\"" >> $(PROJECT)/build.sbt
	@echo "scalaVersion := \"2.13.12\"" >> $(PROJECT)/build.sbt
	@echo "object Main {" > $(SRC_DIR)/Main.scala
	@echo "  def main(args: Array[String]): Unit = {" >> $(SRC_DIR)/Main.scala
	@echo "    println(\"Hello, $(PROJECT)!\")" >> $(SRC_DIR)/Main.scala
	@echo "  }" >> $(SRC_DIR)/Main.scala
	@echo "}" >> $(SRC_DIR)/Main.scala
	@echo "Estructura de proyecto SBT creada."
endif

ifeq ($(TYPE),maven)
	@echo "Creando estructura para proyecto Maven: $(PROJECT)..."
	mkdir -p $(SRC_DIR)
	mkdir -p $(RESOURCE_DIR)
	mkdir -p $(TEST_DIR)
	mkdir -p $(PROJECT)/src/test/resources
	mkdir -p $(PROJECT)/target
	touch $(PROJECT)/README.md
	echo "" > $(PROJECT)/README.md
	echo "# $(PROJECT)" >> $(PROJECT)/README.md
	@echo "<project xmlns=\"http://maven.apache.org/POM/4.0.0\"" > $(PROJECT)/pom.xml
	@echo "         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"" >> $(PROJECT)/pom.xml
	@echo "         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">" >> $(PROJECT)/pom.xml
	@echo "  <modelVersion>4.0.0</modelVersion>" >> $(PROJECT)/pom.xml
	@echo "  <groupId>com.example</groupId>" >> $(PROJECT)/pom.xml
	@echo "  <artifactId>$(PROJECT)</artifactId>" >> $(PROJECT)/pom.xml
	@echo "  <version>0.1.0</version>" >> $(PROJECT)/pom.xml
	@echo "  <dependencies>" >> $(PROJECT)/pom.xml
	@echo "    <dependency>" >> $(PROJECT)/pom.xml
	@echo "      <groupId>org.scala-lang</groupId>" >> $(PROJECT)/pom.xml
	@echo "      <artifactId>scala-library</artifactId>" >> $(PROJECT)/pom.xml
	@echo "      <version>2.13.12</version>" >> $(PROJECT)/pom.xml
	@echo "    </dependency>" >> $(PROJECT)/pom.xml
	@echo "  </dependencies>" >> $(PROJECT)/pom.xml
	@echo "  <build>" >> $(PROJECT)/pom.xml
	@echo "    <plugins>" >> $(PROJECT)/pom.xml
	@echo "      <plugin>" >> $(PROJECT)/pom.xml
	@echo "        <groupId>org.apache.maven.plugins</groupId>" >> $(PROJECT)/pom.xml
	@echo "        <artifactId>maven-assembly-plugin</artifactId>" >> $(PROJECT)/pom.xml
	@echo "        <version>3.4.2</version>" >> $(PROJECT)/pom.xml
	@echo "        <configuration>" >> $(PROJECT)/pom.xml
	@echo "          <archive>" >> $(PROJECT)/pom.xml
	@echo "            <manifest>" >> $(PROJECT)/pom.xml
	@echo "              <mainClass>Main</mainClass>" >> $(PROJECT)/pom.xml
	@echo "            </manifest>" >> $(PROJECT)/pom.xml
	@echo "          </archive>" >> $(PROJECT)/pom.xml
	@echo "          <descriptorRefs>" >> $(PROJECT)/pom.xml
	@echo "            <descriptorRef>jar-with-dependencies</descriptorRef>" >> $(PROJECT)/pom.xml
	@echo "          </descriptorRefs>" >> $(PROJECT)/pom.xml
	@echo "        </configuration>" >> $(PROJECT)/pom.xml
	@echo "        <executions>" >> $(PROJECT)/pom.xml
	@echo "          <execution>" >> $(PROJECT)/pom.xml
	@echo "            <phase>package</phase>" >> $(PROJECT)/pom.xml
	@echo "            <goals>" >> $(PROJECT)/pom.xml
	@echo "              <goal>single</goal>" >> $(PROJECT)/pom.xml
	@echo "            </goals>" >> $(PROJECT)/pom.xml
	@echo "          </execution>" >> $(PROJECT)/pom.xml
	@echo "        </executions>" >> $(PROJECT)/pom.xml
	@echo "      </plugin>" >> $(PROJECT)/pom.xml
	@echo "    </plugins>" >> $(PROJECT)/pom.xml
	@echo "  </build>" >> $(PROJECT)/pom.xml
	@echo "</project>" >> $(PROJECT)/pom.xml
	@echo "Creando archivo de entrada Main.scala..."
	@echo "object Main {" > $(SRC_DIR)/Main.scala
	@echo "  def main(args: Array[String]): Unit = {" >> $(SRC_DIR)/Main.scala
	@echo "    println(\"Hello, $(PROJECT)!\")" >> $(SRC_DIR)/Main.scala
	@echo "  }" >> $(SRC_DIR)/Main.scala
	@echo "}" >> $(SRC_DIR)/Main.scala
	@echo "Estructura de proyecto Maven creada."
endif

clean:
	rm -rf $(PROJECT)
	@echo "Directorio $(PROJECT) eliminado."