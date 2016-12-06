# Roadmap {footer=false count=false .toc}

* [Einleitung](#einleitung)
* [Forschungsstand](#forschungsstand)
* [Konzeption](#konzeption)
* [Implementation](#implementation)
* [Evaluation](#evaluation)
* [Ausblick](#ausblick)

<div class="notes">
  * Einleitung: Grundlagen, Motivation, Fragen, Anforderungen
  * 
</div>

# Einleitung {footer=false header=false count=false .center}

<div class="notes">
**Kontext: produzierende Industrie**

1. ca. 1750 erste dampfbetr. Arbeitsmaschinen
2. Ende 19. Jhd. erste Massenproduktion
    * NC seit 1950
3. 1969 erste SPS (beginn IT-gestützter Produktion)
4. Schlagwort I4.0 seit 2011
    * Kombination mit IoT/CPS
</div>

# Fertigung und Automatisierung

<small style="position: absolute; top: 120pt;">aus @Linke2015, von Wikipedia-Nutzer UlrichAAB</small>

<div style="position: absolute; width: 80%; top: 130pt; z-index: 0; margin-left: 60pt;">
![](figures/fertigungsautomatisierung)
</div>

<div class="fragment" style="position:absolute;top:105pt;width:100%;height:100%;">
  ![](figures/automatisierungspyramide)
</div>

<div class="notes">
* **SCADA**: Supervisory Control and Data Acquisition  
  überwachen/steuern techn. Prozesse mit Computersystem
* Level 4: marktrelev. Unternehmensführung, Personal-, Produktionsplanung
* Level 3: Auftragsbearbeitung und Produktionsplanung, Terminüberwachung und Kostenanalyse
* Level 2: je nach Größe weiter unterteilt (Verb. FFZ) 
* Level 1: Aktuatoren/Sensoren zur Datenerfassung/Steuerung
* Level 0: physikalischer Prozess
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
* CPS nach Lee 2008: 
    - Integration von Informationsverarbeitung und physischen Prozessen
    - physische Abläufe durch Sensoren und Aktuatoren überwacht/beeinflusst
    - Rückkopplung durch Kontrollschleifen
* CPPS nach Bergweiler 2015:
    - Produkte, Maschinen, Ressourcen durch CPS repräsentiert
    - Informationen und Dienste über Netzwerk der Produktionsstrecke geteilt
    - Maschinenparameter, Produktionsprozesse, Produkte
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
    * serviceorientierte Architektur (SOA)
    * Schutz vor unerlaubtem Zugriff
    * Erreichbarkeit und Zuverlässigkeit
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
1. Welche System- und **Softwarearchitektur** ist für die Steuerung und Überwachung veralteter CNC-Maschinen im Kontext von CPPS geeignet?

2. Wie und wo werden **Informationen zur Maschine** erfasst, verarbeitet, persistiert und Fremdsystemen zur Verfügung gestellt?

3. Welche **standardisierten Protokolle** und Datenstrukturen eignen sich für M2M-Kommunikation in einem CPPS?
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
<div style="font-size: 66%!important; position: absolute; top: 10pt">

+------------------------+-------------+-----------+-----------+-----------+---------------+
|                        | Überwachung | Steuerung | Standards | Lokalität | Integrations- |
|                        |             |           |           |           |    Hardware   |
+========================+=============+===========+===========+===========+===============+
| Moctezuma et al. 2012  | `●`         | `●`       | `●`       | `●`       | `○`           |
+------------------------+-------------+-----------+-----------+-----------+---------------+
| Dürkop et al. 2014     | `●`         | `●`       | `●`       | `●`       | `○`           |
+------------------------+-------------+-----------+-----------+-----------+---------------+
| Ayatollahi et al. 2013 | `●`         | `●`       | `●`       | `◐`       | `○`           |
+------------------------+-------------+-----------+-----------+-----------+---------------+
| Lee et al. 2015        | `●`         | `○`       | `○`       | `◐`       | `○`           |
+------------------------+-------------+-----------+-----------+-----------+---------------+

</div> 
<div class="notes">
**Arbeiten (Auszug)**

  * Moctezuma: Retrofitting mit smart Remote Terminal Unit
  * Dürkop: Autom.-Module mit WS, Kapselung der RT
  * Ayatollahi: OPC UA für CNC + Model, **R4:**
      - Erfassen Maschinendaten
  * Lee: übergeordnete 5C CPS-Arch. + Richtlinien, **R4**:
      - Zustandserf./Leistungsvorhersage an Maschine; Historie zentral (Cyber-Ebene)
</div>

# Konzeption {footer=false header=false count=false .center}

<div class="notes">
* VMR als standardisierendes Element
* Auf Basis von Szenarien + Anwendungsfällen
* Erweiterung des Modells von Ayatollahi et al. 
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

# Framework

<div style="position: absolute; top: 120pt; left: 100pt; height: 80%; width: 80%">
![](figures/framework)
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

# {.center data-background-image=figures/software.png data-background-size=contain}

# Demonstration

<div style="position: absolute; top: 170pt; left: 80pt; height: 80%; width: 80%">
![](figures/cpps-eca-demo)
</div>

# Evaluation {footer=false header=false count=false .center}

# Implikationen

# Vergleich zum Forschungsstand

# Ergebnisse

# Ausblick {footer=false header=false count=false .center}

<div class="notes">
* Zusammenfassung
* Danksagung
</div>

# <span style="color: #BBB; font-size: 60%">That's it.</span><br><span style="color: white">Questions?</span> {footer=false header=false count=false .center data-background-image=figures/stu.png data-background-size=cover data-background-position="right bottom"}
