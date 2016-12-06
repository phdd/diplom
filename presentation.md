# Roadmap {footer=false count=false .toc}

* [Einleitung](#einleitung)
* [Forschungsstand](#forschungsstand)
* [Konzeption](#konzeption)
* [Implementation](#implementation)
* [Evaluation](#evaluation)
* [Ausblick](#ausblick)

<div class="notes">
* Design Science Research Methodology
* Einleitung: Grundlagen, Motivation, Forschungsfragen
</div>

# Einleitung {footer=false header=false count=false .center}

<div class="notes">
* **Kontext: produzierende Industrie**
* Industrielle Revolutionen

1. ca. 1750 erste dampfbetr. Arbeitsmaschinen
2. Ende 19. Jhd. erste Massenproduktion
3. 1969 erste SPS (beginn IT-gestützter Produktion)
4. Schlagwort I4.0 seit 2011
    * Kombination mit IoT/CPS
</div>

# Fertigung und Automatisierung

<small style="position: absolute; top: 120pt;">aus @Linke2015, von Wikipedia-Nutzer UlrichAAB</small>

<div style="position: absolute; width: 80%; top: 130pt; z-index: 0; margin-left: 60pt;">
![](figures/fertigungsautomatisierung)
</div>

<!--div class="fragment" style="position:absolute;top:105pt;width:100%;height:100%;">
  ![](figures/automatisierungspyramide)
</div-->

<div class="notes">
* Autom.: DIN 19233, ist "das Ausrüsten einer Einrichtung, so dass sie ganz oder teilweise ohne Mitwirkung des Menschen bestimmungsgemäß arbeitet"
</div>

# Cyber-physische Systeme

<small style="position: absolute; top: 120pt;">aus Vortrag _Life with Cyber-Physical Systems_ von Prof. Dr. Uwe Aßmann, @VereinDeutscherIngenieuree.V.2013</small>

<div style="position: absolute; width: 80%; margin-left: 60pt;">
![](figures/cps)
</div>

<div class="fragment" style="position:absolute;top:130pt;width:100%;height:100%;">
  ![](figures/pyramide-cps)
</div>

<div class="notes">
* Level 4: marktrelev. Unternehmensführung, Personal-, Produktionsplanung
* Level 3: Auftragsbearbeitung und Produktionsplanung, Terminüberwachung und Kostenanalyse
* Level 2: je nach Größe weiter unterteilt (Verb. FFZ) 
* Level 1: Aktuatoren/Sensoren zur Datenerfassung/Steuerung
* Level 0: physikalischer Prozess

* CPS nach Lee 2008: 
    - Sensoren/Aktuatoren überwachen/beeinflussen physische Abläufe
    - Rückkopplung durch Kontrollschleifen
* CPPS nach Bergweiler 2015:
    - Produkte, Maschinen, Ressourcen durch CPS repräsentiert
    - Informationen und Dienste über Netzwerk der Produktionsstrecke geteilt
</div>

# OPC Unified Architecture

<small style="position: absolute; top: 120pt;">nach @OPCFoundation2014</small>

![](figures/opc-ua-architecture)

<div class="notes">
* OPC = Industriekonsortium
* semantischer Standard für Kommunikation- &amp; Datenmodellierung
* Erweiterung von "klassischem" OPC (Open Platform Communications, OLE for Process Control)
    * sicherer, zuverlässiger Informationsaustausch
    * Plattform- und Herstellerunabhängigkeit
    * standardisierte Kommunikation über Internet und Firewalls
    * Vereinfachung durch Vereinheitlichung
</div>

# Motivation

<small style="position: absolute; top: 130pt;">nach @Hammerstingl2015</small>

<div style="position: relative; top: -70pt;"> 
  ![](figures/automationsstruktur)
</div>

<div class="fragment" style="position:absolute;top:65pt;width:100%;height:100%;">
  ![](figures/automationsstruktur-retrofit)
</div>

<div class="notes">
  * heterogene Automationsstrukturen
  * _Industrie 4.0_: CPS in die Produktion ⇒ CPPS
  * viele CNC/SPS ohne Infrastrukturanbindung
      - fehlende Netzwerk- und Programmierschnittstellen
      - geschlossene Architekturen
      - ungenügende Sicherheitskonzepte

  * **Retrofitting**
      - Erweiterung des Equipments einer Anlage durch zusätzliche Hardware
      - funktionaler Umfang durch neue Module für Übertragung/verteilte
Verarbeitung der Daten ausgebaut
  * aufkommende Fragen
</div>

# Forschungsfragen
<br><br>
Welchen softwaretechnologischen Konzepten muss die Modernisierung und der infrastrukturelle Kontext einer Altmaschine unterliegen, um eine ganzheitliche Integration in CPPS gewährleisten zu können?

<div class="fragment" style="position:absolute;top:130pt;width:100%;height:100%;background-color: white">
1. Welche System- und **Softwarearchitektur** ist für die Steuerung und Überwachung veralteter Maschinen im Kontext von CPPS geeignet?

2. Wie und wo werden **Informationen zur Maschine** erfasst, verarbeitet, persistiert und Fremdsystemen zur Verfügung gestellt?

3. Welche **standardisierten Protokolle** und Datenstrukturen eignen sich für Kommunikation in einem CPPS?
</div>

<div class="notes">
**Aufgaben** 

* Recherchen zum Forschungsstand
* Konzeption von
    - virtueller Maschinenrepräsentation
    - erweiterbarem Framework
* Steuerung/Überwachung in CPPS
    - Transfer/Ausführung von Maschinencode
    - Betriebs-/Prozessdaten durch Sensoren erfassen
    - Einplatinencomputern für Integrationshardware
* prototypische Implementierung (Machbarkeit)
* Aufbau Test-Infrastruktur
* **zuerst**: Anforderungen für die Integration
</div>

# Forschungsstand {footer=false header=false count=false .center}

<div class="notes">
* beantwortet der aktuelle Stand der Technik die Fragen?
* welche Anforderungen sind dabei relevant?

**Anforderungen** 

* Betriebs-/Prozessdatenerfassung &amp; Steuerung ortsunsabh.
* Subsysteme des CPPS übernehmen Zustandserfassung, Störfalldiagnose, Programmdelegation
* Heterogenität: standardisierte Informationsprotokolle und -modelle 
    - einheitliche M2M-Kommunikation (horizontal)
    - übergeordnete Systeme (ERP, MES) (vertikal)
* erfassen/persistieren von Daten nahe der Maschine
    - minimieren v. Latenzen, Kommunikationsaufwand
    - kapseln v. Ausnahmesituationen (Komplexität d. Gesamtsystems = Divide &amp; Conquer)
* Ökonomie der Modernisierung: Einplatinencomputer als Integrationshardware
</div>

#  {.center}

<br>
<div style="font-size: 60%!important; position: absolute; top: 30pt">

+------------------------+-------------+-----------+-----------+-----------+---------------+
|                        | Überwachung | Steuerung | Standards | Lokalität | Integrations- |
|                        |             |           |           |           |    Hardware   |
+========================+=============+===========+===========+===========+===============+
| Moctezuma et al. 2012  | `●`         | `●`       | `●`       | `●`       | `○`           |
| @Moctezuma2012         |             |           |           |           |               |
+------------------------+-------------+-----------+-----------+-----------+---------------+
| Dürkop et al. 2014     | `●`         | `●`       | `●`       | `●`       | `○`           |
| @Durkop2014            |             |           |           |           |               |
+------------------------+-------------+-----------+-----------+-----------+---------------+
| Ayatollahi et al. 2013 | `●`         | `●`       | `●`       | `◐`       | `○`           |
| @Ayatollahi2013        |             |           |           |           |               |
+------------------------+-------------+-----------+-----------+-----------+---------------+
| Lee et al. 2015        | `●`         | `○`       | `○`       | `◐`       | `○`           |
| @Lee2015               |             |           |           |           |               |
+------------------------+-------------+-----------+-----------+-----------+---------------+

</div> 

<div class="notes">
**Arbeiten (Auszug)**

  * Moctezuma: Retrofitting mit smart Remote Terminal Unit (SOA)
  * Dürkop: Autom.-Module mit WS, Kapselung der RT
  * Ayatollahi: OPC UA für CNC + Model, **R4:**
      - Erfassen Maschinendaten
  * Lee: übergeordnete 5C CPS-Arch. + Richtlinien, **R4**:
      - Zustandserf./Leistungsvorhersage an Maschine; Historie zentral (Cyber-Ebene)
</div>

# Konzeption {footer=false header=false count=false .center}

<div class="notes">
* Auf Basis von Szenarien + Anwendungsfällen
* VMR als standardisierendes Element
</div>

# Systemkontext

<div style="position: absolute; top: 105pt; ">
![](figures/systemkontext)
</div>

<div class="notes">
* gestrichelt: ereignisbasierte WS
</div>

# VMR

<div style="position: absolute; top: 10pt; left: 140pt; height: 62%; width: 62%">
![](figures/vmr-concept)
</div>

# Maschinendefinition

<div style="position: absolute; top: 190pt; left: -20pt; height: 70%; width: 70%">
![](figures/opcua-cpps)
</div>

<div style="position: absolute; top: 200pt; right: -90pt; height: 60%; width: 60%">
![](figures/opc4factory-runtime)
</div>

<div class="notes">
* Lokales Kontextmodell
* Laufzeit-Adaptionsmodell
</div>

# Framework

<div style="position: absolute; top: 120pt; left: 100pt; height: 80%; width: 80%">
![](figures/framework)
</div>

<div class="notes">
* MAPE-K!! @IBM2006
</div>

# Verteilung

<div style="position: absolute; top: 170pt; left: 80pt; height: 80%; width: 80%">
![](figures/verteilung)
</div>

# Implementation {footer=false header=false count=false .center}

# Komponenten

<div style="font-size: 65%!important; position: relative;">

+----------------------------+-------------------------+
| Einplatinencomputer (SBC)  | Raspberry Pi 3 Model B  |
+----------------------------+-------------------------+
| Antriebssteuerung (Serial) | Smoothieboard 4XC       |
+----------------------------+-------------------------+
| cyber-physischer Adapter   | GrovePi                 |
+----------------------------+-------------------------+
| Temperatursensor           | Grove - Temperatur- und |
|                            | Luftfeuchtigkeitssensor |
+----------------------------+-------------------------+
| Verriegelungsrelais        | Grove - Relay           |
+----------------------------+-------------------------+

</div>

# 

<div style="position: relative; top: -170pt; left: -120pt; height: 130%; width: 130%">
![](figures/software)
</div>

# Demonstration

<div style="position: absolute; top: 170pt; left: 80pt; height: 80%; width: 80%">
![](figures/cpps-eca-demo)
</div>

# Evaluation {footer=false header=false count=false .center}

# Vergleich zum Forschungsstand

<div style="font-size: 70%">
* Moctezuma et al. 2012 @Moctezuma2012
    - Dreischichtarchitektur für lokale Datenverarbeitung
    - Standardisierte Kommunikation durch OPC UA
* Dürkop et al. 2014 @Durkop2014
    - Web-Services zur vertikalen Integration
    - Kommunikation zwischen Modulen erlaubt
* Ayatollahi et al. 2012 @Ayatollahi2013
    - Erweiterung des OPC UA Modells für CPPS
    - Regeln für Autonomie im Informationsmodell
* Lee et al. 2015 @Lee2015
    - VMR in 5C-Schichten für CPPS integriert
    - lokales Adaptivitätskonzept konkretisiert
* Einplatinencomputer als Integrationshardware
</div>

<div class="notes">
* Komm. zw. Dürkop Modulen:
    - Hierarchisierung des Info.-Austauschs
    - WS-Entlastung
* lokales Adaptivitätskonzept nach Lee:
    - Conversion + Smart-Connection Ebene implementiert
</div>

# Ergebnisse

<div style="font-size: 80%">
* Retrofitting bedarf geschichteter System-/Softwarearchitektur
* Maschinenrepräsentant
    - wandelt Daten in Informationen
    - abstrahiert Steuerung
* Rückkopplung für teilautonome Handlung und Adaption 
* horizontale Kommunikation durch Standardisierung mit OPC UA
* Service-orientierte Architektur für vertikale Integration mit DPWS
* Datenverarbeitung/-persistenz nahe der Maschine für Hierarchisierung
* cyber-physische Hardwareadapter bilden Schnittstelle
</div>

<div class="notes">
* Limitationen: Rückkopplung
    - imperativ, nicht deskriptiv
    - keine logischen Verknüpfungen
    - zeitliche Beschränkungen fehlen
    - Regelkonflikte
* Konzept für Dürkop-Module?
* konkrete Verortung von Sensoren/Aktuatoren?
* übergeordnete Produktionssteuerung?
* quantitative Evaluation/Fallstudie?
</div>

# Implikationen

<div style="font-size: 80%">
* nahtlose Integration von Altanlagen
    - horizontal: OPC Unified Architecture
    - vertikal: Web-Services mit DPWS
* Steuerung/Überwachung ortsunabhängig &amp; durch Subsysteme mgl.
* Minderung manueller Tätigkeiten ⇒ Beschleunigung der Produktion
* zentrale Auswertung von Betriebs- &amp; Prozessinformationen
* Hierarchisierung von Datenverarbeitung und Persistenz
* Verbesserung von Skalierbarkeit &amp; Rekonfiguration
* einheitliche Modellierung von Anlagenstruktur &amp; Rückkopplung 
* kostengünstige Modernisierung durch Einplatinencomputer
</div>

<div class="notes">
* Skalierbarkeit/Rekonfiguration durch dezentrale Kommunikations- und Informationsarchitektur
</div>

# Ausblick 

<div style="font-size: 80%">
* komplexe Regeln zur Rückkopplung 
* externe Rückkopplung auf Cyber-Ebene der 5C-Architektur @Lee2015
* cyber-phys. Workflows &amp; PROtEUS für Produktionssteuerung @Seiger2016
* OPC UA &amp; DPWS mit gemeinsamen Modell @Bony2011
* MDSD und UML für gemeinsame Modelle @Pauker2016
* Modernisierung von Werkzeugmaschinen mit STEP-NC [@Suh2003;@Xu2006]
* OPC UA und Echtzeit mit Time Sensitive Networking
* Nutzungsschnittstellen und Interaktion @Wang2004
</div>

# <span style="color: #BBB; font-size: 60%">That's it.</span><br><span style="color: white">Questions?</span> {footer=false header=false count=false .center data-background-image=figures/stu.png data-background-size=cover data-background-position="right bottom"}

<div style="position: relative; bottom: -150pt; font-size: 60%; color: #888">
<p><i class="fa fa-envelope fa-1x"></i>&nbsp;&nbsp;peter.heisig@tu-dresden.de</p>
<p><i class="fa fa-github-alt fa-1x"></i>&nbsp;&nbsp;github.com/phdd/diplom</p>
</div>

<div class="notes">
* Zusammenfassung
* Danksagung
</div>

# OPC UA Transportvarianten {footer=false count=false}

<div style="position: absolute; top: 130pt; left: 80pt; height: 75%; width: 75%">
![](figures/opcua-transport)
</div>

# MAPE-K Kontrollschleife {footer=false count=false}

<div style="position: absolute; top: 110pt; left: 60pt; height: 85%; width: 85%">
![](figures/mapek)
</div>

# Maschinenüberwachung {footer=false count=false}

<div style="position: absolute; top: 160pt; left: 0pt; height: 100%; width: 100%">
![](figures/monitoring-kategorien)
</div>

# FFZ des IFT Wien {footer=false count=false}

<div style="position: absolute; top: 150pt; left: 0pt; height: 100%; width: 100%">
![](figures/ffz-ift)
</div>

# Remote Terminal Unit {footer=false count=false}

<div style="position: absolute; top: 150pt; left: 0pt; height: 100%; width: 100%">
![](figures/rtu-retrofitting)
</div>

# Automatisierungsmodule {footer=false count=false}

<div style="position: absolute; top: 150pt; left: 0pt; height: 100%; width: 100%">
![](figures/module-field-level)
</div>

# Modellerweiterung zur Steuerung {footer=false count=false}

<div style="position: absolute; top: 150pt; left: 0pt; height: 100%; width: 100%">
![](figures/opc4factory)
</div>

# CPPS Modellerweiterung {footer=false count=false}

<div style="position: absolute; top: 170pt; left: 0pt; height: 100%; width: 100%">
![](figures/opcua-cpps)
</div>

# Horizontale Integration {footer=false count=false}

<div style="position: absolute; top: 200pt; left: 0pt; height: 100%; width: 100%">
![](figures/horizontale-integration)
</div>

# Vertikale Integration {footer=false count=false}

<div style="position: absolute; top: 130pt; left: 50pt; height: 85%; width: 85%">
![](figures/vertikale-integration)
</div>

# Initialisierung des Frameworks {footer=false count=false}

<div style="position: absolute; top: 130pt; left: 50pt; height: 80%; width: 80%">
![](figures/framework-init)
</div>

# Methodendelegation {footer=false count=false}

<div style="position: absolute; top: 150pt; left: 0pt; height: 100%; width: 100%">
![](figures/methodendelegation)
</div>

# Kontextveränderung {footer=false count=false}

<div style="position: absolute; top: 150pt; left: 0pt; height: 100%; width: 100%">
![](figures/context-update)
</div>

# Rückkopplung {footer=false count=false}

<div style="position: absolute; top: 130pt; left: 50pt; height: 80%; width: 80%">
![](figures/feedback)
</div>

# Organisation des Frameworks {footer=false count=false}

<div style="position: absolute; top: 130pt; left: 0pt; height: 100%; width: 100%">
![](figures/organisation)
</div>
