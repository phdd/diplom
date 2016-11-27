
# Prototypische Umsetzung

Der Quellcode des Frameworks befindet sich auf der beiliegenden CD und ist außerdem im Internet unter [github.com/phdd/diplom/tree/surrogate](https://github.com/phdd/diplom/tree/surrogate) erreichbar.
In den folgenden Abschnitten wird neben der Installation auf einem Raspberry Pi die Aufnahme des operativen Betriebs und die Methode der Weiterentwicklung erläutert.

## Installation

Um das Framework der virtuellen Maschinenrepräsentation (VMR) starten zu können wird das Einrichten einiger Softwarepakete vorausgesetzt.
Die Elementare Installation eines Debian-basierten Betriebssystems und die der Node.js Laufzeitumgebung wird unter [thisdavej.com/beginners-guide-to-installing-node-js-on-a-raspberry-pi](http://thisdavej.com/beginners-guide-to-installing-node-js-on-a-raspberry-pi/) detailliert beschrieben.
Ist ein Betriebssystem bereits vorhanden findet sich unter [joshondesign.com/2013/10/23/noderpi](http://joshondesign.com/2013/10/23/noderpi) eine kürzere Erläuterung.  
Neben der Laufzeitumgebung wird das Softwarepaket für das GrovePi Erweiterungsboard benötigt.
Dafür wird das Git-Repository ([github.com/DexterInd/GrovePi](https://github.com/DexterInd/GrovePi)) auf dem Raspberry geklont und die Software installiert.

- git clone https://github.com/DexterInd/GrovePi.git
- bash GrovePi/Script/install.sh

Die Übersetzung des Frameworks wird durch Grunt, ein JavaScript basiertes Build-System bewerkstelligt.
Für den folgenden Schritt werden mit Superuser-Rechten einige lokale Pakete mit dem Node Package Manager (NPM) installiert. 

- sudo npm install -g grunt grunt-cli
- sudo npm install -g coffee-script

Danach muss das Repository geklont, in dessen Ordner und auf den VMR-Branch gewechselt werden.

- git clone https://github.com/phdd/diplom.git vmr
- cd vmr
- git checkout vmr

Schlussendlich werden die JavaScript-Abhängigkeiten installiert, die CoffeeScript-Quellen übersetzt und ein Ordner mit den für das Framework notwendigen Dateien erstellt.

- npm install

## Operativer Betrieb

Um die VMR zu starten wird der Installationsschritt vorausgesetzt.
Das beispielhafte Maschinenmodell aus dem Implementationskapitel ist in der XML-Datei "objects.xml" definiert.
Zum Start muss folgender Befehl ausgeführt werden:

- node dist/vmr.js --machineDefinition=objects.xml

Danach ist ein OPC UA Server unter der Raspberry-IP mit dem Port 26543 erreichbar.
Welche Sensoren und Aktuatoren an welchem Anschluss des GrovePi-Erweiterungsboards anzuschließen sind, ist in im Maschinenmodell nachzulesen (ConnectionIdentifier) und gegebenenfalls zu korrigieren.
Für Details zu Fehlern oder dem Binden von Equipment-Implementationen muss dem Befehl zum Starten der VMR eine Umgebungsvariable vorangestellt werden:

- DEBUG=vmr* node dist/vmr.js --machineDefinition=objects.xml

## Weiterentwicklung

##### Maschinendefinition.

Soll das Maschinenmodell angepasst werden, wird eine OPC UA Modellierungssoftware wie der kostenfreie UaModeler von Unified Automation verwendet.
Bezogen werden kann die Software unter folgender Adresse:

[unified-automation.com/de/downloads/opc-ua-development.html](https://www.unified-automation.com/de/downloads/opc-ua-development.html)

In diesem wird nun ein neues Projekt angelegt.
Im Dialog "Generate Code" wird der "modelling"-Ordner ausgewählt, wodurch kein Quellcode generiert, die relevanten XML-Dateien aber erstellt werden.
Bei "Choose Base Models" wird "find another model" ausgewählt um die Erweiterungen des Informationsmodells zu integrieren.
Der heruntergeladene Quellcode der VMR vorausgesetzt, müssen nun die XML-Dateien für die Namespaces "OPC4Fatory" und "CPPS" in "res/nodesets" und "objects.xml" im Wurzelverzeichnis der VMR ausgewählt werden.
Sind diese Dateien nicht sichtbar, sollte der Eintrag "Information Model" (im Dateiwahl-Dialog unten rechts) durch den zweiten ausgetauscht werden.
Für die konkrete Bearbeitung des Informationsmodells bitte ich den Leser die Anleitung zu konsultieren:

[documentation.unified-automation.com/uamodeler/1.5.0/html/modeling.html](http://documentation.unified-automation.com/uamodeler/1.5.0/html/modeling.html)

Nach der Bearbeitung der Objekte des Namespace "urn:objects" kann über das Kontextmenü des Modelleintrags "objects.ua" die XML-Datei exportiert werden.
Im unteren Teil des Programms befindet sich ein Fenster "Output", dass den Pfad zur Datei ausgibt.
Diese muss schlussendlich in das Wurzelverzeichnis der VMR auf dem Raspberry kopiert werden.
Das Framework kann dann durch den Befehl aus dem vorangegangenen Abschnitt mit der aktualisierten Maschinendefinition geladen werden.

##### Erweiterungspunkte.

TODO
