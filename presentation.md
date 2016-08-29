# Roadmap {footer=false count=false .toc}

- [Einleitung](#einleitung)
- [Anforderungen](#anforderungen)
- [Forschungsstand](#forschungsstand)
- [Konzeption](#konzeption)
- [Implementation](#implementation)
- [Status & Vorgehen](#status-vorgehen)

# Einleitung {footer=false header=false count=false .center}

# Motivation

* _Industrie 4.0_ drängt CPS in die Produktion ⇒ CPPS
* Maschinen ohne Infrastrukturanbindung vorhanden
    - fehlende Netzwerk- und Programmierschnittstellen
    - geschlossene Architekturen
    - ungenügende Sicherheitskonzepte
</br>
</br>
</br>
⇒ _Retrofitting_

# Aufgaben 

* ermitteln der Anforderungen für die Integration
* Recherchen zu bestehenden Arbeiten
* Konzeption von
    - virtueller Maschinenrepräsentation
    - erweiterbarem Framework

<div class="fragment" style="position:absolute;top:134.5pt;background-color:white;width:100%;height:100%">
* ermöglichen von Steuerung/Überwachung in CPPS
    - Transfer und Ausführung von Maschinencode
    - Erfassen von Produktionsdaten durch Sensoren
    - Verwendung von Einplatinencomputern für die Implementierung  
&nbsp;
* prototypische Implementierung belegt Machbarkeit
* Aufbau einer adäquaten Test-Infrastruktur
</div>

# Erwartungen
## Forschungskontext

* unterbrechungsfreie M2M-Kommunikation und Produktionskette
* Hierarchisierung von Steuerung/Überwachung
* modellgetriebene Komponenten- und Funktionsstrukturabbildung
* dezentrale Informationsarchitektur verbessert
    - Produktionsstabilität
    - Automatisierungsgrad

# Erwartungen
## Praxis

* minimieren manueller Tätigkeiten  
  <small>z.B. Übertragen eines Programms</small>
* Diagnosen nicht nur vor Ort  
  <small>z.B. zentrale Auswertung der Betriebsdaten</small>
* Beschleunigung des Produktionsablaufs durch höheren Automatisierungsgrad
* Vereinfachung von Prozessplanung und Durchführung
* bessere Kontrolle von Wartungszyklen und Störfällen

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

# Forschungsstand {footer=false header=false count=false .center}

# &nbsp;&nbsp;Retrofit Legacy Toaster <small>@Ramakers2016</small> {footer=false header=false count=false}

![](figures/retrofit-toaster)

# bestehende Arbeiten

* Steuerung & Überwachung  
  <small>Control software for industrial CNC machines [@Ferrolho2005;@Ferrolho2007]</small>
  <small>Remote real-time CNC machining for web-based manufacturing @Wang2004</small>
* Standards für Protokolle & Modelle  
  <small>Prototype OPC UA Server for Remote Control of Machine Tools @Ayatollahi2013</small>
  <small>A systematic approach to OPC UA information model design @Pauker2016</small>
* flexible Architekturkonzepte  
  <small>Information Architecture for Reconfigurable production systems @Pauker2013</small>
  <small>Referenzarchitekturmodell Industrie 4.0 (RAMI4.0) @Adolphs2015</small>

<div class="notes">
  * [3,4] TCP-Protokoll für Direct Numerical Control + automatisierte Maschinenkomponenten
  * [2] Wise-ShopFloor 
    - offenen Architektur für die Echtzeitüberwachung und -kontrolle
    - grafische Schnittstelle mit 3D Repräsentation 
</div>

# Forschungsprojekte

* OPC4Factory<small>@OPC4Factory</small>  
  <small>generische OPC UA Informationsmodelle</small>
* piCASSO<small>@piCASSO</small>  
  <small>Cloud-basierte Industriesteuerung mit CPS</small>
* RetroNet<small>@FraunhoferIPK2016</small>  
  <small>Integration bestehender Hardware in die intelligente Steuerung einer Fabrik</small>

# Konzeption {footer=false header=false count=false .center}

# Architektur

* OPC UA als Informations- und Kommunikationsmodell
* Metamodell zu Altmaschine mit Komponenten für
    - Numerische Kontrolle
    - Türen und Einspannvorrichtungen
* Modell synchron mit Realität ⇒ Laufzeitmodell
* Framework mit Schichtenarch. im Client/Server-Stil
* Microkernel: OPC UA Typen, Sensoren und Aktuatoren
* Verhalten der Physik via MAPE-K verifizieren

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

# Danke für die Aufmerksamkeit {footer=false header=false count=false .center}

# OPC Unified Architecture {footer=false header=false count=false}

![](figures/opc-ua-architecture)

# Laufzeitmodell {footer=false header=false count=false}

<div style="position:absolute;top:40pt;width:100%;height:100%;"> 
<div style="width:30%;height:30%;margin:auto">
![](figures/milling-machine-model)
</div>
</div>
