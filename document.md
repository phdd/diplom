# Einleitung

## Motivation

Durch sinkende Losgrößen und steigende Produktvariabilität sind Echtzeitüberwachung und -kontrolle in verteilten, rekonfigurierbaren Fertigungssystemen notwendig @Wang2004.

Die Infrastruktur für eine Verbindung zwischen automatisiertem Equipment und E-Manufacturing fehlt @Wang2004.

Heutige Produktionseinrichtungen beherbergen Maschinen jeden Alters, die zu einem gemeinsamen System verwachsen müssen.
Gerade ältere Modelle (Altmaschinen) besitzen häufig keine Möglichkeit der Integration in die IT-Systeme einer modernen Fertigungsstrecke.
So sind geschlossene Architekturen und fehlende Schnittstellen verantwortlich für eingeschränkte Überwachung und Steuerung, respektive für die Verhinderung von ökonomisch sinnvoller Automation @Deshpande2011.

Bisher basierten Produktionseinrichtungen auf dem manuellen Sammeln und Verteilen von Daten für Überwachung, Steuerung und Wartung der Maschinen.
Doch gegenüber den hohen Kosten, menschlichen Fehlern, dem teilweise schlechten Zugang zur Maschine und Aspekten der Datensicherheit, sind Automatisierungslösungen heute günstig und damit Teil der Fertigungsindustrie @Deshpande2011.

Durch steigende Rechenleistung sind ARM-Prozessoren auf Einplatinencomputern in der Lage Mehrachsmaschinen zu kontrollieren @Grigoriev2016.

## Zielsetzung

## Rahmen dieser Arbeit

* betrachtet
    * Fertigungsindustrie
    * CNC-Maschinen
* unbetrachtet
    * TODO

## Methode und Aufbau


    
# Grundlagen

* Ebenen der Automatisierungspyramide
    * MES
    * ...

Als Teil des Fertigungsprozesses besitzt eine Altmaschine keine Möglichkeit externer Kommunikation und kein _Application Programming Interface_ (API) @Deshpande2011.

Value-Stream Mapping (VSM) ist eine Methode der _Lean Production_, mit der ein vollständiger Material- und Informationsfluss vom Zulieferer zum Endkunden abgebildet werden kann. 
Damit bietet VSM ein Maß tatsächlich benötigter Produktions- und Durchlaufzeit eines Produkts @Meyer2009.

G-code is considered a “dumb” language as it only documents instructional and procedural data, leaving most of the design information behind. G-code programs are also hardware dependent, denying modern CNC machine tools desired interoperability and portability @Xu2006a.

In einer _Flexible Manufacturing Cell_ (FMC) befinden sich zwei oder mehr CNC-Maschinen, die im Verbund ein _Flexible Manufacturing System_ (FMS) bilden @Groover2008.

## Kontrolle und Überwachung von Produktionsmaschinen

## Informationsmodelle in der Fertigungsindustrie

Hersteller von Software für _Supervisory Control and Data Aquisiton_ (SCADA) verwalten eine große Anzahl an Kommunikationstreibern für unterschiedliche Automations- und Informationssysteme.
Außerdem erschweren verschiedene Kommunikationsprotokolle und Nachrichtenformate die Integration zusätzlicher Systeme @Ayatollahi2013.

### OPC Unified Architecture

Die _OPC Unified Architecture_ (OPC UA) ist ein semantischer Kommunikations- und Datenmodellierungsstandard für den Informationsaustausch via TCP/IP @Ayatollahi2013.

> * Communication Technology that merges:
>     (@) Transport mechanism (uses internet standards XML, HTTP,… and also optimized binary TCP)
>     (@) Information modelling (using an extensible meta model)
> * Extensible meta model
> * Platform independent (cross-platform)
> * Scalable
> * But not hard real-time (not yet) => nicht geeignet für direkt Bewegungskontrolle @Pauker2014

![OPC UA Übersicht](figures/opc-ua-architecture "OPC UA Übersicht")

Die definierte Semantik des Address Space erlaubt nicht nur anspruchsvolle M2M-Kommunikation.
Sie ermöglicht dem Operator einer FMC Strukturinformationen einzusehen und die Automatisierungskomponenten zu kontrollieren @Ayatollahi2013.

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

* MTConnect


## Cyber-physische Produktionssysteme

* Überblick: Wang 2015 @Wang2015

### Architekturstile und -muster

* MAS, Holonic [@Leitao2009;Fallah2016]
* SOA [@Meyer2010;@Fallah2016a]
* Blackboard [@Monostori2006;@Pauker2013]

### Fog-Computing im Kontext von CPPS

Aazam 2016 @Aazam2016

## Zusammenfassung


# Forschungsstand

## Überwachung

### Legacy Machine Monitoring Using Power Signal Analysis @Deshpande2011

Purpose

:   Ziel von Deshpande et al. war eine nicht-invasive Methode der Echtzeitüberwachung von Energieverbrauch und weiteren Parametern bei Legacy-Maschinen.


Design/Methodology/Approach

:   Durch das Abgreifen des Stromverbrauchs über eine _Universal Power Cell_ (UPC), dem Sensor an der Maschine, können Informationen via TCP und UDP an eine externe Komponente übergeben und ausgewertet werden.
    Die in Kilowatt eingehenden Verbrauchsdaten wurden durch an Bedingungen gekoppelte Schwellwerte in Status (an, aus, Leerlauf), Energieverbrauch, Werkzeugwechsel und Werkstückdurchsatz unterschieden.
    Für die Case Study und einen anschließenden Vergleich hatten Deshpande et al. auch moderne Maschinen mit der UPC ausgestattet.
    Verglichen wurde die zeitabhängige Auslastung von drei unterschiedlichen Modellen.


Findings

:   Mit einer Genauigkeit von 95% für den Status und 99% für Werkzeugwechsel und Durchsatz wurde das Konzept erfolgreich getestet.


Research Limitations/Implications

:   Das Konzept nutzt ausschließlich den Eingangsstrom der Maschine, wodurch Genauigkeit und Umfang der Daten begrenzt werden.


Practical Implications

:   Für den Einsatz in einer realen Produktionsumgebung fehlen UI und API.
    Anforderungen an die Energieversorgung, sowie der Verbrauch von Teilsystemen der Produktionskette werden messbar.
    Die periodische Planung der Wartung kann aufgrund tatsächlicher Nutzung und Auslastung geschehen.
    Außerdem werden Prinzipien wie VSM echtzeitfähig und ermöglichen eine höhere Produktivität.


Originality/Value

:   Die minimal-invasive Methode ist unabhängig von Hard- Software und erlaubt die autonome Aggregation von Informationen unzugänglicher Altmaschinen.

## Kontrolle

### Wise-ShopFloor 

Remote real-time CNC machining for web-based manufacturing @Wang2004 

Purpose

:   Das Ziel von Wang et al. war die Entwicklung einer offenen Architektur für die Echtzeitüberwachung und -kontrolle von im Netzwerk befindlichen CNC-Maschinen.


Design/Methodology/Approach

:   Ein Web-basierter Thin-Client des _Wise-ShopFloor_ ermöglicht die Kontrolle und Überwachung der Maschinen über ein dreidimensionales Modell der Fertigungsstrecke.
    Das darunterliegende Framework basiert auf einer Client/Server-Architekturstil und verwendet seitens des Servers das MVC-Entwurfsmuster.
    Maschinen werden über das Fabriknetzwerk mit dem Server verbunden und sind somit vom Internet getrennt.
    Bei der Verwendung mehrerer Clients wird für das Routing ein Publish/Subscribe Mechanismus über HTTP-Streaming eingesetzt.
    Mit Hilfe dessen wird das Verhalten des auf Java 3D basierenden Visualisierungsmodells durch Sensorik an den Machinen beeinflusst.
    In der von Wang et al. durchgeführten Case Study wurde unter Verwendung einer CNC-Fräsmaschine die Tauglichkeit des Konzepts verifiziert.
    Die Schnittstelle zwischen Server und Maschine wurde durch einen _Open Architecture Controller_[^oac] bereitgestellt.
    Für die Kontrolle der Fräse kann zwischen einem manuellen und einem automatischen Modus gewählt werden, wobei letzterer die direkte Übertragung von G-Code ermöglicht.

[^oac]: Steuerungskomponente, die Modifikationen über das API hinaus zulässt @Yonglin2004

Findings

:   Das Internet ist ein zentraler Aspekt verteilter Produktion.
    Jedoch sind damit Sicherheitslücken fatal für interne Daten und vertrauliche Informationen der Organisation.
    Die gezielte Verbreitung dieser stellt ein erhöhtes wirtschaftliches Risiko dar und muss in besonderem Maße geschützt werden.
    Weiterhin sind Systemfehler auf Maschinenebene im Bezug auf Personen- und Materialschäden untragbar.
    Daher muss die reibungslose Kommunikation von Steuerungsbefehlen zu jeder Zeit gewährleistet sein.


Research Limitations/Implications

:   Standards für die Kommunikation von Sensor- und Steuerungsinformationen sind notwendig um Effizienz und Integration der Systeme zu vereinfachen.
    So müssen globale Schnittstellen definiert und durch die Komponenten des Systems implementiert werden.
    Durch die Verwendung eines zuverlässigen NC-Befehlsinterpreters ist die verteilte Echtzeitsteuerung von CNC-Maschinen nach Wang et al. praktisch möglich.
    Jedoch setzt dieses System eine bestehende Anbindung an die Steuerungsebene voraus.


Practical Implications

:   Die direkte Verbindung des Clients zu einer Maschine ist mit der verwendeten Technologie nicht möglich.
    Sowohl die Java Sicherheitsinfrastuktur, als auch die Überwindung von Firewalls stellen zukünftig zu lösende Probleme dar.
    Für künftige Maschinen ist daher das Einbetten eines dedizierten Web-Services in die Kontrolleinheit notwendig.


Originality/Value

:   Ein wichtiger Aspekt des Konzepts von Wang et al. ist die technische Umsetzung auf der Java-Plattform.
    Mit dieser werden Sicherheitsinfrastrukturmerkmale wie byte-code-Verifikation und Rechtemanagement direkt unterstützt.
    Die Indirektion des Kontrollflusses über den Server der Architektur zu den Maschinen verhilft zur Einhaltung.

andere:

* TODO 

### Kontrollstrukturen mit OPC UA

Prototype OPC UA Server for Remote Control of Machine Tools @Ayatollahi2013

Purpose

:   In der Arbeit von Ayatollahi et al. wird der Prototyp eines OPC UA Servers, mit der Fähigkeit Maschinen innerhalb einer FMC zu steuern, vorgestellt.
    Die Case Study wurde mit einer CNC-Drehmaschine und einem Industrieroboter durchgeführt.


Design/Methodology/Approach

:   


Findings

:   TODO


Research Limitations/Implications

:   TODO


Practical Implications

:   TODO


Originality/Value

:   TODO

## Konfiguration

Information Architecture for Reconfigurable production systems @Pauker2013


Purpose

:   TODO


Design/Methodology/Approach

:   TODO


Findings

:   TODO


Research Limitations/Implications

:   TODO


Practical Implications

:   TODO


Originality/Value

:   TODO

## Architekturen

Warum kein Monolith?

### Multiagentensysteme

Multi Agent based Control Architectures @Fallah2016

Purpose

:   TODO


Design/Methodology/Approach

:   TODO


Findings

:   TODO


Research Limitations/Implications

:   TODO


Practical Implications

:   TODO


Originality/Value

:   TODO


### Service-orientierte Architekturen

Towards model-integrated service-oriented manufacturing execution system @Fallah2016a


Purpose

:   TODO


Design/Methodology/Approach

:   TODO


Findings

:   TODO


Research Limitations/Implications

:   TODO


Practical Implications

:   TODO


Originality/Value

:   TODO

### sonstige?


## Zusammenfassung 

* [OPC4Factory](https://www.ift.at/forschung/foschungsprojekte/opc4factory/) des Instituts für Fertigungstechnik und Hochleistungslasertechnik (IFT) der TU Wien

# Konzeption

* Konzept eines _Cell Controller_ als Basis (vgl. [@Ayatollahi2013;@Fallah2016a])
* Blackboard @Pauker2013
* Bisher OPC UA Server als Adapter zu proprietären Maschinenprotokollen 
    * Server <->  Maschine => Server <-> Adapter <-> Maschine
* Kontrolle der Arbeitssequenz? (PROtEUS, BPMN/Activiti)

## Zusammenfassung


# Implementation

## Zusammenfassung


# Evaluation

## Zusammenfassung


# Zusammenfassung

## Schlussfolgerung

## Ausblick
