
# Einleitung

Seit der Mitte des 18. Jahrhunderts ist die industrielle Fertigung in stetigem Wandel.
Mit der Entwicklung dampfgetriebener Arbeits- und Kraftmaschinen um 1750 wurde die erste industrielle Revolution eingeleitet.
Zum Ende des 19. Jahrhunderts ermöglichten die Einführung arbeitsteiliger Massenproduktion und wissenschaftlicher Betriebsführung das erste Transportband in der fleischverarbeitenden Industrie.
Knapp einhundert Jahre nach dieser zweiten Revolution, wurden 1969 erste speicherprogrammierbare Steuerungen (SPS) zur variantenreichen Serienproduktion eingesetzt.
Informations- und Kommunikationstechnologie sind seither der Grundstein automatisierungsgetriebener Rationalisierungen.
Im Jahr 2011 wurde ausgehend von _Lean Production_ der Begriff _Industrie 4.0_ geprägt, der die vierte Industrielle Revolution beschreibt [@Gausemeier2014].
Sie zeichnet sich durch neue Ansätze wie das _Internet of Things_ (IoT) und cyber-physische Systeme (CPS) im Kontext industrieller Produktion aus @Siepmann2016.

## Motivation

Vor der vierten Revolution war klassische Produktionssteuerung zentralisiert und Steuerungstechnik monolithisch strukturiert.
Zukünftig wird die Fertigung in cyber-physische Systeme von Systemen zerlegt und mit offenen Standards dezentral betrieben @Milberg2014.
Moderne Produktionseinrichtungen beherbergen jedoch Maschinen jeden Alters, die zu einem gemeinsamen System verwachsen müssen.
Die Technologie zur numerische Kontrolle von Werkzeugmaschinen existiert bereits seit den frühen 1950er Jahren.
Gerade diese älteren Anlagen besitzen häufig keine Möglichkeit der Integration in die IT-Systeme einer künftigen Fertigungsstrecke @Wang2004.
Das schlichte Ersetzen dieser Altmaschinen ist aufgrund hoher Kosten meist keine Lösung @FraunhoferIPK2016.
Jedoch behindern diese vorrangig die nahtlose Machine-To-Machine (M2M) Kommunikation durch fehlende Infrastrukturanbindung, womit die Kette von Bearbeitungsschritten für ein Produkt zahlreiche manuelle Eingriffe erfordert.  
Als Teil des Fertigungsprozesses besitzt eine Altmaschine keine Möglichkeit externer Kommunikation und kein _Application Programming Interface_ (API) @Deshpande2011.
Bei jüngeren Konstruktionen treten Integrationsschwierigkeiten an anderer Stelle auf.
So sind selbst bei bestehender Netzwerkfähigkeit geschlossene Soft- und Hardwarearchitekturen und fehlende Schnittstellen verantwortlich für eingeschränkte Überwachung und Steuerung, respektive für die Verhinderung von ökonomisch sinnvoller Automatisierung [@Deshpande2011;@Ferrolho2007].
Weiterhin erschweren die unzureichende Umsetzung von Industriestandards und -normen die Integration der Maschinen [@Wang2004;@Hoppe2014].

Technische Komponenten, wie eine Netzwerkanbindung, sind nicht die einzigen Barrieren moderner Produktionsautomatisierung.
Fehlerbehaftete Kommunikationsmechanismen, sowie die Gefahr der Veräußerung betriebsinterner Daten, sind Probleme die heute gelöst werden können.
Auch erfordern sinkende Losgrößen und steigende Produktvariabilität eine flexible Automatisierung von Echtzeitüberwachung und -kontrolle verteilter, rekonfigurierbarer Fertigungssysteme [@Wang2004;@Lay2001].  
Produktionseinrichtungen basierten bisher auf dem manuellen Sammeln und Verteilen von Daten für Überwachung, Steuerung und Wartung der Maschinen.
Doch gegenüber hohen Kosten, menschlichen Fehlern, dem teilweise schlechten Zugang zur Anlage und Aspekten der Datensicherheit, sind Automatisierungslösungen heute günstig, sicher und attraktiv für die Fertigungsindustrie @Deshpande2011.

## Zielsetzung {#sec:zielsetzung}

Nach der Motivation und der damit einhergehenden Identifikation des Kernproblems, werden nun die Ziele und Vorgaben dieser Arbeit beschrieben. 

### Aufgaben

Folgenden Aufgaben wird in dieser Arbeit entsprochen:

1. Ermitteln der Anforderungen für eine Integration von Altmaschinen in moderne, verteilte Produktionsumgebungen -- im Folgenden als Retrofitting bezeichnet.
2. Recherchen zum heutigen Stand der Technik und die Einbeziehung vorhandener Systeme.
3. Konzeption einer virtuellen Repräsentation als Schnittstelle der zu integrierenden Anlage.
4. Ermöglichen von dezentraler Kontrolle und Überwachung im Hinblick auf cyber-physische Produktionssysteme. 
    - Transfer und Ausführung von Maschinenprogrammen.
    - Erfassen von Produktionsdaten durch angeschlossene Sensoren.
    - Verwendung von Einplatinencomputern in der Implementierung.
5. Vorstellung eines skalierenden, erweiterbaren Frameworks.
6. Eine prototypische Implementierung belegt die prinzipielle Durchführbarkeit.
7. Testgetriebene Entwicklung ergänzt die Lösung um eine adäquate Test-Infrastruktur.

### Annahmen 

Für Konzept und Implementierung müssen einige Voraussetzungen erfüllt sein:

* Eine bestehende Netzwerkinfrastruktur auf Basis von TCP/IP erlaubt das Einbinden eines virtuellen Maschinenabbilds in die Fertigungsstrecke.
* Zugang zur Anlage, regelungstechnische Modifikationen und das Anbringen von Sensorik und Aktuatoren sind gegeben.
* Die zu modernisierende Werkzeugmaschine wird durch rechnergestützte numerische Steuerung (CNC) kontrolliert.
* Einplatinencomputer sind ausreichend leistungsfähig für die Steuerung und Überwachung von CNC-Maschinen (vgl. @Grigoriev2016).

Somit ist das vorgestellte Konzept der Anlagenmodernisierung auf diskrete Fertigung mit bestehender Netzwerkinfrastruktur beschränkt.

### Erwartungen

Folgende Forschungsergebnisse werden von dieser Arbeit erwartet:

* Eine dezentrale Informationsarchitektur verbessert die Resilienz, Produktionsstabilität und Skalierbarkeit von verteilten Fertigungssystemen und flexibilisiert Fertigungszellen.
* Kommunikationskanäle zwischen einzelnen Maschinen werden aufgrund durchgängig verfügbarer Schnittstellen nicht mehr unterbrochen. 
* Durch damit einheitlich mögliche _Machine-To-Machine_ (M2M) Kommunikation wird die Kontrolle und Überwachung hierarchisiert und dezentralisiert. 
* Die Modellierung von Komponenten und Funktionalität einer Maschine wird durch Standardentwicklungswerkzeuge und -austauschformate vereinfacht.
* Das Optimierungspotential der Gesamtanlage kann durch statistische Auswertung der anfallenden Daten zu Maschinenoperation und -auslastung ausgeschöpft werden.

Folgende praktisch relevante Ergebnisse werden erwartet:

* Durch die entfernte Kontrolle einer Altmaschine werden manuelle Tätigkeiten wie das Übertragen eines Maschinenprogramms gemindert.
* Die zentrale Auswertung von Prozessdaten ermöglicht einen gesamtheitlichen Einblick in die Produktion. Diagnosen müssen nicht mehr vor Ort gestellt werden. 
* Der operative Einsatz einer formals nicht integrierten Anlage kann stärker automatisiert werden und beschleunigt den gesamtheitlichen Produktionsablauf.
* Die Planung der Fertigung wird vereinfacht und deren Durchführung beschleunigt.
* Wartungszyklen können besser überprüft und eingehalten werden.
* Werkzeugbruch und -wechsel werden ad hoc an Verantwortliche kommuniziert.

## Fragestellung

Nach Klärung der Ziele, werden in dieser Arbeit folgende Fragen zu beantworten sein.

> Welchen softwaretechnologischen Konzepten muss die Modernisierung und der infrastrukturelle Kontext einer Altmaschine unterliegen, um eine ganzheitliche Integration in cyber-physische Produktionssysteme (CPPS) gewährleisten zu können?
> 
> 1. Welche System- und Softwarearchitektur ist für ein flexibles Retrofitting zur Kontrolle und Überwachung veralteter CNC-Maschinen im Kontext von CPPS geeignet?
> 2. Wie und wo werden Informationen zu Maschinenzustand und  
> -operation erfasst, verarbeitet, persistiert und Fremdsystemen zur Verfügung gestellt?
> 3. Welche standardisierten Protokolle und Datenstrukturen eignen sich für M2M-Kommunikation in einem CPPS?

## Methode und Aufbau

Angelehnt an die _Design Science Research Methodology_ (DSRM) wurden bisher grundlegende Probleme identifiziert und die Arbeit motiviert @Geerts2011.
Durch die folgenden Grundlagen (Kapitel 2) werden essentielle Technologien und Konzepte beschrieben.
Die sich anschließenden Anforderungen (Kapitel 3) spezifizieren die Zielvorgaben der darauf entwickelten Lösungskonzepte (Kapitel 4) für die Abstraktion von Maschinen in cyber-physischen Produktionssystemen.
Durch die prototypische Implementation (Kapitel 5) des Frameworks und das virtuelle Maschinenabbild wird die prinzipielle Durchführbarkeit des Vorhabens belegt.
Die Evaluation (Kapitel 6) hat eine qualitative und quantitative Bewertung von Konzept und Implementation des Prototyps zum Ziel.
Schlussendlich werden in der Zusammenfassung ein Fazit und Ausblick (Kapitel 7) auf weitere Forschung gegeben.

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

G-code is considered a “dumb” language as it only documents instructional and procedural data, leaving most of the design information behind. G-code programs are also hardware dependent, denying modern CNC machine tools desired interoperability and portability @Xu2006a.

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

Alternative: Woopsa (http://www.woopsa.org/)

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

Die Verbindung von Überwachung und Kontrolle technischer Systeme mündet in Paradigmen, die Realität und virtuelle Umgebungen miteinander verschmelzen lassen.
So wurde das Konzept cyber-physischer Systeme (CPS) 2006 durch Edward A. Lee erstmalig erläutert.
Er versteht diese als Integration von Informationsverarbeitung und physischen Prozessen.
Virtuelle und physische Abläufe werden durch Sensoren und Aktuatoren überwacht, beziehungsweise beeinflusst, stehen in unmittelbarer Wechselwirkung und sind durch Kontrollschleifen rückgekoppelt @Lee2006.
Zeit und Nebenläufigkeit der realen Welt sind Eigenschaften die durch Infrastruktur- und Informationsabstraktionen abgedeckt werden müssen @Wang2008.
Technologien wie Echtzeitbetriebssysteme, Middlewares und spezialisierte eingebettete Prozessorarchitekturen bilden den ersten Schritt zum Schließen dieser Lücke @Lee2006.
Dennoch ist vor allem die inhärente Heterogenität der Komponenten eine Herausforderung für bestehende Kontrollmechanismen, Kommunikationsmuster und Softwareparadigmen @Wang2008.

* Abbildung zu Autom.-Pyr. => CPS @VereinDeutscherIngenieuree.V.2013
* CPPS: @Siepmann2016

Im Kontext industrieller Produktionskontrolle ergeben sich neben den Herausforderungen für CPS (vgl. @Lee2008) weitere Anforderungen.
Die autonome Kontrolle von Produktionsprozessen mit Hilfe von Kontrollschleifen wird durch Sensoren und Aktuatoren entlang der Produktionskette und an den individuellen Maschinen unterstützt.
Dafür muss das Gesamtsystem in eigenständige Subsysteme mit gekapselten Rückkopplungsmechanismen gegliedert werden.
Kommunikation geschieht auf der Basis bestehender Infrastrukturen mit kabelgebundenen und kabellosen Übertragungstechnologien.
Die bisher eingesetzten Standards wurden auf der Prämisse homogener Teilnehmer entwickelt und müssen im Zusammenhang mit cyber-physischen Produktionssystemen (CPPS) überdacht werden.
Ein drahtloses Sensornetzwerk ist eine Ausprägung einer solchen Infrastruktur innerhalb derer die Kommunikationspartner mit unterschiedlicher Bandbreite und Zuverlässigkeit arbeiten müssen.
Weiterhin sind auf diesen Komponenten verteilte Echtzeitoperationen für Kontrollschleifen unerlässlich, wodurch das Design bestehender Netzwerkprotokolle oft in Frage steht.
So kann die Verarbeitung von Netzwerkpaketen, beziehungsweise deren Routing, Verifikation und Redundanz unvorhersehbar Zeit beanspruchen @Wang2008.

_Dual Reality_-Konzept ...

## Cloud Manufacturing und Fog-Computing

Bonomi 2012 @Bonomi2012  
Aazam 2016 @Aazam2016

Im WAN problematisch @Schlechtendahl2015 => OPC4Factory

## Zusammenfassung

# Anforderungen

Für die in @sec:zielsetzung aufgestellten Ziele, werden in diesem Kapitel die spezifischen Kriterien zu deren Erfüllung erläutert.

Informationssysteme in der Produktion dienen der Verbesserung der Wettbewerbsfähigkeit und müssen Innovations- und Zeitdruck standhalten. 
Moderne Produktionsumgebungen helfen Arbeitsabläufe zu optimieren und vereinfachen Beteiligten die Ausführung ihrer Arbeit.
Jedoch verhindern Altmaschinen aufgrund fehlender Infrastrukturanbindung (vgl. @Deshpande2011) die Vollautomatisierung dieser Arbeitsabläufe und erfordern die physische Anwesenheit einer Fachkraft @Wang2004.

## Steuerung {#sec:REQ1}

Um einen bestimmten Fertigungsschritt an einer numerisch kontrollierten (NC) Anlage durchzuführen, muss das auszuführende Programm übertragen werden.
Dafür wird dieses entweder mit einem Speichermedium auf den Steuerungs-PC kopiert oder direkt an dessen Terminal kodiert. 
Der zeitliche Aufwand und das notwendige Personal verlangsamen die Fertigung des Endprodukts und führen zu einer suboptimalen Fertigungsstrecke.
Für das Retrofitting der Anlage muss die entfernte numerische Kontrolle ermöglicht werden.
Weiterhin sind Produktionsmaschinen mit zusätzlichen automatisierten Komponenten wie Schließmechanismen für Schutztüren, Kühl-, Entlüftungs- oder Einspannsystemen ausgestattet.
Auch die Steuerung dieser muss ortsunabhängig sein, damit ein CPPS ganzheitlich in den Produktionsprozess eingreifen kann.

REQ1
: Die Kontrolle der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Übertragung, Ausführung und Abbruch von NC-Programmen, beziehungsweise produktionsbedingter Steuerbefehle, durch Subsysteme des CPPS erfolgen kann.

## Überwachung {#sec:REQ2}

Im Wartungs- und Störfall muss der Zustand der Anlage bekannt sein.
Dieser kann bei nicht integrierten Altmaschinen nur am Terminal eingesehen werden.
Ein Techniker muss die Betriebs- und Prozessdaten vor Ort erfassen um eine Diagnose stellen zu können und unter anderem das ERP-System darüber zu informieren.
Weiterhin kann eine cyber-physikalische Rückkopplungsschleife nicht autonom auf den Prozess wirken, wenn die Daten nicht im virtuellen Weltmodell vorliegen.

REQ2
: Die Überwachung von Betriebs- und Prozessdaten der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Zustandserfassung und Störfalldiagnose durch Subsysteme des CPPS erfolgen kann.

Die steigende Automatisierung zur Optimierung der Produktionsabläufe wird in einem CPPS durch Rückkopplung erreicht.
Mit den Einhalten der Anforderungen zu Überwachung und Steuerung hat das System die Möglichkeit automatisch auf veränderte Bedingungen zu reagieren.
Außerdem werden darauf aufbauende Konzepte wie Predictive Maintenance und Condition Monitoring ermöglicht.

## Standards {#sec:REQ3}

Nach Ferrolho et al. entstehen auch mit Netzwerkanbindung und Programmierschnittstellen noch zu überwindende Probleme @Ferrolho2007.
CNC-Maschinen basieren auf einer geschlossenen Architektur numerischer Kontrolle und sind nicht für die Integration mit anderen ausgelegt.
Die Kontrolleinheit der Anlage lässt die Steuerung von einem entfernten PC nicht zu.
Programmierumgebungen sind nicht ausreichend leistungsfähig um komplexe Aufgaben, wie die kollaborative Operation innerhalb einer flexiblen Fertigungszelle, zu entwickeln.
Unterschiedliche Hersteller verwenden eigene Programmiersprachen und Entwicklungstools, wodurch Integration und gemeinschaftliche Produktion erschwert werden.
Die sich damit ergebende Heterogenität der Anlagen einer Produktionsstrecke ist ein bereits betrachtetes Problem cyber-physikalischer Systeme (vgl. @Siepmann2016).
Im Falle proprietärer Schnittstellen und geschlossener Architekturen muss ein Adapter die Standardisierung von Protokollen und Informationen durchsetzen @Ayatollahi2013.

REQ3
: Standardisierte Informationsprotokolle und -modelle werden für die Integration heterogener Altmaschinen eingesetzt, so dass Datenaggregation und M2M-Kommunikation gesamtheitlich gewährleistet werden kann.

## Lokalität {#sec:REQ4}

CPPS müssen in geringstmöglicher Zeit Betriebs- und Prozessdaten der Maschine analysieren, bewerten und in den Produktionsprozess eingreifen können.
Die Synchronisation des virtuellen Modells der Realität wird jedoch durch stetig wachsende Datenvolumina aufgrund steigender Geräteanzahl erschwert.
Damit verlangsamt sich die Verarbeitung der Daten mit der geografischen Entfernung zwischen Gerät und System (vgl. @Bonomi2012).
Bei der Integration von Altmaschinen muss demnach die Datenanalyse, -persistenz und Historie, sowie die Reaktion auf dadurch erkannte Veränderungen möglichst nahe an der Anlage geschehen.
Läuft eine Rückkopplungsschleife direkt an der Maschine, muss außerdem nur ein Teil der anfallenden Daten veräußert und die Kontrolle nur teilweise an hierarchisch übergeordnete Systeme abgegeben werden @Bonomi2012.
Durch den verminderten Austausch zwischen den Systemen werden die Sicherheit der Daten verbessert und Kommunikationsfehler minimiert (vgl. @Wang2004).

REQ4
: Die Erfassung und Persistierung anfallender Betriebs- und Prozessdaten, sowie die Interpretation von Maschinenbefehlen geschieht geografisch nahe der Anlage, wodurch zeitliche Latenzen, Kommunikationsaufwände und -fehler minimiert werden.

Auch wenn die Zeit für die Kommunikation von Steuerbefehlen und Sensordaten durch die Nähe zur Maschine minimiert wird, ist Echtzeit kein Kriterium.
Es wird davon ausgegangen, dass die Interpretation und Ausführung der Maschinenbefehle, sowie die Aggregation der Daten, direkt an der Maschine geschieht.
Um in adäquater Zeit reagieren zu können, unterliegen die für CPPS erforderlichen Kontrollschleifen damit ebenfalls dem Lokalitätskriterium @Bonomi2012.

# Forschungsstand

Nach der Spezifikation der Zielvorgaben werden in diesem Kapitel der aktuelle Stand der Technik, sowie bereits bestehende Forschungsarbeiten zum Thema erläutert und mit den aufgestellten Kriterien für eine Lösung abgeglichen.

## Architekturen für CPPS

<!-- Purpose -->
Monolithische Architekturen sind ungeeignet für cyber-physische Systeme (CPS).
Durch die Aufteilung eines skalierenden ganzheitlichen Systems in Subsysteme entsteht ein _System of Systems_ (SoS).
@fig:wang-cps-architecture verbildlicht das Konzept der Systemkapselung und Verbindung einzelner Produktionskomponenten in einer Architektur für CPPS.

![CPS-Architektur nach Wang et al. @Wang2008](figures/wang-cps-architecture){#fig:wang-cps-architecture}

<!-- Design/Methodology/Approach -->
Diese von Wang et al. vorgestellte heterogene Struktur für Steuerungsnetzwerke besteht aus verschiedenen, miteinander verbundenen CPS-Einheiten welche sich wiederum aus Kontrolleinheiten für Subsysteme, Sensoren, Kameras und Aktuatoren zusammensetzen.
Einige der Komponenten kommunizieren nicht direkt mit Sensoren oder Aktuatoren, sondern stellen die Rechenleistung für die Ausführung der Anfragen anderer Systeme.
Dem gegenüber stehen unmittelbar mit dem Netzwerk verbundene Sensoren und Aktuatoren.
Der zentrale Aspekt dieser Architektur ist die _heterogene Netzwerkeinheit_ (HE).
Durch sie werden zeitliche und den Ausfall betreffende Probleme der Komponenten abstrahiert.  
<!-- Findings -->
Damit reduziert sich das Problem der Komplexität des Designs von CPS auf den Entwurf der HE, deren Verhalten und Latenz bezüglich notwendiger Kommunikationskriterien garantiert werden muss.  
Im Falle der Störung oder des Ausfalls einer HE und des damit verbundenen Bearbeitungsschritts der Fertigungsstrecke, kommt die Produktion nicht vollständig zum Stillstand.
Werkstücke oder Produkte können über alternative, autark agierenden Strecken umgeleitet werden @Wang2008.  
<!-- Research Implications/Limitations -->
Mit Fokus auf Garantien zu zeitlichem Verhalten und Zuverlässigkeit der Komponenten eines CPS, beschreiben Wang et al. eine generische Netzwerkarchitektur für moderne Produktionssysteme.
Jede zu steuernde Phase (_Stage_ in @fig:wang-cps-architecture) des Fertigungsprozesses ist mit einem eingebetteten Kontrollsystem versehen und kann damit autonom agieren.
Sensoren als Teil einer möglichen Rückkopplungsschleife sind vorgesehen, nicht aber Schwerpunkt des vorgestellten Konzepts.
Für Anwendungen der Industrie 4.0 muss die HE zur virtuellen Repräsentation abstrahiert werden.

<!-- Requirements -->
Die Anforderung zur ortsunabhängigen Steuerung (REQ1) kann durch diese Netzwerkarchitektur erfüllt werden.
Arbeitsteilig können die _Computing Units_ und _Stages_ (vgl. @fig:wang-cps-architecture) die Interpretation und Ausführung von NC-Programmen und automatisierten Komponenten übernehmen.
Die ortsunabhängige Überwachung der Maschine (REQ2), deren virtuelle Repräsentation als _Stage_ fungiert, wird durch Sensoren ermöglicht.
Es werden keinerlei Aussagen zu standardisierten Kommunikationsprotokollen oder Informationsmodellen getroffen, weshalb REQ3 zwar aufsetzend möglich, nicht aber vollends erfüllt ist.
Da auf die Persistenz von Betriebs- und Prozessdaten der Stages nicht eingegangen wird, ein eingebettetes Kontrollsystem aber Bestandteil der jeweiligen Phase ist, wird der Anforderung der Lokalität nicht vollständig entsprochen (REQ4).
Zusammenfassend kann das Konzept von Stages und Computing Units für die Lösung des Retrofitting-Problems übernommen werden.

## Zusammenfassung

Die Anforderungen werden in @tbl:sota-req zusammengefasst gegenübergestellt, wobei ● die Erfüllung, ◐ die eingeschränkte oder teilweise Erfüllung und ○ die Nichterfüllung symbolisiert.

+-----------+-----------+-------------+-----------+-----------+
|           | Steuerung | Überwachung | Standards | Lokalität |
+===========+===========+=============+===========+===========+
| @Wang2008 | ●         | ●           | ◐         | ◐         |
+-----------+-----------+-------------+-----------+-----------+
| @Wang2004 | ○         | ○           | ○         | ○         |
+-----------+-----------+-------------+-----------+-----------+

: Anforderungen bzgl. bestehender Forschungsarbeiten {#tbl:sota-req}

----

* _Wise-ShopFloor_ @Wang2004
* Control software for industrial CNC machines [@Ferrolho2005;@Ferrolho2007]
    - kein Standard bei Kommunikation
* Prototypischer OPC UA Server für Fernsteuerung @Ayatollahi2013
* Unterschied RetroNet @FraunhoferIPK2016 (TODO)
    - keine zentrale Datenhaltung

## Maschinendatenerfassung & -analyse

### Legacy Machine Monitoring Using Power Signal Analysis @Deshpande2011

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

__Problem:__ ein Sensor => zu wenig Infos  
__Lösung:__ verschiedene Sensoren (auch für Fusion) einsetzen

### Diss: In-process tool condition monitoring systems in CNC turning operations @Lee2006

* Purpose
    * Online Tool Condition Monitoring (TCM) bei CNC-Drehmaschinen mittels
        * Signal-Dekomposition
        * statischer Datenanalysen
        * neuronaler Netze
            * Untersuchung vieler versch. Netzwerkstrukturen => Optimierung für TCM
    * Schwerpunkt auf Analyse indirekter Messungen von Maschinensignalen
* Design/Methodology/Approach
    * Sensordaten durch Wavelet-Transformation in versch. Komponenten aufgeteilt, Quellen:
        * dreidimensionales Accelerometer
        * Schallemissionssensor
    * statistische Elimination maschinenspezifischer Effekte auf Sensordaten => Filter
    * statistische Signifikanzprüfung der Komponenten
    * Entwurf zweier Systeme basierend auf signifikanten Komponenten
        1. multipler linearer Regression
        2. künstlichen neuronalen Netzen
    * Fallstudie
* Findings
    * 12,6%ige Verbesserung der KNN-Vorhersagen durch Filter
    * 90% Genauigkeit bei multipler Regression
    * 97% Genauigkeit bei KNN
* Research Limitations/Implications
    * ausschließliche Betrachtung von TCM 
* Practical Implications
    * Reduktion von Maschinenstillstand durch verbesserte Vorhersage des Werkzeugausfalls
      * Minimierung von Ausschuss
      * Kostenreduktion
* Originality/Value
    * Umfassende Untersuchung aktueller Forschung zu MDE (Tabelle 2.1) und Entscheidungssystemen
    
### Machine-readable data carriers – a brief introduction to automatic identification and data capture @Furness2000

__Problem__: ausschließliche Betrachtung von TCM (Wartung) => Aber was wird wie bearbeitet?  
__Lösung__: Werkstückidentifikation/-erkennung für Verknüpfung operativer Schritte

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

### Zusammenfassung 

Ohne Carrier?

Data-Collection/Reasoning Stuff @Downey2016

Anfallende Daten zu
* Prozess
* Technologie (CAD/CAM)
* Werkzeug
* Werkstück
* Peripherie (_loading door_)

Kommunikation der Informationen via OPC UA, MTConnect, MQTT ansprechen

* Umfangreiche Recherchen zu bestehender Forschung durch @Teti2010
    * Werkzeugzustand
    * Spaneigenschaften
    * Prozesszustand
    * Werkstückbeschaffenheit

## Rechnergestützte numerische Steuerung

__Problem__: Wissen über operative Schritte und Werkstück verfügbar - Umsetzung der Schritte?  
__Lösung__: Kontrolle der Maschine

### An ARM-based Multi-channel CNC Solution for Multi-tasking Turning and Milling Machines @Grigoriev2016

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

[^cycle-time]: '[...] die Zeit, die ein Teilnehmer (slave) warten muß, bis er wieder "dran" ist.'
[^TRL]: [www.nasa.gov/directorates/heo/scan/engineering/technology/txt_accordion1.html](http://www.nasa.gov/directorates/heo/scan/engineering/technology/txt_accordion1.html)

### Remote real-time CNC machining for web-based manufacturing @Wang2004 

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

## Architekturen & Methoden für CPPS



* SOA [@Meyer2010;@Fallah2016a]
* MAS, Holonic [@Leitao2009;@Fallah2016]
* Blackboard [@Monostori2006;@Pauker2013]
* RAMI4.0 @Adolphs2015

### Information Architecture for Reconfigurable production systems @Pauker2013

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
    
### Prototype OPC UA Server for Remote Control of Machine Tools @Ayatollahi2013

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

### A systematic approach to OPC UA information model design @Pauker2016

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

## Zusammenfassung 

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

* TODO Projekte zusammenfassen & gegeneinander abgrenzen
* Schnittstellenproblematik immer Teil des Problems
* Entwicklung von Adaptern meist Standardlösung
* Kosten => Remote Maintenance?

# Konzeption

Durch steigende Rechenleistung sind ARM-Prozessoren auf Einplatinencomputern in der Lage Mehrachsmaschinen zu kontrollieren @Grigoriev2016.

* Laufzeitkonfiguration des Surrogate?
* Surrogate in bestehende Netzwerkinfrastruktur einbinden?
    1. direkte SG-Kommunikation (Wifi-Direct, BT, ...) zur Konfiguation der Netzwerkanbindung via Mobile device
      1. Auswahl des Access-Points
      2. Festlegen der OPC UA Discovery-Service Adresse
    2. SG mit Infrastr. verbunden + Registrierung bei Discovery-Service
    3. OPC UA Systemevent => neues Surrogate registriert
    3. Konfiguration des Adressraums via HTTP/WebApp

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
    * des Flow-Charts für die Server-Logik (teilweise)
* Persistenzkonzept: Blackboard? @Pauker2013
* Kontrolle der Arbeitssequenz? (PROtEUS, BPMN/Activiti)

Nach Rücksprache

* OPC UA zur Metamodellierung bzgl. der Machine
* OPC UA Modell synchron mit Realität => Laufzeitmodell
* Zu erwartendes Verhalten des physischen Systems über FB-Loop (MAPE-K) kontrollierbar => Modellierung/Sprache der _Regeln?_
* Elemente eines Frameworks mit Schichtenarch. im Client/Server-Stil
* Microkernel-Ansatz (Plugins für OPC UA Typen, Sensoren und Aktuatoren)
* FB-Loop intern oder extern?

OPC4Factory:

> OPC UA Server und ihre Informationsmodelle repräsentieren alle für die Automatisierungs-aufgaben erforderlichen Komponenten der angeschlossenen Maschinen und Roboter (Ladetüren, Spannmittel, Werkzeuge, NC-Programme etc.) mit ihren Attributen, Ereignissen und Methoden. Die Kommunikation auf dieser Ebene __erfordert keine Echtzeitfähigkeit__, da Steuerungsaufgaben mit Echtzeitanforderungen ausschließlich innerhalb der Maschinen- bzw. Robotersteuerung abgewickelt werden.

* Statusreport: Referenzarchitekturmodell Industrie 4.0 (RAMI4.0) => **Abb. 9 I4.0-Komponente** @Adolphs2015 
* Kruchten 4+1?
* arc42?

## Virtuelle Maschinenrepräsentation

* Service-/Protokolllayer (OPC UA)
* CPS-Layer, Hardwareanbindung
* 

## Kommunikations- & Informationsmodell

@Pauker2013 Komponentengranularität bis zur Achse (intelligente Maschinenteile)

## Systemintegration

## Zusammenfassung

# Implementation

* Smoothieboard als Maschinen-Adapter
    - Nachteil: Beobachten des Prozessfortschritts langsam (_progress_) => kann nicht in online-FB einbezogen werden
* open62541 oder ähnliche OPC UA Stack-Implementierungen für Server auf Pi

## Zusammenfassung

# Evaluation

These/Behauptung?
* Steigerung des Automatisierungsgrads durch Feedbackloop
* physische Anwesenheit des Werkers technisch überwinden (Remote-Control/-Programming)
* Laufzeitmodell für _online_-Monitoring

Umsetzung?
* Proof of concept
* Case-Study mgl.?
* HIL-Simulation?

Blocking Factors/mögliche Kritik?
* Leistung von embedded computing devices => siehe @Grigoriev2016
* Energieverbrauch

## Zusammenfassung

# Zusammenfassung

## Schlussfolgerung

## Ausblick

* MDSD mit @Pauker2016
* CNC ersetzen durch STEP-NC? [@Suh2003;@Xu2006;@Xu2006b;@Xu2006a]
* Prozessmodell für Abstrakte Leitebene
* Wo läuft die Logik für orchestrierende Steuerung? (OPC UA Clients)
* Surrogate als reaktiver Agent => Einbindung in MAS denkbar
* Möglichkeiten des Nutzens der Daten
    * Welcher G-Code Befehl korrelliert auf welche Weise mit welchen gemessenen Werten?
    * Automatische Erkennung von Gut-/Schlechtteilen
