# Roadmap {footer=false count=false .toc}

* [Einleitung](#einleitung)
* [Forschungsstand](#forschungsstand)
* [Konzeption](#konzeption)
* [Ergebnisse](#ergebnisse)
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

<div style="font-size: 60%!important; position: absolute; top: 10pt">

+------------------------+-------------+-----------+-----------+-----------+----------------------+
|                        | Überwachung | Steuerung | Standards | Lokalität | Integr.-HW |
+========================+=============+===========+===========+===========+======================+
| Ayatollahi et al. 2013 | ●           | ●         | ●         | ◐         | ○                    |
+------------------------+-------------+-----------+-----------+-----------+----------------------+
| Moctezuma et al. 2012  | ●           | ●         | ●         | ●         | ○                    |
+------------------------+-------------+-----------+-----------+-----------+----------------------+
| Durkop et al. 2014     | ●           | ●         | ●         | ●         | ○                    |
+------------------------+-------------+-----------+-----------+-----------+----------------------+
| Lee et al. 2015        | ●           | ○         | ○         | ◐         | ○                    |
+------------------------+-------------+-----------+-----------+-----------+----------------------+

</div> 

# Konzeption {footer=false header=false count=false .center}

# Ergebnisse {footer=false header=false count=false .center}

# Ausblick {footer=false header=false count=false .center}

# Demonstration der VMR {footer=false header=false count=false .center}

<!--
# Erwartungen
## Forschungskontext

* unterbrechungsfreie M2M-Kommunikation und Produktionskette
* Hierarchisierung von Steuerung/Überwachung
* modellgetriebene Komponenten- und Funktionsstrukturabbildung
* dezentrale Informationsarchitektur erhöht
    - Produktionsstabilität
    - Automatisierungsgrad
-->

<!--
# Erwartungen
## Praxis

* minimieren manueller Tätigkeiten  
  <small>z.B. Übertragen eines Programms</small>
* Diagnosen nicht nur vor Ort  
  <small>z.B. zentrale Auswertung der Betriebsdaten</small>
* Beschleunigung des Produktionsablaufs durch höheren Automatisierungsgrad
* Vereinfachung von Prozessplanung und Durchführung
* bessere Kontrolle von Wartungszyklen und Störfällen
-->
<!--
# Anforderungen {footer=false header=false count=false .center}

# Fragestellung 
<br><br>
Welchen softwaretechnologischen Konzepten muss die Modernisierung und der infrastrukturelle Kontext einer Altmaschine unterliegen, um eine ganzheitliche Integration in CPPS gewährleisten zu können?

# Teilfragen

1. Welche System- und **Softwarearchitektur** ist für die Steuerung und Überwachung veralteter CNC-Maschinen im Kontext von CPPS geeignet?

2. Wie und wo werden **Informationen zur Maschine** erfasst, verarbeitet, persistiert und Fremdsystemen zur Verfügung gestellt?

3. Welche **standardisierten Protokolle** und Datenstrukturen eignen sich für M2M-Kommunikation in einem CPPS?

# REQ1 - Überwachung
<br><br>
Die Überwachung von Betriebs- und Prozessdaten der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Zustandserfassung und Störfalldiagnose durch Subsysteme des CPPS erfolgen kann.

# REQ2 - Steuerung
<br><br>
Die Steuerung der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Übertragung, Ausführung und Abbruch von NC-Programmen, beziehungsweise produktionsbedingter Steuerbefehle, durch Subsysteme des CPPS erfolgen kann.

# REQ3 - Standardisierung
<br><br>
Standardisierte Informationsprotokolle und -modelle werden für die Integration heterogener Altmaschinen eingesetzt, so dass Datenaggregation und M2M-Kommunikation gesamtheitlich gewährleistet werden kann.

# REQ4 - Lokalität
<br><br>
Die Erfassung und Persistierung anfallender Betriebs- und Prozessdaten, sowie die Interpretation von Maschinenbefehlen geschieht geografisch nahe der Anlage, wodurch zeitliche Latenzen, Kommunikationsaufwände und -fehler minimiert werden.
-->

<!--
# Forschungsstand {footer=false header=false count=false .center}
-->
# &nbsp;&nbsp;Retrofit Legacy Toaster <small>@Ramakers2016</small> {footer=false header=false count=false}

![](figures/retrofit-toaster)

<div class="notes">
* RetroFab Design Tool 
* Retrofitting physischer Schnittstellen
* Aktuatoren, Sensoren, 3D-Druck
</div>
<!--
# bestehende Arbeiten

* Steuerung & Überwachung  
  <small>Intelligent control software for industrial CNC machines @Ferrolho2005</small>
  <small>Remote real-time CNC machining for web-based manufacturing @Wang2004</small>
* Standards für Protokolle & Modelle  
  <small>Prototype OPC UA Server for Remote Control of Machine Tools @Ayatollahi2013</small>
  <small>A systematic approach to OPC UA information model design @Pauker2016</small>
* flexible Architekturkonzepte  
  <small>Information Architecture for Reconfigurable production systems @Pauker2013</small>
  <small>Referenzarchitekturmodell Industrie 4.0 (RAMI4.0) @Adolphs2015</small>

<div class="notes">
  1. TCP-Protokoll für DNC + automatisierte Maschinenkomponenten
  2. Wise-ShopFloor 
    - offenen Architektur für die Echtzeitüberwachung und -kontrolle
    - grafische Schnittstelle mit 3D Repräsentation 
    - zentrale Datenbank
  3. OPC UA Server als virt. Repräs. 
    - Roboter
    - CNC-Fräse
  4. MDD für generische Informationsmodelle
</div>

# Forschungsprojekte

* OPC4Factory<small>@OPC4Factory</small>  
  <small>generische OPC UA Informationsmodelle</small>
* piCASSO<small>@piCASSO</small>  
  <small>Cloud-basierte Industriesteuerung mit CPS</small>
* RetroNet<small>@FraunhoferIPK2016</small>  
  <small>Integration bestehender Hardware in die intelligente Steuerung einer Fabrik</small>
-->
# Konzeption {footer=false header=false count=false .center}

# Architektur

* OPC UA als Informations- und Kommunikationsmodell
* Metamodell zu Altmaschine mit Komponenten für
    - Numerische Kontrolle
    - Türen, Einspannvorrichtungen, etc.
* Modell synchron mit Realität ⇒ Laufzeitmodell
* Framework mit Schichtenarch. im Client/Server-Stil
* Microkernel: OPC UA Typen, Sensoren und Aktuatoren
* Verhalten der Physik via MAPE-K verifizierbar

<div class="fragment" style="position:absolute;top:50pt;background-color:white;width:100%;height:100%"> 
<div style="width:95%;height:95%;margin:auto">
![](figures/opcua-model-layers) 
</div>
</div>

<div class="notes">
* Communication Technology that merges:
    - Transport mechanism (uses internet standards XML, HTTP,… and also optimized binary TCP)
    - Information modelling (using an extensible meta model)
* Extensible meta model
* Platform independent (cross-platform)
* Scalable
* But not hard real-time (not yet)
</div>

# Repräsentation der Maschine {#surrogate}

* Einplatinencomputer ⇒ CPS-Komponente
* Hardware CNC-Interpreter _festverdrahtet_
* direkte Anbindung von Sensoren und Aktuatoren
* Datenerfassung und Verarbeitung an der Maschine
* Schritte zur Altmaschinenintegration
    1. Modellierung mit OPC UA Informationsmodell 
    2. Deployment des Modells auf CPS-Komponente
    4. Initialisieren des Laufzeitmodells
    3. autonomes Registrieren im CPPS

# Implementation {footer=false header=false count=false .center}

# Bausteine
<br>

|     Konzept     |   Implementation  |
|-----------------|-------------------|
| CPS-Komponente  | Raspberry Pi 3    |
| CNC-Interpreter | Smoothieboard 4XC |
| Peripherie      | GrovePi           |
| OPC UA Stack    | node-opcua        |

<div class="fragment" style="position:absolute;top:30pt;background-color:white;width:100%;height:100%"> 
<div style="width:60%;height:60%;margin:auto">
![](figures/cnc-surrogate) 
</div>
</div>
<!--
# Status & Vorgehen

<center>
<iframe width="1000pt" height="400pt" src="https://live.amcharts.com/mNkMz/embed/" frameborder="0"></iframe>
<small>DSRM nach @Geerts2011</small>
</center>

<div class="notes">
* DSRM-Schritte nach Geerts 2011 @Geerts2011
* schriftlicher Teil inklusive
* Bearbeitung: 1. Juni bis 30. November
* geplante Abgabe: Anfang November
</div>

# {footer=false header=false count=false .center data-background-image=figures/end-cartoon.png data-background-size=contain}

# OPC Unified Architecture {footer=false header=false count=false}

![](figures/opc-ua-architecture)

# Wise-Shopfloor @Wang2004 {footer=false header=false count=false}

<div style="width:75%;height:75%;margin:auto">
![](figures/wise-shopfloor)
</div>

# FFZ am IFT @Ayatollahi2013 {footer=false header=false count=false}

![](figures/ift-manufacturing-cell)

# Laufzeitmodell @Ayatollahi2013 {footer=false header=false count=false}

![](figures/opc4factory-model)

# PIM 2 PSM @Pauker2016 {footer=false header=false count=false}

<div style="width:75%;height:75%;margin:auto">
![](figures/transformation-process-pim-to-psm)
</div>

# Rekonfigurierbare Produktion @Pauker2013 {footer=false header=false count=false}

<div style="width:90%;height:90%;margin:auto">
![](figures/vgl-arch-ffz)
</div>
-->
