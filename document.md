
# Einleitung

## Motivation

Durch sinkende Losgrößen und steigende Produktvariabilität sind Echtzeitüberwachung und -kontrolle in verteilten, rekonfigurierbaren Fertigungssystemen notwendig @Wang2004.

Die Infrastruktur für eine Verbindung zwischen automatisiertem Equipment und E-Manufacturing fehlt @Wang2004.

Heutige Produktionseinrichtungen beherbergen Maschinen jeden Alters, die zu einem gemeinsamen System verwachsen müssen.
Gerade ältere Modelle (Altmaschinen) besitzen häufig keine Möglichkeit der Integration in die IT-Systeme einer modernen Fertigungsstrecke.
So sind geschlossene Architekturen und fehlende Schnittstellen verantwortlich für eingeschränkte Überwachung und Steuerung, respektive für die Verhinderung von ökonomisch sinnvoller Automation @Deshpande2011.

Als Teil des Fertigungsprozesses besitzt eine Altmaschine keine Möglichkeit externer Kommunikation und kein _Application Programming Interface_ (API) @Deshpande2011.

Bisher basierten Produktionseinrichtungen auf dem manuellen Sammeln und Verteilen von Daten für Überwachung, Steuerung und Wartung der Maschinen.
Doch gegenüber den hohen Kosten, menschlichen Fehlern, dem teilweise schlechten Zugang zur Maschine und Aspekten der Datensicherheit, sind Automatisierungslösungen heute günstig und damit Teil der Fertigungsindustrie @Deshpande2011.

Durch steigende Rechenleistung sind ARM-Prozessoren auf Einplatinencomputern in der Lage Mehrachsmaschinen zu kontrollieren @Grigoriev2016.

## Zielsetzung

## Methode und Aufbau

# Grundlagen

## Produktion und deren Automatisierung

* Ebenen der Automatisierungspyramide
    * MES
    * ... 
   
### Kommunikation

Zusammenfassung von @Pauker2013

* SPS mit digital inputs/outputs (DI/DO)
* Feldbusse (EtherCAT, ProfiBUS, CAN, etc.) => Adapter
    * trotz ICE 61158 untersch. Standards
* Ethernet Varianten (TCP, RPC, OPC)

![Beispiel einer klassischen Automatisierungspyramide[^automatisierungspyramide]](figures/automatisierungspyramide "klassische Automatisierungspyramide")

[^automatisierungspyramide]: Darstellung durch Wikipedia-Nutzer [UlrichAAB](https://de.wikipedia.org/wiki/Benutzer:UlrichAAB)

![Grundstruktur flexibler Automation @Linke2015](figures/grundstruktur-der-flexiblen-automation "Grundstruktur flexibler Automation")

Value-Stream Mapping (VSM) ist eine Methode der _Lean Production_, mit der ein vollständiger Material- und Informationsfluss vom Zulieferer zum Endkunden abgebildet werden kann. 
Damit bietet VSM ein Maß tatsächlich benötigter Produktions- und Durchlaufzeit eines Produkts @Meyer2009.

G-code is considered a “dumb” language as it only documents instructional and procedural data, leaving most of the design information behind. G-code programs are also hardware dependent, denying modern CNC machine tools desired interoperability and portability @Xu2006a.

In einer flexiblen Fertigungszelle (FFZ) befinden sich zwei oder mehr CNC-Maschinen, die im Verbund ein flexibles Fertigungssystem (FFS) bilden @Groover2008.

Hersteller von Software für _Supervisory Control and Data Aquisiton_ (SCADA) verwalten eine große Anzahl an Kommunikationstreibern für unterschiedliche Automations- und Informationssysteme.
Außerdem erschweren verschiedene Kommunikationsprotokolle und Nachrichtenformate die Integration zusätzlicher Systeme @Ayatollahi2013.

## Informationsmodelle in der Fertigungsindustrie

Informationsmodelle sind Repräsentationen von Konzepten, Relationen, Beschränkungen, Regeln und Operationen zur Spezifikation der Bedeutung (Semantik) von Daten innerhalb einer bestimmten Domäne @Lee1999.

### OPC Unified Architecture

Die _OPC Unified Architecture_ (OPC UA) ist ein semantischer Kommunikations- und Datenmodellierungsstandard für den Informationsaustausch via TCP/IP @Ayatollahi2013.

> * Communication Technology that merges:
>     (@) Transport mechanism (uses internet standards XML, HTTP,… and also optimized binary TCP)
>     (@) Information modelling (using an extensible meta model)
> * Extensible meta model
> * Platform independent (cross-platform)
> * Scalable
> * But not hard real-time (not yet) => nicht geeignet für direkt Bewegungskontrolle @Pauker2014

![OPC UA Übersicht[^opc-ua-architecture]](figures/opc-ua-architecture "OPC UA Übersicht")

[^opc-ua-architecture]: nach [opcfoundation.org/about/opc-technologies/opc-ua](https://opcfoundation.org/about/opc-technologies/opc-ua/)

Die definierte Semantik des Address Space erlaubt nicht nur anspruchsvolle M2M-Kommunikation.
Sie ermöglicht dem Operator einer FFZ Strukturinformationen einzusehen und die Automatisierungskomponenten zu kontrollieren @Ayatollahi2013.

Hoppe 2014 @Hoppe2014

> Obwohl bereits verschiedene wichtige Informationsmodelle, wie OPC-UA for
> Analyser Devices, FDI (Field Device Integration), ISA95, MTConnect, BACnet und
> PLCopen existieren, oder in der Entstehung sind, gibt es hier noch Handlungsbedarf:
> 
> * Wie geben sich z. B. ein „Temperatursensor“ oder eine „Ventilsteuerung“ zu erkennen?
> * Welche Objekte, Methoden, Variablen und Ereignisse definieren die
> 
> Schnittstelle für Konfiguration, Initialisierung, Diagnose und Laufzeit?
> OPC-UA hat das Potential, sich als De-facto-Standard für den Daten- und Informationsaustausch
> in der Automatisierungspyramide für nicht-echtzeitkritische Anwendungen
> zu etablieren. Eine sichere, horizontale und vertikale Kommunikation
> vom Sensor bis in die IT-Systeme ist damit bereits heute umsetzbar. Die Verbände
> BITCOM, VDMA und ZVEI werden durch die Industrie-4.0-Arbeitskreise keinen
> neuen Kommunikationsstandard definieren können; die Arbeitskreise bieten aber
> eine gute Grundlage zum Informationsaustausch. 

### MTConnect 

* RO Standard for Process Information in CNC @Vijayaraghavan2008

Wikipedia:

> Data from shop floor devices is presented in XML format, and is retrieved from information providers, called Agents, using Hypertext Transfer Protocol (HTTP) as the underlying transport protocol. MTConnect provides a RESTful interface, which means the interface is stateless. No session must be established to retrieve data from an MTConnect Agent, and no logon or logoff sequence is required (unless overlying security protocols are added which do). Lightweight Directory Access Protocol (LDAP) is recommended for discovery services.

=> MTConnect-OPC UA Companion Specification 

sonstige Standards...

## Kontrolle & Überwachung von Produktionsmaschinen

* CNC
* STEP-NC [@Hardwick2007;@Xu2006]
* IEC 61499 Function Blocks

## Cyber-physische Produktionssysteme

Was ist ein CPS? Übertragung auf Fertigungsind. => CPPS?


* Überblick: Wang 2015 @Wang2015

### Architekturstile und -muster

* SOA [@Meyer2010;@Fallah2016a]
* MAS, Holonic [@Leitao2009;@Fallah2016]
* Blackboard [@Monostori2006;@Pauker2013]
* RAMI4.0 @Adolphs2015

### Cloud Manufacturing

### Fog-Computing im Kontext von CPPS?

Aazam 2016 @Aazam2016

Im WAN problematisch @Schlechtendahl2015 => OPC4Factory

## Zusammenfassung

# Anforderungen

* Echtzeit der Steuerung
* Kontrollschleife?

# Forschungsstand

## Legacy Machine Monitoring Using Power Signal Analysis @Deshpande2011

__Problem:__ Datenerfassung (=> Prozessüberwachung) bei Altmaschinen nicht vorhanden  
__Lösung:__ unabhängige minimalinvasive Sensorik

__Purpose.__ 
Ziel von Deshpande et al. war eine nicht-invasive Methode der Echtzeitüberwachung von Energieverbrauch und weiteren Parametern bei Legacy-Maschinen.

__Design/Methodology/Approach.__ 
Durch das Abgreifen des Stromverbrauchs über eine _Universal Power Cell_ (UPC), dem Sensor an der Maschine, können Informationen via TCP und UDP an eine externe Komponente übergeben und ausgewertet werden.
Die in Kilowatt eingehenden Verbrauchsdaten wurden durch an Bedingungen gekoppelte Schwellwerte in Status (an, aus, Leerlauf), Energieverbrauch, Werkzeugwechsel und Werkstückdurchsatz unterschieden.
Für die Case Study und einen anschließenden Vergleich hatten Deshpande et al. auch moderne Maschinen mit der UPC ausgestattet.
Verglichen wurde die zeitabhängige Auslastung von drei unterschiedlichen Modellen.

__Findings.__ 
Mit einer Genauigkeit von 95% für den Status und 99% für Werkzeugwechsel und Durchsatz wurde das Konzept erfolgreich getestet.

__Research Limitations/Implications.__ 
Das Konzept nutzt ausschließlich den Eingangsstrom der Maschine, wodurch Genauigkeit und Umfang der Daten begrenzt werden.

__Practical Implications.__  
Für den Einsatz in einer realen Produktionsumgebung fehlen UI und API.
Anforderungen an die Energieversorgung, sowie der Verbrauch von Teilsystemen der Produktionskette werden messbar.
Die periodische Planung der Wartung kann aufgrund tatsächlicher Nutzung und Auslastung geschehen.
Außerdem werden Prinzipien wie VSM echtzeitfähig und ermöglichen eine höhere Produktivität.

__Originality/Value.__ 
Die minimal-invasive Methode ist unabhängig von Hard- Software und erlaubt die autonome Aggregation von Informationen unzugänglicher Altmaschinen.

## An ARM-based Multi-channel CNC Solution for Multi-tasking Turning and Milling Machines @Grigoriev2016

__Problem:__ Kontrolle der Maschine durch SPS mit CNC auf Terminal-PC inflexibel und teuer  
__Lösung:__ Portierbarkeit des CNC-Kernels auf andere Systeme

* Purpose
    * Untersuchung von CNC mit ARM-Computern
        * Portierung eines CNC-Kernels auf Pi 2 durch Virtualisierung mit gemeinsamen Bibliotheken (Cross-Compile)
        * Kontrolle mehrerer paralleler Kanäle mit Schrittmotoren und Spindel
        * Kommunikation über EtherCAT Feldbus (Echtzeit)
* Design/Methodology/Approach
    * Soft-SPS, RT-Linux auf ARM-Computer
    * ARM/PC-Anbindung
        * Spindel- und Motortreiber via EtherCAT
        * Feldbus-Koppler via EtherCAT
        * NC-Terminal via TCP
    * Fallstudie mit einer Dreh-/Fräsmaschine
    * Synch. der Kanäle durch High-Level-Funktionen
      (Load, Run, Start, Stop, Reset, Wait, Sleep)
* Findings
    * Ressourcen eines Einplatinencomputers sind ausreichend
    * parallele Portierung PC/ARM von NC-Software bei guter Kernel-Arch. mgl.
    * lediglich individuelle Konfiguration der Werkzeuge/Maschinen notwendig
    * CNC-Kernel braucht idle 20% ARM-CPU / 3% PC-CPU => steigt mit #Kanäle #Achsen
* Research Limitations/Implications
    * weitere Forschung auf Basis dessen
        * Verarbeitungspräzision/-Stabilität (Precision Engineering)
        * Adaptive Kontrolle
        * Diagnose/Prognose
* Practical Implications
    * EtherCAT Cycle Time[^cycle-time] < 2ms, perspektivisch < 1ms => beeinfl. Anzahl paralleler Kontroll-Kanäle
    * künftig: Einplatinencomputer kontrollieren > 12 Achsen
* Originality/Value
    * Bwertung mit _Technology Readiness Level_[^TRL] 6

[^cycle-time]: '[...] die Zeit, die ein Teilnehmer (slave) warten muß, bis er wieder "dran" ist.' @Schnell1999.
[^TRL]: [www.nasa.gov/directorates/heo/scan/engineering/technology/txt_accordion1.html](http://www.nasa.gov/directorates/heo/scan/engineering/technology/txt_accordion1.html)

## Remote real-time CNC machining for web-based manufacturing @Wang2004 

__Problem:__ Maschine ist nur am Terminal kontrollierbar; Datenerfassung und Auswertung nur vor Ort
__Lösung:__ Entfernter Zugriff

__Purpose.__ 
Das Ziel von Wang et al. war die Entwicklung einer offenen Architektur für die Echtzeitüberwachung und -kontrolle von im Netzwerk befindlichen CNC-Maschinen.

__Design/Methodology/Approach.__ 
Ein Web-basierter Thin-Client des _Wise-ShopFloor_ ermöglicht die Kontrolle und Überwachung der Maschinen über ein dreidimensionales Modell der Fertigungsstrecke.
Das darunterliegende Framework basiert auf einer Client/Server-Architekturstil und verwendet seitens des Servers das MVC-Entwurfsmuster.
Maschinen werden über das Fabriknetzwerk mit dem Server verbunden und sind somit vom Internet getrennt.
Bei der Verwendung mehrerer Clients wird für das Routing ein Publish/Subscribe Mechanismus über HTTP-Streaming eingesetzt.
Mit Hilfe dessen wird das Verhalten des auf Java 3D basierenden Visualisierungsmodells durch Sensorik an den Machinen beeinflusst.
In der von Wang et al. durchgeführten Case Study wurde unter Verwendung einer CNC-Fräsmaschine die Tauglichkeit des Konzepts verifiziert.
Die Schnittstelle zwischen Server und Maschine wurde durch einen _Open Architecture Controller_[^oac] bereitgestellt.
Für die Kontrolle der Fräse kann zwischen einem manuellen und einem automatischen Modus gewählt werden, wobei letzterer die direkte Übertragung von G-Code ermöglicht.

[^oac]: Steuerungskomponente, die Modifikationen über das API hinaus zulässt @Yonglin2004

__Findings.__  
Das Internet ist ein zentraler Aspekt verteilter Produktion.
Jedoch sind damit Sicherheitslücken fatal für interne Daten und vertrauliche Informationen der Organisation.
Die gezielte Verbreitung dieser stellt ein erhöhtes wirtschaftliches Risiko dar und muss in besonderem Maße geschützt werden.
Weiterhin sind Systemfehler auf Maschinenebene im Bezug auf Personen- und Materialschäden untragbar.
Daher muss die reibungslose Kommunikation von Steuerungsbefehlen zu jeder Zeit gewährleistet sein.

__Research Limitations/Implications.__ 
Standards für die Kommunikation von Sensor- und Steuerungsinformationen sind notwendig um Effizienz und Integration der Systeme zu vereinfachen.
So müssen globale Schnittstellen definiert und durch die Komponenten des Systems implementiert werden.
Durch die Verwendung eines zuverlässigen NC-Befehlsinterpreters ist die verteilte Echtzeitsteuerung von CNC-Maschinen nach Wang et al. praktisch möglich.
Jedoch setzt dieses System eine bestehende Anbindung an die Steuerungsebene voraus.

__Practical Implications.__ 
Die direkte Verbindung des Clients zu einer Maschine ist mit der verwendeten Technologie nicht möglich.
Sowohl die Java Sicherheitsinfrastuktur, als auch die Überwindung von Firewalls stellen zukünftig zu lösende Probleme dar.
Für künftige Maschinen ist daher das Einbetten eines dedizierten Web-Services in die Kontrolleinheit notwendig.

__Originality/Value.__ 
Ein wichtiger Aspekt des Konzepts von Wang et al. ist die technische Umsetzung auf der Java-Plattform.
Mit dieser werden Sicherheitsinfrastrukturmerkmale wie byte-code-Verifikation und Rechtemanagement direkt unterstützt.
Die Indirektion des Kontrollflusses über den Server der Architektur zu den Maschinen verhilft zur Einhaltung.

## Information Architecture for Reconfigurable production systems @Pauker2013

__Problem:__ Betrachtungen des Retrofitting bzgl. Kontrolle und Überwachung einzelner Maschine, Integration?  
__Lösung:__ flexibel konfigurierbarer Verbund miteinander kommunizierender Maschinen => FFZ

![Vergleich der Architekturen von Fertigungszellen aus @Pauker2013](figures/vgl-arch-ffz)

* Purpose
    * Montage und Konfiguration von FFZ bzgl. Informationsebene vereinfachen
    * Design von Informationsmodell und zentralem Daten-Cache
    * Design einer Kommunikationsarchitektur für die Komponenten einer FFZ
    * Rekonfiguration einer FFZ zur Laufzeit (Losgrößenproblematik)
    * wissensch. Experimente mit rekonfigurierbaren Fertigungssystemen
* Design/Methodology/Approach
    * VDMA 34180 als Arch.-Ref. für FFZ betrachtet
        * beschreibt Kommunikationsarchitekturen für _Robotized Manufacturing Cells_ (RMC)
        * Schwerpunkt auf Werkstücklogistik mit Robotern
    * Blackboard-Architektur für Kommunikation
        * zentrale Datenbasis
        * keine Kontrolleinheit (vgl. Blackboard in intelligenten Systemen)
        * XML als Datenformat
            * Parameter für Kommunikation (IP, Port)
            * Maschinenstatus 
            * Programm (Ident., Status)
            * Informationen zu angeschlossenen Geräten
        * Konsistenz durch R/W-Locks
        * Sequenzkontrollkomponente legt Handlungsweisungen auf Blackboard ab
        * _Microsoft Visual Programming Language_ (VPL) als Sequenzdefinitionsformat (Datenflussdiagramm)
        * Maschinen und Sequenzkontrolle als aktive _Knowledge Sources_ holen sich diese Instruktionen
    * Master/Slave-Prinzip für Workflow und Job-Delegation (Master-Worker-Pattern)
    * Ethernet-basierte Kommunikationsschnittstellen
    * Adapter zu den Maschinen-Controllern (via Socket an Cell-Controller)
    * Fallstudie durch FFZ mit zwei Fräsen und einem Roboter
* Findings
    * Reduktion von Komplexität der Topologie => geringerer Konfigurationsaufwand
    * VDMA 34180 nutzt DI/DO für Kommunikation => Konfiguration auf HW-Ebene => zu inflexibel für rekonfigurierbare RMCs
    * Fallstudie zeigt die Eignung der Architektur für FFZ
    * Blackboard geeignet bei notwendiger Austauschbarkeit der Komponenten
* Research Limitations/Implications
    * Schwerpunkt auf Blackboard-Informationscache 
    * Eignung von VPL für Datenflussdefinition zu untersuchen
    * Performanz-Probleme mit XML als Blackboard-Backend (SQLite wird diskutiert)
        * R/W-Locks
        * Parsen der Datei 
    * Socket-basierte Kommunikation Problematisch
        * proprietäre Kommunikationsprotolle => Adapter immer notwendig 
        * OPC UA Server für beteiligte Komponenten
* Practical Implications
    * Hinzufügen/löschen von HW-/SW-Komponenten ohne Überarbeiten der Informationsarch./-modelle
    * _Plug & Produce_ für FFZ wird möglich
    * Einbinden einer Komponente erfordert Adapter
* Originality/Value
    * Blackboard den intelligenten Systemen entlehnt
    * Definition der Sequenz für den Cell-Controller
    
## Prototype OPC UA Server for Remote Control of Machine Tools @Ayatollahi2013

__Problem:__ Socket-basierte, proprietäre Maschinenkommunikation (Adapter)
__Lösung:__ OPC UA Server für Komponenten einer FFZ

* Purpose
    * OPC UA Server für CNC innerhalb einer FFZ
    * semantische Kommunikationsschnittstelle
* Design/Methodology/Approach
    * Implementierung eines OPC UA Informationsmodells für CNC-Maschinen
    * Methoden des Informationsmodells für Instruktionen verwendet
    * Kommunikation zw. Server und Maschine via propriät. Direct Numerical Control (DNC)
    * Case-Study an CNC-Drehmaschine & Industrieroboter
    * C++ UA Server SDK, .NET UA Client SDK (Unified Automation)
    * OPC UA Client mit Kontrollfunktionalität
* Findings
    * OPC UA ist eine geeignete Technologie für erweiterte Maschinenanbindung
    * Problem der Granularität des Modells (Ockhams Rasiermesser, KISS), 1-zu-1 Mapping ungeeignet
* Research Limitations/Implications
    * Definition eines Standard-Informationsmodells benötigt (vgl. MTConnect-OPC UA Comp.)
    * Anforderungen (horiz./vert. Integr.) für bestehende Standards (MES)
* Practical Implications
* Originality/Value
    * OPC UA Methoden als Steuerungsschnittstelle
    * dynamische (Runtime) Werkzeugrepräsentation im OPC UA Adressraum 

## A systematic approach to OPC UA information model design @Pauker2016

__Problem:__ OPC UA ist nicht alleiniger Standard für Informationsmodelle  
__Lösung:__ Informationsmodelle modellgetrieben entwickeln

![Transformationsprozess PIM zu PSM aus @Pauker2016](figures/transformation-process-pim-to-psm){#fig:transformation-process-pim-to-psm}

* MOF?
* M0 == FFS
* FFS repräs. durch PIM, definiert in UML auf M2  
  => plattformunabh. Modellierung auf M1
* PIM => PSM: ein PIM-Elem. entspricht einem PSM-Elem. pro PSM (OPC UA, MTConnect, etc.)
* ein PSM kann dann in untersch. Sprachen (C#, C++, ...) übersetzt werden
* M3 Meta-Metamodell beschr. Sprache für spez. Metamodelle auf M2 => Interoperabilität zw. M2-Modellen

---

* Purpose
    * UML als einheitliche Modellierungssprache in der Softwareentwicklung, untersch. Modellierungssprachen in der Fertigungsindustrie
    * Model und Code müssen für jede Sprache separat entwickelt und gewartet werden => hoher manueller Aufwand
    * Konzept modellgetriebenen Designs (MDA) auf Fertigungsindustrie übertragen
        * automatisiertes Ableiten plattformspezifischer Modelle von plattformunabhängigen
    * Spezifikation eines Prozesses mit dem virtuelle Repräsentationen von I4.0-Komponenten generiert werden können
        * Diagramme und Tools für Modellierung und Code-Generierung
        * OPC UA Informationsmodelle von Systemanforderungen zu Codegenerierung und Deployment
    * RAMI4.0 Konformität
* Design/Methodology/Approach
    * erfassen statischer und dynamischer (Verhalten) Aspekte von Produktionssystemen
    * systematischer Ansatz für Modelltransformation zu OPC UA Informationsmodelle (hier: Zieltechnologie)
    * wichtigste plattformspez. Technologien untersucht => MDA Workflow definiert
        => Restriktionen für PIM definiert  
        => Restricted Platform Independent Model (R-PIM)
        * z.B.: Mehrfachvererbung in UML + nicht mgl. mit C#
        * z.B.: notwendige Attribute der OPC UA Knoten (NodeId, NodeClass, BrowseName, DisplayName)
        * untersch. zu MDA liegt in diesen Restriktionen
    * generisch bzgl. Zielmodell (OPC UA, MTConnect, etc.) <= Systemanalyse und -design mit der UML
        1. Komponenten- und Anwendungsfalldiagramme zur Beschreibung der Domäne
            * manuell, da Wissen von Domänenexperten/Systemnutzern benötigt
            * Komponentendiagramm: Systemgrenzen und Subsysteme identifizieren
            * Anwendungsfalldiagramme: abstrakte Systemfunktionalität
        2. Domänenwissen => R-PIM
            * Klassendiagramme
            * Zustandsdiagramme
        3. R-PIM => Zieltechnologie
            * Adressraummodell
        4. Zieltechnologie => Code-Gerüst
        5. Implementierung der Logik in Komponenten (API)
        6. Deployment eines ausführbaren Artefakts
* Findings
    * fehlende APIs/Tools => noch viel manueller Aufwand
* Research Limitations/Implications
    * Definition eines Meta-Metamodells für Restriktionen steht noch aus
    * manuelle R-PIM => PSM Transformation (exist. Konzept erlaubt nur statischer Aspekte des Address Space)
    * TU Wien arbeitet an Transf. dynamischer Aspekte => Guarded State Machines aus OPC UA Spec
    * vorerst nur OPC UA
    * Verbesserung der CIM-Definition
    * Ontologien als Wissensbasen statt Experten
* Practical Implications
    * Adressraummodellierung, Logikimplementierung zum Großteil noch händisch (fehlende Tools und APIs)
* Originality/Value
    * MDA-Prozess für generische Informationsmodelle durch UML

## Multi Agent based Control Architectures @Fallah2016

nicht in's Konzept => notwendig?

* Purpose
    * 
* Design/Methodology/Approach
    * 
* Findings
    * 
* Research Limitations/Implications
    * 
* Practical Implications
    * 
* Originality/Value
    * 

## Towards model-integrated service-oriented manufacturing execution system @Fallah2016a

* Purpose
    * 
* Design/Methodology/Approach
    * 
* Findings
    * 
* Research Limitations/Implications
    * 
* Practical Implications
    * 
* Originality/Value
    * 

<!-- Projekte -->

Die Integration bestehender Hardware in die intelligente Steuerung einer Fabrik ist Thema des _RetroNet_-Projekts.
Das Fraunhofer IPK entwickelt mit Industriepartnern physische und logische Adapter für die Anbindung von bestehenden Anlagen an eine Steuerungsplattform.
Maschinen-, Anlagen und Produktionsdaten werden zu diesem Zweck zentral erfasst und gespeichert.
Weiterhin soll eine Middleware im Client-Server-Architekturstil Dienste und zugrunde liegende Teilsysteme miteinander verbinden und eine vermittelnde Rolle im Gesamtsystem einnehmen @FraunhoferIPK2016. <!-- Keine Publikationen ... -->

Forschung im Bereich Cloud-basierter Industriesteuerung wird in Zusammenarbeit von Fraunhofer, der TU Berlin und Industriepartnern betrieben.
Im Projekt _pICASSO_ werden die Auslagerung von Steuerungsdiensten in die Cloud und Möglichkeiten einer Verteilung und Modularisierung herkömmlicher Kontrollsysteme auf CPS-Komponenten untersucht @FraunhoferIPK2016a.

Im Projekt _OPC4Factory_ der TU Wien, wurden generische OPC UA Informationsmodelle entwickelt.
Diese verbessern die Konnektivität von NC-Maschinen, Industrierobotern und anderen Komponenten innerhalb einer flexibel automatisierten Fertigungszelle.
Die Orchestrierung der Fertigungsoperationen, sowie die Konfiguration der Komponenten soll durch die Lösung der Schnittstellenproblematik vereinfacht werden[^OPC4Factory].

[^OPC4Factory]: [www.ift.at/forschung/foschungsprojekte/opc4factory](https://www.ift.at/forschung/foschungsprojekte/opc4factory)
see [@Ayatollahi2013;@Pauker2013;@Pauker2014]

[@Schlechtendahl2015;@Schlechtendahl2014;@Vick2015]

## Zusammenfassung 

* TODO Projekte zusammenfassen & gegeneinander abgrenzen
* Schnittstellenproblematik immer Teil des Problems
* Entwicklung von Adaptern meist Standardlösung
* 

# Konzeption

<!-- BEGIN Rahmen dieser Arbeit -->

* betrachtet
    * Fertigungsindustrie
    * CNC-Maschinen
* unbetrachtet
    * Adapter für proprietäre CNC-Protokolle (DNC)

<!-- END Rahmen dieser Arbeit -->

* Controlling nicht aus der Cloud @... sondern an der Maschine  
    * SPS (und Motortreiber) als Teil des Surrogate  
      * CNC-Kernel auf dediziertem Controller  
        * Kernel muss nicht portiert werden (vgl. @Grigoriev2016)  
        *  
    * Echtzeit kein Problem (OPC UA kann's eh nicht)  
    * kein Feldbus, keine Koppler, kein DI/DO (vgl. @Grigoriev2016)  
    * Ethernet-basierte Kommunikation  
    
* Konzept eines _Cell Controller_ als Basis (vgl. [@Ayatollahi2013;@Fallah2016a])
* kein Maschinenspez. NC-Terminal => verteiltes System => entfernte Mensch-Maschine-Schnittstelle  (vgl. @Grigoriev2016)
* Rekonfigurierbare FFZ @Pauker2013
* Bisher OPC UA Server als Adapter zu proprietären Maschinenprotokollen 
    * Server <->  Maschine => Server <-> Adapter <-> Maschine ?
    * Smoothieboard/Embedded (soft-)SPS als Adapter zu Maschine
* Wiederverwendung @Ayatollahi2013
    * des Informationsmodells
    * des Flow-Charts für die Server-Logik
* Persistenzkonzept: Blackboard? @Pauker2013
* Kontrolle der Arbeitssequenz? (PROtEUS, BPMN/Activiti)

OPC4Factory:

> OPC UA Server und ihre Informationsmodelle repräsentieren alle für die Automatisierungs-aufgaben erforderlichen Komponenten der angeschlossenen Maschinen und Roboter (Ladetüren, Spannmittel, Werkzeuge, NC-Programme etc.) mit ihren Attributen, Ereignissen und Methoden. Die Kommunikation auf dieser Ebene __erfordert keine Echtzeitfähigkeit__, da Steuerungsaufgaben mit Echtzeitanforderungen ausschließlich innerhalb der Maschinen- bzw. Robotersteuerung abgewickelt werden.

* Statusreport: Referenzarchitekturmodell Industrie 4.0 (RAMI4.0) @Adolphs2015
* Kruchten 4+1

## Virtuelle Maschinenrepräsentation

## Kommunikations- & Informationsmodell

## Systemintegration

## Zusammenfassung

# Implementation

* Smoothieboard als Maschinen-Adapter
* open62541 oder ähnliche OPC UA Stack-Implementierungen für Server auf Pi

## Zusammenfassung

# Evaluation

## Zusammenfassung

# Zusammenfassung

## Schlussfolgerung

## Ausblick
