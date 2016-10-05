
<!--

Feedback Zwischenverteidigung:

* Ihlenfeld: SPS Erwähnen (neben CNC), Diss: Möbius, vorbeikommen!
    - SPS abstrahiert Aktuator + Intelligenz => IBH Link UA
    - Im SPS-Programm kann man direkt SPS-Client-Funktionen aufrufen. Dies ermöglicht der S7-SPS mit Steuerungen anderer Hersteller über OPC UA zu kommunizieren. (http://www.sps-magazin.de/?inc=artikel/article_show&nr=92951)
* Sebastian: Regelbasierte Rückkopplung muss => Abgrenzung!! Eigensch. CPS
* Surrogate ist standardisierendes Element => CPS-Adapter
* Surrogate-Abb. was passiert hinter der Netzwerkschnittstelle (UCs)
    - Plug & produce is a major use case for cyber-physical production systems (CPPS) @Otto2014
* Human in the Loop?
* Kann ich die Sensordaten einfach übernehmen? 
* Orchestrierung? Überall Siemens Systeme => Was nun?

-->

# Einleitung

Seit der Mitte des 18. Jahrhunderts ist die industrielle Fertigung in stetigem Wandel.
Mit der Entwicklung dampfgetriebener Arbeits- und Kraftmaschinen um 1750 wurde die erste industrielle Revolution eingeleitet.
Zum Ende des 19. Jahrhunderts ermöglichten die Einführung arbeitsteiliger Massenproduktion und wissenschaftlicher Betriebsführung das erste Transportband in der fleischverarbeitenden Industrie.
Knapp einhundert Jahre nach dieser zweiten Revolution, wurden 1969 erste speicherprogrammierbare Steuerungen (SPS) zur variantenreichen Serienproduktion eingesetzt.
Informations- und Kommunikationstechnologie sind seither der Grundstein automatisierungsgetriebener Rationalisierungen.
Im Jahr 2011 wurde ausgehend von _Lean Production_ der Begriff _Industrie 4.0_ geprägt, der die vierte Industrielle Revolution beschreibt (vgl. zu diesem Abschnitt [@Gausemeier2014]).
Sie zeichnet sich durch neue Ansätze wie das _Internet of Things_ (IoT) und cyber-physische Systeme (CPS) im Kontext industrieller Produktion aus @Siepmann2016.

## Motivation

Vor der vierten Revolution war klassische Produktionssteuerung zentralisiert und Steuerungstechnik monolithisch strukturiert.
Zukünftig wird die Fertigung in cyber-physische Systeme von Systemen zerlegt und mit offenen Standards dezentral betrieben (vgl. zu diesem Absatz @Milberg2014).  
Moderne Produktionseinrichtungen beherbergen jedoch Maschinen jeden Alters, die zu einem gemeinsamen System verwachsen müssen.
Die Technologie zur numerische Kontrolle von Werkzeugmaschinen existiert bereits seit den frühen 1950er Jahren @Liang2004.
Gerade diese älteren Anlagen besitzen häufig keine Möglichkeit der Integration in die IT-Systeme einer künftigen Fertigungsstrecke @Wang2004.
Das schlichte Ersetzen dieser Altmaschinen ist aufgrund hoher Kosten meist keine Lösung @FraunhoferIPK2016.  
Jedoch behindern diese vorrangig die nahtlose Machine-To-Machine (M2M) Kommunikation durch fehlende Infrastrukturanbindung, womit die Kette von Bearbeitungsschritten für ein Produkt zahlreiche manuelle Eingriffe erfordert.  
Vor einigen Jahren wurden bis zu 60% der Arbeitszeit eines Werkers auf die Übertragung des Entwurfs eines Fertigungsschrittes in die Umsetzung an der Maschine verwendet @Gunasekaran2000.
So besitzt eine Altmaschine als Teil des Fertigungsprozesses keine Möglichkeit externer Kommunikation und kein _Application Programming Interface_ (API) @Deshpande2011.
Bei jüngeren Konstruktionen treten Integrationsschwierigkeiten an anderer Stelle auf.
So sind selbst bei bestehender Netzwerkfähigkeit geschlossene Soft- und Hardwarearchitekturen und fehlende Schnittstellen verantwortlich für eingeschränkte Überwachung und Steuerung, respektive für die Verhinderung von ökonomisch sinnvoller Automatisierung (vgl. zu diesem Absatz [@Deshpande2011;@Ferrolho2007]).
Weiterhin erschweren die unzureichende Umsetzung von Industriestandards und -normen die Integration der Maschinen [@Wang2004;@Hoppe2014].

Technische Komponenten, wie eine Netzwerkanbindung, sind nicht die einzigen Barrieren moderner Produktionsautomatisierung.
Fehlerbehaftete Kommunikationsmechanismen, sowie die Gefahr der Veräußerung betriebsinterner Daten, sind Probleme die heute gelöst werden können.
Auch erfordern sinkende Losgrößen und steigende Produktvariabilität eine flexible Automatisierung von Echtzeitüberwachung und -kontrolle verteilter, rekonfigurierbarer Fertigungssysteme (vgl. zu diesem Absatz [@Wang2004;@Lay2001]).  
Produktionseinrichtungen basierten bisher auf dem manuellen Sammeln und Verteilen von Daten für Überwachung, Steuerung und Wartung der Maschinen.
Doch gegenüber hohen Kosten, menschlichen Fehlern, dem teilweise schlechten Zugang zur Anlage und Aspekten der Datensicherheit, sind Automatisierungslösungen heute günstig, sicher und attraktiv für die Fertigungsindustrie (vgl. zu diesem Absatz @Deshpande2011).

## Zielsetzung {#sec:zielsetzung}

Nach der Motivation und der damit einhergehenden Identifikation des Kernproblems, werden nun die Ziele dieser Arbeit beschrieben.
Den Schwierigkeiten in der industriellen Praxis wird wie folgt begegnet:

* Durch die entfernte Kontrolle einer Altmaschine werden manuelle Tätigkeiten wie das Übertragen eines Maschinenprogramms gemindert.
  Der operative Einsatz einer vormals nicht integrierten Anlage kann damit stärker automatisiert werden und beschleunigt den übergeordneten Produktionsablauf.
* Die zentrale Auswertung von Prozessdaten ermöglicht einen gesamtheitlichen Einblick in die Produktion, wobei jene Daten nicht notwendigerweise zentral zu persistieren sind.
  Diagnosen geschehen damit nicht mehr vor Ort, wodurch Wartungszyklen besser überprüft und eingehalten werden können.
  In der Konsequent wird außerdem die Planung der Fertigung vereinfacht und die Zeit bis zur Produktion gesenkt.
  Weiterhin sollen Störfälle wie Werkzeugbruch und -wechsel ad hoc an Verantwortliche kommuniziert werden.

Im Kontext dieser Arbeit gilt eine Anlage als _integriert_, wenn die infrastrukturelle Einbettung in ein cyber-physisches Gesamtsystem den Anforderungen (vgl. Kapitel 3) genügt.
Neben den praktisch orientierten Vorgaben wird die Forschung zur Anlagenmodernisierung für die  Industrie 4.0 durch weitere Ziele unterstützt:

* Eine dezentrale Informations- und Kommunikationsarchitektur verbessert die Resilienz, Produktionsstabilität und Skalierbarkeit von verteilten Fertigungssystemen.
* Kommunikationskanäle zwischen einzelnen Maschinen werden aufgrund durchgängig offener Schnittstellen nicht mehr unterbrochen. 
  Durch damit einheitlich mögliche _Machine-To-Machine_ (M2M) Kommunikation wird die Kontrolle und Überwachung hierarchisiert und dezentralisiert. 
* Die Modellierung von Komponenten und Funktionalität einer Maschine wird durch Standardentwicklungswerkzeuge und -austauschformate vereinfacht.
* Das Optimierungspotential der Gesamtanlage kann durch statistische Auswertung der anfallenden Daten zu Maschinenoperation und -auslastung ausgeschöpft werden.
 
Die Hierarchisierung von Kontrolle und Überwachung bezieht sich auf das Beispiel der flexiblen Fertigungszelle in denen ein Verbund von Maschinen eine gemeinsame Aufgabe bearbeitet (vgl. @Groover2008).
Innerhalb eines solchen Verbunds wird zunehmend über Ethernet kommuniziert, wodurch eine Basis für die TCP/IP Protokollfamilie zur Verfügung steht.

> "Aktuell sind nach einer Studie der Fachhochschule Südwestfalen 86% der 
> SPS-Systeme über Ethernet angebunden, wobei von den verbleibenden 
> 14% der Befragten 6% angaben, Ethernet wahrscheinlich in Zukunft einzusetzen." @Windmann2015[^QuelleWindmann2015]

[^QuelleWindmann2015]: ursprüngliche Quelle: _M. Rothhöft, "Marktstudie: Industrielle Kommunikation,", VDMA, 2013_.

Um nun die Ziele im Rahmen dieser Arbeit effektiv erreichen zu können, unterliegen Konzept und Implementierung verschiedenen Einschränkungen und Voraussetzungen.
<!-- TODO evtl. Szenario aus Borangiu 2014 oder so... -->
Eine Ethernet-basierte Netzwerkinfrastruktur erlaubt das Einbinden eines virtuellen Maschinenabbilds in die Fertigungsstrecke.
Zugang zur Anlage, regelungstechnische Modifikationen und das Anbringen von Sensorik und Aktuatoren sind gegeben.
Die zu modernisierende Werkzeugmaschine wird durch rechnergestützte numerische Steuerung (CNC) kontrolliert.
Automatisierte Maschinenkomponenten, wie Einspannvorrichtungen oder Schutztüren, sind an eine Speicherprogrammierbare Steuerung (SPS) gekoppelt.
Einplatinencomputer sind ausreichend leistungsfähig für die Steuerung und Überwachung von CNC-Maschinen @Grigoriev2016.

Auch ist das vorgestellte Konzept der Anlagenmodernisierung auf diskrete Fertigung mit bestehender Netzwerkinfrastruktur beschränkt.
Unter Berücksichtigung der besprochenen Ziele und Einschränkungen, wird eine konzeptuelle und prototypische Lösung durch die folgenden Schritte erreicht. 

1. Ermitteln der Anforderungen für eine Integration von Altmaschinen in moderne, verteilte Produktionsumgebungen -- im Folgenden als Retrofitting bezeichnet.
2. Recherchen zum heutigen Stand der Technik und die Einbeziehung vorhandener Systeme.
3. Konzeption einer virtuellen Repräsentation als Schnittstelle der zu integrierenden Anlage.
4. Ermöglichen von dezentraler Kontrolle und Überwachung im Hinblick auf cyber-physische Produktionssysteme. 
    - Transfer und Ausführung von Maschinenprogrammen.
    - Erfassen von Produktionsdaten durch angeschlossene Sensoren.
    - Verifikation automatischer Aktionen durch Rückkopplung.
5. Vorstellung eines skalierenden, erweiterbaren Frameworks.
6. Eine prototypische Implementierung belegt die prinzipielle Durchführbarkeit.

**Retrofitting** ist nicht nur die Integration von Altmaschinen.
Im Rahmen dieser Arbeit gilt die Definition von Bergweiler, nach der Retrofitting die Erweiterung des Equipments einer Anlage durch zusätzliche Hardware meint.
Der funktionale Umfang einer Maschine wird durch neue Module für die Übertragung und verteilte Verarbeitung der Daten ausgebaut.
Dadurch wird die Kommunikation zwischen individuellen Geräten und Produkten der Fertigung ermöglicht, bis die Fabrik den künftigen Standards, Direktiven und Prinzipien der Industrie 4.0 genügt @Bergweiler2015.

Nach Klärung der Ziele, Beschränkung des Konzepts und dem Aufzeigen eines groben Lösungswegs werden in dieser Arbeit folgende Fragen zu beantworten sein.

> Welchen softwaretechnologischen Konzepten muss die Modernisierung und der infrastrukturelle Kontext einer Altmaschine unterliegen, um eine ganzheitliche Integration in cyber-physische Produktionssysteme (CPPS) gewährleisten zu können?
> 
> 1. Welche System- und Softwarearchitektur ist für ein flexibles Retrofitting zur Steuerung und Überwachung veralteter CNC-Maschinen im Kontext von CPPS geeignet?
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

Für diese Arbeit relevante Technologien und Konzepte werden in folgendem Kapitel erläutert.
Grundlegende Eigenschaften von Fertigung und Automatisierung sind die Basis für das Verständnis von semantischen Informationsmodellen, respektive dem virtuellen Abbild der Realität.
Durch dieses Modell ist ein System in der Lage die Produktion und deren Schritte zu überwachen, Differenzen zu erwartetem Verhalten festzustellen und autonom darauf zu reagieren.

## Fertigung und Automatisierung {#sec:fertigung}

Fertigung, als Unterbegriff der Produktion, beschreibt Verfahren zur Umwandlung oder Erzeugung von Stoffen mit Hilfe von Energie und Informationen innerhalb eines Prozesses @Linke2015. 
Automatisierung ist "das Ausrüsten einer Einrichtung, so dass sie ganz oder teilweise ohne Mitwirkung des Menschen bestimmungsgemäß arbeitet" (DIN 19233[^automatisierung]).
Eine Verknüpfung dieser beiden Konzepte ist in @fig:fertigungsautomatisierung dargestellt.
Die Rückkopplung von Prozessdaten in eine Automatisierungseinrichtung befähigt das System, unter Berücksichtigung von Zielen, steuernd auf die Fertigung zu wirken.
Direkte Eingriffe in den Prozess, sowie dessen Beobachtung durch den Menschen, werden verringert - im ökonomischen Zusammenhang rationalisiert (vgl. zu diesem Absatz @Linke2015).

![Automatisierte Fertigung aus @Linke2015](figures/fertigungsautomatisierung){#fig:fertigungsautomatisierung}

Um die verschiedenen Bereiche der klassischen[^klassische-autom] Automatisierung darzustellen, wird eine Schichtenorganisation herangezogen.
Die Struktur eines Unternehmens entspricht dann einer Automatisierungspyramide.
Unterschieden werden diese Ebenen aufgrund der unterschiedlichen Anforderungen an Datendurchsatz und Übertragungsgeschwindigkeit (vgl. zu diesem Absatz @Linke2015).
Die Ebenen des Beispiels der @fig:automatisierungspyramide erläuterte Linke wie folgt:

* **Unternehmensleitebene**  
  Marktrelevante Unternehmensprozesse, wie Unternehmensführung, Personal-, Investitions- und Produktionsplanung, finden unter Zuhilfenahme eines Systems für Enterprise Resource Planning (ERP) befinden sich auf dieser Ebene.
* **Betriebsleitebene**  
  Prozesse wie Auftragsbearbeitung und Produktionsplanung, Terminüberwachung und Kostenanalyse sichern auf dieser Ebene den täglichen Fertigungsbetrieb eines Unternehmens.
  Die softwareseitige Unterstützung übernimmt beispielsweise ein Manufacturing Execution System (MES).
* **Prozessleitebene**  
  Je nach Größe der Anlage wird in detaillierteren Ebenen die Steuerung und Regelung von Produktionsprozessen und deren Überwachung vollzogen.
  Verbindungen, wie die zwischen einzelnen Fertigungszellen, werden auf dieser Ebene abgebildet.
* **Steuerungs- & Feldebene**  
  Aktuatoren und Sensoren und deren Schnittstelle zu Ein- und Ausgangssignalen befinden sich auf der Feldebene.
  Die von diesen Komponenten konsumierten, beziehungsweise erfassten Daten, werden auf der Steuerungsebene mit dem Prozess verbunden.
  Daraus entstehende Information werden in die Reaktion des Systems einbezogen, wodurch minimale Latenzen in der Übertragung notwendig sind.

![Beispiel einer klassischen Automatisierungspyramide[^automatisierungspyramide]](figures/automatisierungspyramide){#fig:automatisierungspyramide}

Auf der Prozessebene (Level 0) des Beispiels geschieht die physikalische Fertigung des Produkts.
Dabei fallen große Mengen von Rohdaten an, die in jeder folgenden, höheren Schicht zu abstrakteren Informationen verarbeitet werden.
Die Toleranz bezüglich der Übertragungsgeschwindigkeit ist auf diesen unteren Ebenen am geringsten.
Speicherprogrammierbare Steuerungen (SPS, vgl. @sec:sps) und numerische Kontrolle (NC, vgl. @sec:nc) erhalten Befehle in Echtzeit und automatisieren den Produktionsablauf.
Über einen Feldbus (vgl. @sec:kommunikation) werden diese Instruktionen und Messdaten an ein Supervisory Control and Data Acquisition (SCADA) System gekoppelt.
Derlei Systeme sind verantwortlich für die Überwachung und Steuerung technischer Prozesse und kontrollieren die übergeordnete Fertigungszelle, respektive Verbünde von Werkzeugmaschinen, Robotern und automatisierten Komponenten @Linke2015.
Ein MES, beziehungsweise Fertigungsmanagementsystem bildet dann die Schnittstelle zum Ressourcenmanagementsystem (ERP) der Unternehmensleitebene.

[^automatisierung]: Deutsches Institut für Normung e.V.: DIN V 19233: Leittechnik, Prozessautomatisierung, Automatisierung mit Prozessrechensystemen, Begriffe.
[^automatisierungspyramide]: Darstellung durch Wikipedia-Nutzer [UlrichAAB](https://de.wikipedia.org/wiki/Benutzer:UlrichAAB).
[^klassische-autom]: Automatisierung vor der vierten industriellen Revolution.

### Kommunikation {#sec:kommunikation}

In der industriellen Fertigung werden Feldbusse als Kommunikationskanal in Feld- und Steuerungsebene genutzt.
Neben dem Feldbus existieren weitere, teils veraltete Kommunikationskanäle, die zu der in @fig:automationsstruktur dargestellten, heterogenen Automationsstruktur führen.

![Repräsentative Automationsstruktur nach @Hammerstingl2015](figures/automationsstruktur){#fig:automationsstruktur}

Hammertringl und Reinhart fanden vier Klassen von Kommunikationssystemen in dieser durch eine Befragung ermittelten Struktur.
Sensoren und Aktuatoren der ersten Klasse sind direkt verbunden und übermitteln binäre oder analoge Informationen rein physikalischer Natur, wie Strom mit 24V oder Druckluft.
Sie stellen keine standardisierte, digitale Beschreibung ihrer Funktion bereit, wodurch dem angeschlossenen Gerät diese händisch mitgeteilt werden muss.  
Feldgeräte mit _IO-Link_[^iolink]-Fähigkeit können durch die IO Device Description (IO-DD) beschrieben werden und sind Teil einer zweiten Klasse mit Direktverbindung.
Innerhalb dieser können minimale Protokolle beschrieben und die Identifikation der Komponenten durchgeführt werden.
Dadurch kann innerhalb dieser Klasse extern parametriert und eine maschinenlesbare Beschreibung übertragen werden.
Letzteres wird in der Praxis jedoch kaum genutzt.
Ein weiterer, stark verbreiteter Repräsentant ist die serielle Schnittstelle RS-232.  
Die dritte Klasse von Kommunikationssystemen verbindet Bus-basierte Geräte.
Traditionelle Bussysteme und Real-Time Ethernet (RTE) sind Stand der Technik und erlauben die Definition der Strukturen durch einen Bus-Master.
Bildverarbeitungssysteme, ihre Protokolle (z.B. GigE Vision[^gigevision]) und Beschreibungssprachen (z.B. GenICam[^genicam]) sind hier verbreitet.
Für Konfiguration und Überwachung der Systeme wird eine Mensch-Maschine-Schnittstelle (MMS) eingesetzt (vgl. zu diesem Absatz @Hammerstingl2015).

Feldbusse sind digitale bidirektionale, serielle Kommunikationsnetzwerke für echtzeitfähige, verteilte Kontrolle von Instrumenten, Steuerungseinheiten und Aktuatoren @Mahalik2003.
Trotz der Standardisierungsbemühungen durch IEC 61158, existieren unterschiedliche Feldbusse wie CAN, ProfiBUS oder EtherCAT.
Jeder Hersteller von Maschinen, Robotern und automatisierten Komponenten stellt einen anderen Busstandard, weshalb die Kommunikation der Geräte nicht garantiert werden kann.
Für deren Verbindung mit unterschiedlichen Systemen wird ein Adapter benötigt, wodurch der Aufwand bezüglich Bereitstellung und Konfiguration steigt (vgl. zu diesem Absatz @Pauker2013).

Auf den höheren Ebenen der Automatisierungspyramide (vgl. @sec:automatisierungspyramide) etablierte sich das nicht Echtzeit-fähige Ethernet.
Dennoch verbreitet sich die Variante des RTE zunehmend auch auf den unteren Ebenen (vgl. @sec:zielsetzung) und erlaubt Kommunikation mit Remote Procedure Calls (RPC), TCP/IP-Sockets und OPC (ursprünglich OLE[^ole] for Process Control, vgl. @sec:opcua) @Pauker2013.
Die Homogenisierung der Infrastruktur, vom Ressourcenmanagement im ERP über die Speicherprogrammierbare Steuerung bis zum einzelnen Sensor auf der Feldebene, vereinfacht den Informationsaustausch und trägt zur Flexibilisierung des Gesamtsystems bei.
Weiterhin stehen damit die Daten aller Schichten für jeden anderen Netzwerkteilnehmer zur Verfügung.

Diese Form der Kommunikations- und Informationsstruktur ist nach Hammerstingl und Reinhart in einer vierten Klasse zu finden.
@fig:automationsstruktur zeigt OPC und OPC UA (vgl. @sec:opcua) als Standard für den Datenaustauch zwischen dem Produktionsplanungssystem (PPS) und den speicherprogrammierbaren Steuerungen (SPS, vgl. @sec:sps).
Mit dieser Technologie stellen Geräte aktiv ihre virtuelle Beschreibung bereit, was durch die Hersteller unterstützt und vorangetrieben wird (vgl. zu diesem Absatz @Hammerstingl2015).

[^ole]: Object Linking and Embedding
[^iolink]: Implementierung IEC TR 61131-9, Single-drop digital communication interface for small sensors and actuators
[^gigevision]: Schnittstellenstandard industrieller Bildverarbeitung
[^genicam]: Schnittstellenstandard für industriell eingesetzte Kameras

### Numerische Kontrolle {#sec:nc}

<!-- 
Alternativen

* STEP-NC [@Hardwick2007;@Xu2006]
* IEC 61499 Function Blocks
-->

### Speicherprogrammierbare Steuerungen {#sec:sps}

<!--
> Die Anbindung der SPS an die Maschine bzw. Anlage erfolgt mit Sensoren und Aktoren.
> Hinzu kommen Statusanzeigen. Die Sensoren sind an die Eingänge der SPS geschaltet 
> und vermitteln der SPS das Geschehen in der Maschine oder Anlage. (Wikipedia)

Im Grunde sind SPS aktiv handelnde Abstraktionen von Zusammenschlüssen zwischen Sensoren und Aktuatoren.

-->


<!--
![Grundstruktur flexibler Automatisierung @Linke2015](figures/grundstruktur-der-flexiblen-automation)

G-code is considered a “dumb” language as it only documents instructional and procedural data, leaving most of the design information behind. G-code programs are also hardware dependent, denying modern CNC machine tools desired interoperability and portability @Xu2006a.

Hersteller von Software für _Supervisory Control and Data Aquisiton_ (SCADA) verwalten eine große Anzahl an Kommunikationstreibern für unterschiedliche Automatisierungs- und Informationssysteme.
Außerdem erschweren verschiedene Kommunikationsprotokolle und Nachrichtenformate die Integration zusätzlicher Systeme @Ayatollahi2013.

Industrie 4.0 @Durisin2009
-->

## OPC Unified Architecture {#sec:opcua}

Der Austausch und die Modellierung von Daten kann in einem heterogenen Technologieraum nur durch standardisierte Beschreibungssprachen, Kommunikationsprotokolle und Modelle erreicht werden.
Diese Aussage wird im Zusammenhang mit Industrie 4.0 durch eine Tendenzbefragung von BITKOM, VDMA und ZVEI aus dem Jahr 2013 gestützt.
So sehen Mitarbeiter aus 278 Unternehmen, des Maschinen- und Anlagenbaus, Standardisierung als größte Herausforderung für die Umsetzung von Industrie 4.0 @Kargermann2013.  
Die OPC[^opc] Foundation ist ein Industriekonsortium, das für Entwicklung und Wartung solcher Standards verantwortlich ist.
Sie schuf Interoperabilitätsstandards für den sicheren und zuverlässigen Austausch von Daten im Automatisierungsraum industriell produzierender Unternehmen auf Basis des _Distributed Component Object Model_ (DCOM).
Dieses ist ein von Microsoft definiertes System für entfernte Methodenaufrufe (Remote Procedure Calls, RPC) innerhalb eines Windows-Ökosystems, das für die heutigen heterogenen Informationssysteme ungeeignet ist.
Neben der Plattformunabhängigkeit ist die Zusicherung des nahtlosen Übergangs von Informationen, zwischen Geräten unterschiedlicher Hersteller, die Hauptaufgabe querschnittlicher Spezifikationen im Kontext der _OPC Unified Architecture_ (OPC UA)[^opc-def].
Das Konsortium berücksichtigte bei der Spezifikation folgende Ziele @OPCFoundation2014.

* sicherer, zuverlässiger Informationsaustausch
* Plattform- und Herstellerunabhängigkeit
* standardisierte Kommunikation über Internet und Firewalls
* serviceorientierte Architektur (SOA)
* Schutz vor unerlaubtem Zugriff
* Erreichbarkeit und Zuverlässigkeit
* Vereinfachung durch Vereinheitlichung

Konkret bietet die OPC UA (auch IEC 62541) einen semantischen Kommunikations- und Datenmodellierungsstandard für den Informationsaustausch @Ayatollahi2013.
Ein erweiterbares Meta-Modell spezifiziert die Grundbausteine und Regeln für ein Informationsmodell und beinhaltet verschiedene Einstiegsknoten und Basis-Typen @OPCFoundation2014.
Informationsmodelle sind Repräsentationen von Konzepten, Relationen, Beschränkungen, Regeln und Operationen zur Spezifikation der Bedeutung (Semantik) von Daten innerhalb einer bestimmten Domäne @Lee1999.
Diese werden von Maschinen, Baugruppen und anderen Ressourcen im Adressraum angeboten, wodurch jede Entität innerhalb eines IT-Ökosystems mit der jeweilig anderen kommunizieren kann und deren strukturelle Eigenschaften kennt.

![Spezifikationen von OPC UA](figures/opc-ua-architecture "OPC UA Übersicht"){#fig:opc-ua-architecture}

In @fig:opc-ua-architecture ist die dafür notwendige Informationsstruktur dargestellt @OPCFoundation2014.
Auf der untersten Ebene werden Transportprotokolle, das Meta-Modell und grundlegende Services beschrieben.
Das bevorzugte Protokoll setzt auf TCP/IP auf und erlaubt einen performanten Austausch von beispielsweise Geräte-, Sensor-, Maschinen- und Prozessdaten innerhalb einer Client-/Server-Architektur.
Eine für die Kommunikation über Firewalls taugliche Methode bietet die im Standard verankerte HTTP/XML-Schnittstelle.
Durch einen Discovery-Mechanismus können Funktionen und Eigenschaften von OPC-UA-fähigen Teilnehmern in einem Subnetz bekannt gegeben werden.
Doch auch Dienste für Ereignisregistrierung oder Sitzungsmanagement sind Teil der elementaren Definitionen.
Eckpfeiler dieser Basis von OPC UA sind Fehlertoleranz und Sicherheit als zentrale Aspekte der Spezifikation.
Auf Details zur Sicherheitsinfrastruktur wird in dieser Arbeit nicht eingegangen.
Darauf aufbauend werden generische Informationsmodelle definiert, die unter anderem den Adressraum eines Servers repräsentieren @OPCFoundation2014:

* **Data Access (DA)**  
  Daten zur Automatisierung werden durch das Data Access Modell strukturiert.
  Sowohl analoge und diskrete Variablen, als auch Einheiten und Qualitätsattribute werden hier beschrieben.
  Sensoren, Steuerungen und Regler sind beispielsweise Quellen jener Variablen.
* **Alarms and Conditions (AC)**  
  Die Behandlung von Dialogen und Alarmen wird mit diesem Modell definiert.
  Events, beziehungsweise Ereignisse auf die sich Clients registrieren, werden durch Veränderungen im Zustand eines Geräts ausgelöst.
* **Historical Access (HA)**  
  Historische Variablenwerte und Events werden mit diesem Modell dargestellt.
  Die Persistenz dieser Daten ist konfigurierbar. 
* **Programs**  
  Komplexe Aufgaben werden durch Programme repräsentiert und mit Zustandsautomaten beschrieben.
  
Viele bereits existierende Modelle, wie MTConnect, PLCopen, FDI und ISA95, unterscheiden sich von OPC UA durch fehlende Erweiterbarkeit.
Semantische Zusammenhänge lassen sich oft nicht ohne weiteres darstellen, wie Hoppe schrieb @Hoppe2014:

* Wie geben sich z. B. ein "Temperatursensor" oder eine "Ventilsteuerung" zu erkennen?
* Welche Objekte, Methoden, Variablen und Ereignisse definieren die Schnittstelle für
  Konfiguration, Initialisierung, Diagnose und Laufzeit? 

Die Erweiterbarkeit des Informationsmodells von OPC UA (vgl. @fig:opc-ua-architecture) ermöglicht _Companion Specifications_, die diesen Mangel ausgleichen und zusätzlich domänenspezifische Definitionen erlauben.
Plattformunabhängigkeit wird durch frei verfügbare, aber auch proprietäre Implementierungen des Softwareinfrastruktur-Stacks ermöglicht.
Ein API, Codegeneratoren für den Adressraum und Entwicklungswerkzeuge werden für die Programmiersprachen Ansi C/C++, .NET, Java und weitere durch die OPC Foundation bereitgestellt.

[^opc]: Open Platform Communications
[^opc-def]: nach [opcfoundation.org/about/what-is-opc](https://opcfoundation.org/about/what-is-opc/) vom 23.09.2016

## Cyber-physische Produktionssysteme

Die Verbindung von Überwachung und Kontrolle technischer Systeme mündet in Paradigmen, die Realität und virtuelle Umgebungen miteinander verschmelzen lassen.
So wurde das Konzept cyber-physischer Systeme (CPS) 2006 durch Edward A. Lee erstmalig erläutert.
Er versteht diese als Integration von Informationsverarbeitung und physischen Prozessen.
Virtuelle und physische Abläufe werden durch Sensoren und Aktuatoren überwacht, beziehungsweise beeinflusst, stehen in unmittelbarer Wechselwirkung und sind durch Kontrollschleifen rückgekoppelt @Lee2006.
Der historische Weg, hin zu darauf aufsetzenden Systemen, ist in @fig:cps dargestellt[^abb-cps].

![Der historische Weg zu CPSoS](figures/cps){#fig:cps}

[^abb-cps]: @fig:cps und folgender Absatz nach Vortrag _Life with Cyber-Physical Systems_ von Prof. Dr. Uwe Aßmann, 29. Juni 2016, Technische Universität Dresden

Im konventionellen Computing ([@fig:cps]a) sind Systeme der physischen Welt durch abstrakte Modelle repräsentiert. 
Berechnungen bezüglich der Realität werden in Simulationen auf diesen Modellen durchgeführt.
Durch eingebettete Systeme (ES, [@fig:cps]b) wird der Computer in das Realweltobjekt integriert, wodurch Berechnungen in die physikalischen Systeme getragen werden.
Mit CPS ([@fig:cps]c) existiert nicht nur ein passives Modell des Realweltsystems.
Das Wissen um den Zustand des Realitätsausschnitts verhilft zur Steuerung der ES, wodurch neben dem realen Objekt ein synchrones, virtuelles Modellobjekt entsteht.
Diese Konzept _dualer Realität_ von Objekten steht für die Kontrolle von Dingen der physischen Welt.
Um die Synchronität des Modells gewährleisten zu können, müssen Rückkopplungsschleifen die Effekte physischer Prozesse auf Berechnungen und Simulationen beziehungsweise vice versa verifizieren @Lee2008.
Weiterhin sollen derlei Systeme autonom auf Diskrepanzen reagieren und korrigierende Maßnahmen einleiten. 
In Systemen von CPS (CPSoS, [@fig:cps]d) wird die physische Welt in Realweltsysteme gegliedert, die über ihre Modelle interagieren.
CPSoS bieten Potential für die vierte industrielle Revolution und sind Grundlage cyber-physischer Produktionssysteme (CPPS).  
Produkte, Maschinen und andere Ressourcen werden in diesen durch CPS repräsentiert, welche Informationen und Dienste über das Netzwerk der gesamten Produktionsstrecke teilen.
CPS sind fundamentale Elemente eines CPPS, die unmittelbaren Zugriff auf relevante Informationen, Maschinenparameter, Produktionsprozesse und deren Produkte besitzen.
Durch die Dezentralisierung der Produktionslogik haben CPPS, im Gegensatz zu traditionellen Produktionssystemen, wesentliche Vorteile bezüglich Transparenz, Adaptivität, Ressourceneffizienz und Flexibilität.
Auf Ebene der Automatisierung werden Informationen eines CPS-Netzwerk benötigt, um den Fertigungsprozess auf Basis von strategischen Entscheidungen erfolgreich durchzuführen.
Für Entscheidungsfindung und Kontrolle der Fertigung werden konsistente, kohärente Informationen über die reale Welt benötigt @Bergweiler2015.

![Auflösung der Automatisierungspyramide aus @VereinDeutscherIngenieuree.V.2013](figures/pyramide-cps){#fig:pyramide-cps}

Diese Informationen, Dienste und Funktionen werden an jener Stelle lokalisiert, die im Sinne einer flexiblen Entwicklung und Produktion den größten Vorteil bringt @VereinDeutscherIngenieuree.V.2013. 
Starre Strukturen, wie die der klassischen Automatisierungspyramide, sind ungeeignet für die dezentrale Verortung der genannten Ressourcen.
Die demnach notwendige Auflösung dieser Architektur zu einem vernetzten System von Systemen, beziehungsweise CPSoS, wir in @fig:pyramide-cps verdeutlicht.
Sowohl Hard- und Software als auch die Verarbeitung der anfallenden Daten wird nicht länger in Schichten organisiert werden @Schlick2013.
Damit sollen die Produktionsressourcen auf Knoten eines Netzwerks aufgeteilt und schrittweise auf ihre funktionale Struktur abstrahiert werden @VereinDeutscherIngenieuree.V.2013.
Bis eine geeignete Architektur für CPPS andere Möglichkeiten bietet (vgl. [@Lee2015;@Borangiu2014]), werden Echtzeit-Steuerungen in der Feldebene verbleiben @VereinDeutscherIngenieuree.V.2013.

<!-- Zeit und Nebenläufigkeit physikalischer Systeme sind außerdem Eigenschaften die durch Infrastruktur- und Informationsabstraktionen abgedeckt werden müssen @Wang2008.
Technologien wie Echtzeitbetriebssysteme, Middlewares und spezialisierte eingebettete Prozessorarchitekturen bilden den ersten Schritt zum Schließen dieser Lücke @Lee2006.
Dennoch ist vor allem die inhärente Heterogenität der Komponenten eine Herausforderung für bestehende Kontrollmechanismen, Kommunikationsmuster und Softwareparadigmen @Wang2008. -->
<!-- Im Kontext industrieller Produktionskontrolle ergeben sich neben den Herausforderungen für CPS (vgl. @Lee2008) weitere Anforderungen.
Die autonome Kontrolle von Produktionsprozessen mit Hilfe von Kontrollschleifen wird durch Sensoren und Aktuatoren entlang der Produktionskette und an den individuellen Maschinen unterstützt.
Dafür muss das Gesamtsystem in eigenständige Subsysteme mit gekapselten Rückkopplungsmechanismen gegliedert werden.
Kommunikation geschieht auf der Basis bestehender Infrastrukturen mit kabelgebundenen und kabellosen Übertragungstechnologien.
Die bisher eingesetzten Standards wurden auf der Prämisse homogener Teilnehmer entwickelt und müssen im Zusammenhang mit CPPS überdacht werden.
Ein drahtloses Sensornetzwerk ist eine Ausprägung einer solchen Infrastruktur innerhalb derer die Kommunikationspartner mit unterschiedlicher Bandbreite und Zuverlässigkeit arbeiten müssen.
Weiterhin sind auf diesen Komponenten verteilte Echtzeitoperationen für Kontrollschleifen unerlässlich, wodurch das Design bestehender Netzwerkprotokolle oft in Frage steht.
So kann die Verarbeitung von Netzwerkpaketen, beziehungsweise deren Routing, Verifikation und Redundanz unvorhersehbar Zeit beanspruchen @Wang2008.
-->

<!--
## Cloud Manufacturing und Fog-Computing?

Bonomi 2012 @Bonomi2012  
Aazam 2016 @Aazam2016

Im WAN problematisch @Schlechtendahl2015 => OPC4Factory
-->

## Zusammenfassung

# Anforderungen {#sec:anforderungen}

Für die in @sec:zielsetzung aufgestellten Ziele, werden in diesem Kapitel die spezifischen Kriterien zu deren Erfüllung erläutert.

Informationssysteme in der Produktion dienen der Verbesserung der Wettbewerbsfähigkeit und müssen Innovations- und Zeitdruck standhalten. 
Moderne Produktionsumgebungen helfen Arbeitsabläufe zu optimieren und vereinfachen Beteiligten die Ausführung ihrer Arbeit.
Jedoch verhindern Altmaschinen aufgrund fehlender Infrastrukturanbindung und geschlossener Architekturen (vgl. @Deshpande2011) die Vollautomatisierung dieser Arbeitsabläufe und erfordern die physische Anwesenheit einer Fachkraft @Wang2004.

## Überwachung {#sec:REQ1}

Im Wartungs- und Störfall muss der Zustand der Anlage bekannt sein.
Dieser kann bei nicht integrierten Altmaschinen nur am Terminal eingesehen werden.
Ein Techniker muss die Betriebs- und Prozessdaten vor Ort erfassen um eine Diagnose stellen zu können und unter anderem das ERP-System darüber zu informieren.
Weiterhin kann eine cyber-physikalische Rückkopplungsschleife nicht autonom auf den Prozess wirken, wenn die Daten in keinem virtuellen Weltmodell zur Verfügung stehen.

REQ1
: Die Überwachung von Betriebs- und Prozessdaten der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Zustandserfassung und Störfalldiagnose durch Subsysteme des CPPS erfolgen kann.

## Steuerung {#sec:REQ2}

Um einen bestimmten Fertigungsschritt an einer numerisch kontrollierten (NC) Anlage durchzuführen, muss das auszuführende Programm übertragen werden.
Auch Speicherprogrammierbare Steuerungen (SPS) benötigen ein oft händisch übermitteltes Anwenderprogramm.
Diese Befehlsketten werden entweder mit einem Speichermedium auf den Steuerungs-PC kopiert oder direkt an dessen Terminal kodiert. 
Der zeitliche Aufwand und das notwendige Personal verlangsamen die Fertigung des Endprodukts und führen zu einer suboptimalen Fertigungsstrecke.
Für das Retrofitting der Anlage muss die entfernte numerische Kontrolle ermöglicht werden.
Weiterhin sind Produktionsmaschinen mit zusätzlichen automatisierten Komponenten wie Schließmechanismen für Schutztüren, Kühl-, Entlüftungs- oder Einspannsystemen ausgestattet.
Auch die Steuerung dieser muss ortsunabhängig sein, damit ein CPPS ganzheitlich in den Produktionsprozess eingreifen kann.

REQ2
: Die Steuerung der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Übertragung, Ausführung und Abbruch von NC-Programmen, beziehungsweise produktionsbedingter Steuerbefehle, durch Subsysteme des CPPS erfolgen kann.

Die steigende Automatisierung zur Optimierung der Produktionsabläufe wird in einem CPPS durch Rückkopplung erreicht.
Mit den Einhalten der Anforderungen zu Überwachung und Steuerung hat das System die Möglichkeit automatisch auf veränderte Bedingungen zu reagieren.
<!-- Außerdem werden darauf aufbauende Konzepte wie Predictive Maintenance und Condition Monitoring ermöglicht. -->

## Standardisierung {#sec:REQ3}

Nach Ferrolho et al. entstehen auch mit Netzwerkanbindung und Programmierschnittstellen noch zu überwindende Probleme @Ferrolho2007.
CNC-Maschinen basieren auf einer geschlossenen Architektur numerischer Kontrolle und sind nicht für die Integration mit anderen ausgelegt.
Die Kontrolleinheit der Anlage lässt die Steuerung von einem entfernten PC nicht zu.
Programmierumgebungen sind nicht ausreichend leistungsfähig um komplexe Aufgaben, wie die kollaborative Operation innerhalb einer flexiblen Fertigungszelle, zu entwickeln.
Unterschiedliche Hersteller verwenden eigene Programmiersprachen und Entwicklungstools, wodurch Integration und gemeinschaftliche Produktion erschwert werden.
Die sich damit ergebende Heterogenität der Anlagen einer Produktionsstrecke ist ein bereits betrachtetes Problem cyber-physikalischer Systeme (vgl. @Siepmann2016).
Im Falle proprietärer Schnittstellen und geschlossener Architekturen muss ein Adapter die Standardisierung von Protokollen und Informationen durchsetzen @Ayatollahi2013.
Für SPS gelten in diesem Zusammenhang die gleichen Anforderungen.

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

Auch wenn die Zeit für die Kommunikation von Steuerbefehlen und Sensordaten durch die Nähe zur Maschine minimiert wird, ist weder harte noch weiche Echtzeit ein Kriterium.
Es wird davon ausgegangen, dass die Interpretation und Ausführung der Maschinenbefehle, sowie die Aggregation der Daten, direkt an der Maschine geschieht.
Um in adäquater Zeit reagieren zu können, unterliegen die für CPPS erforderlichen Kontrollschleifen damit ebenfalls dem Lokalitätskriterium @Bonomi2012.

# Forschungsstand

Nach der Spezifikation der Zielvorgaben werden in diesem Kapitel der aktuelle Stand der Technik, sowie bereits bestehende Forschungsarbeiten zum Thema erläutert und mit den aufgestellten Kriterien für eine Lösung abgeglichen.

## Netzwerkarchitektur für CPPS {#sec:sota-wang2008}

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
Die Anforderung zur ortsunabhängigen Steuerung (REQ1) kann mit diese Netzwerkarchitektur durch eine Erweiterung erfüllt werden.
Arbeitsteilig können die _Computing Units_ und _Stages_ (vgl. @fig:wang-cps-architecture) die Interpretation und Ausführung von NC-Programmen und automatisierten Komponenten übernehmen.
Die ortsunabhängige Überwachung der Maschine (REQ2), deren virtuelle Repräsentation als _Stage_ fungiert, ist durch die Einbindung Sensoren vorbereitet, nicht aber erfüllt.
Um diesen Anforderungen vollends zu entsprechen muss ein lösungsorientiertes Konzept noch entwickelt werden.
Es werden keinerlei Aussagen zu standardisierten Kommunikationsprotokollen oder Informationsmodellen getroffen, weshalb REQ3 nicht erfüllt wird.
Da auf die Persistenz von Betriebs- und Prozessdaten der Stages nicht eingegangen wird, ein eingebettetes Kontrollsystem aber Bestandteil der jeweiligen Phase ist, wird der Anforderung der Lokalität nicht vollständig entsprochen (REQ4).
Zusammenfassend kann das Konzept von Stages und Computing Units für die Lösung des Retrofitting-Problems übernommen werden.

## Steuerung und Überwachung aus der Ferne {#sec:sota-wang2004}

Auf einer Netzwerkarchitektur wie in @sec:sota-wang2008, können konkrete Mechanismen für die Überwachung und Kontrolle von Anlagen aufgebaut werden.
Nach den Anforderungen REQ1 und REQ2 (vgl. [@sec:REQ1;@sec:REQ2]) muss die Interaktion mit CPPS-Subsystemen und Menschen fernab vom Terminal gewährleistet werden.
<!-- Purpose -->
Wang et al. entwickelte 2008 eine offenen Architektur für die Echtzeitüberwachung und -kontrolle von im Netzwerk befindlichen CNC-Maschinen über eine grafische Schnittstelle mit 3D Repräsentation @Wang2004.  
<!-- Design/Methodology/Approach -->
Ein Web-basierter Thin-Client des _Wise-ShopFloor_ ermöglicht die Kontrolle und Überwachung der Maschinen über ein dreidimensionales Modell der Fertigungsstrecke.
Das darunterliegende Framework basiert auf einer Client/Server-Architekturstil und verwendet seitens des Servers das MVC-Entwurfsmuster.
Maschinen werden über das Fabriknetzwerk mit dem Server verbunden und sind somit vom Internet getrennt.
Bei der Verwendung mehrerer Clients wird für das Routing ein Publish/Subscribe Mechanismus über HTTP-Streaming eingesetzt.
Mit Hilfe dessen wird das Verhalten des auf Java 3D basierenden Visualisierungsmodells durch Sensorik an den Machinen beeinflusst.
In der von Wang et al. durchgeführten Case Study wurde unter Verwendung einer CNC-Fräsmaschine die Tauglichkeit des Konzepts verifiziert.
Die Schnittstelle zwischen Server und Maschine wurde durch einen _Open Architecture Controller_[^oac] bereitgestellt.
Für die Kontrolle der Fräse kann zwischen einem manuellen und einem automatischen Modus gewählt werden, wobei letzterer die direkte Übertragung von G-Code ermöglicht.  
<!-- Findings -->
Das Internet ist ein zentraler Aspekt verteilter Produktion.
Jedoch sind damit Sicherheitslücken fatal für interne Daten und vertrauliche Informationen der Organisation.
Die gezielte Verbreitung dieser stellt ein erhöhtes wirtschaftliches Risiko dar und muss in besonderem Maße geschützt werden.
Weiterhin sind Systemfehler auf Maschinenebene im Bezug auf Personen- und Materialschäden untragbar.
Daher muss die reibungslose Kommunikation von Steuerungsbefehlen zu jeder Zeit gewährleistet sein.  
<!-- Research Limitations/Implications -->
Standards für die Kommunikation von Sensor- und Steuerungsinformationen sind notwendig um Effizienz und Integration der Systeme zu vereinfachen.
So müssen globale Schnittstellen definiert und durch die Komponenten des Systems implementiert werden.
Durch die Verwendung eines zuverlässigen NC-Befehlsinterpreters ist die verteilte Echtzeitsteuerung von CNC-Maschinen nach Wang et al. praktisch möglich.
Jedoch setzt dieses System eine bestehende Anbindung an die Steuerungsebene voraus.  
<!-- Practical Implications -->
Die direkte Verbindung des Clients zu einer Maschine ist mit der verwendeten Technologie nicht möglich.
Sowohl die Java Sicherheitsinfrastuktur, als auch die Überwindung von Firewalls stellen zukünftig zu lösende Probleme dar.
Für künftige Maschinen ist daher das Einbetten eines dedizierten Web-Services in die Kontrolleinheit notwendig.  
<!-- Originality/Value -->
Ein wichtiger Aspekt des Konzepts von Wang et al. ist die technische Umsetzung auf der Java-Plattform.
Mit dieser werden Sicherheitsinfrastrukturmerkmale wie byte-code-Verifikation und Rechtemanagement direkt unterstützt.
Die Indirektion des Kontrollflusses über den Server der Architektur zu den Maschinen verhilft zur Einhaltung.

<!-- Requirements -->
Durch Verteilung von Steuerung und Überwachung der Maschine auf im Netzwerk befindliche Clients, sowie die browserbasierte Nutzungsschnittstelle, werden die Anforderungen REQ1 und REQ2 (vgl. [@sec:REQ1;@sec:REQ2]) vollständig erfüllt.
Ein Standard wird mit der Kommunikation via HTTP verwendet, während Informationsprotokoll und -modell nicht näher erläutert wird.
Damit ist REQ3 nur ansatzweise erfüllt.
Auch mit der Konzeption einer Netzwerkarchitektur für CPS (vlg. @sec:sota-wang2008) wurde die Notwendigkeit des Einbettens der Steuerung erkannt.
Da aber Persistenz von Prozess- und Betriebsdaten von einem dedizierten Datenserver übernommen wird, ist das Lokalitätskriterium (REQ4) nur teilweise erfüllt.
Grundsätzlich wurden Sicherheitsaspekte im Konzept beachtet und in den vertikalen Prototypen integriert.
Die Verwendung von HTTP für die Kommunikation über Firewalls hinaus ermöglicht skalierenden, hierarchischen Zugriff.

[^oac]: Steuerungskomponente, die Modifikationen über das API hinaus zulässt @Yonglin2004

## Zusammenfassung

Die Gegenüberstellung von Anforderungen und bestehenden Forschungsarbeiten ist in @tbl:sota-req zusammengefasst.
Wobei ● die Erfüllung, ◐ die eingeschränkte oder teilweise Erfüllung und ○ die Nichterfüllung symbolisiert.

+-----------+-------------+-----------+-----------+-----------+
|           | Überwachung | Steuerung | Standards | Lokalität |
+===========+=============+===========+===========+===========+
| @Wang2008 | ◐           | ◐         | ○         | ◐         |
+-----------+-------------+-----------+-----------+-----------+
| @Wang2004 | ●           | ●         | ◐         | ◐         |
+-----------+-------------+-----------+-----------+-----------+

: Anforderungen bzgl. bestehender Forschungsarbeiten {#tbl:sota-req}

----

* Control software for industrial CNC machines [@Ferrolho2005;@Ferrolho2007]
    - kein Standard bei Kommunikation
* Prototypischer OPC UA Server für Fernsteuerung @Ayatollahi2013
* Unterschied RetroNet @FraunhoferIPK2016 (TODO)
    - keine zentrale Datenhaltung

<!-- ## Maschinendatenerfassung & -analyse -->

<!-- ### Legacy Machine Monitoring Using Power Signal Analysis @Deshpande2011 -->

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

<!-- ### Diss: In-process tool condition monitoring systems in CNC turning operations @Lee2006 -->

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
    
<!-- ### Machine-readable data carriers – a brief introduction to automatic identification and data capture @Furness2000 -->

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

<!-- ### Zusammenfassung -->

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

<!-- ## Rechnergestützte numerische Steuerung -->

__Problem__: Wissen über operative Schritte und Werkstück verfügbar - Umsetzung der Schritte?  
__Lösung__: Kontrolle der Maschine

<!-- ### An ARM-based Multi-channel CNC Solution for Multi-tasking Turning and Milling Machines @Grigoriev2016 -->

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


<!-- ## Architekturen & Methoden für CPPS -->



* SOA [@Meyer2010;@Fallah2016a]
* MAS, Holonic [@Leitao2009;@Fallah2016]
* Blackboard [@Monostori2006;@Pauker2013]
* RAMI4.0 @Adolphs2015

<!-- ### Information Architecture for Reconfigurable production systems @Pauker2013 -->

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

=> auch @Durkop2014
    
<!-- ### Prototype OPC UA Server for Remote Control of Machine Tools @Ayatollahi2013 -->

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

<!-- ### A systematic approach to OPC UA information model design @Pauker2016 -->

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

<!-- ## Zusammenfassung -->

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

[^OPC4Factory]: [www.ift.at/forschung/foschungsprojekte/opc4factory](https://www.ift.at/forschung/foschungsprojekte/opc4factory) vom 04.10.2016
see [@Ayatollahi2013;@Pauker2013;@Pauker2014]



[@Schlechtendahl2015;@Schlechtendahl2014;@Vick2015]

* TODO Projekte zusammenfassen & gegeneinander abgrenzen
* Schnittstellenproblematik immer Teil des Problems
* Entwicklung von Adaptern meist Standardlösung
* Kosten => Remote Maintenance?

# Konzeption

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
* Rekonfigurierbare FFZ [@Pauker2013;@Durkop2014]
* Bisher OPC UA Server als Adapter zu proprietären Maschinenprotokollen 
    * Server <->  Maschine => Server <-> Adapter <-> Maschine ?
    * Smoothieboard/Embedded (soft-)SPS als Adapter zu Maschine
* Wiederverwendung @Ayatollahi2013
    * des Informationsmodells
    * des Flow-Charts für die Server-Logik (teilweise)
* Persistenzkonzept: Blackboard? @Pauker2013
* Kontrolle der Arbeitssequenz? (PROtEUS, BPMN/Activiti)

* Framework
    - Definition der Bindings von Extension Points in OPC UA Modell

* SPS siehe @Windmann2015 Bild 3

> Unlike web services, OPC UA is currently integrated in a large number of PLCs on the market.
> The IEC standardization commission recommends OPC UA as a standard for the implementation 
> of a smart factory [23]. For this reason, OPC UA is used as server standard for NGDs.
> However, OPC UA does not allow real-time transmission, which is why a real-time
> communication channel must still exist.
> -- @Hammerstingl2015

Nach Rücksprache

* OPC UA zur Metamodellierung bzgl. der Machine
* But not hard real-time (not yet) => nicht geeignet für direkt Bewegungskontrolle @Pauker2014
* OPC UA Modell synchron mit Realität => Laufzeitmodell
* Zu erwartendes Verhalten des physischen Systems über FB-Loop (MAPE-K) kontrollierbar => Modellierung/Sprache der _Regeln?_
* Elemente eines Frameworks mit Schichtenarch. im Client/Server-Stil
* Microkernel-Ansatz (Plugins für OPC UA Typen, Sensoren und Aktuatoren)
* FB-Loop intern oder extern?
* "zentral" erfassen durch RAMI4.0 Verwaltungsschale
* "zentral" auswerten mit Cloud-Analytics (Big Data)

OPC4Factory:

> OPC UA Server und ihre Informationsmodelle repräsentieren alle für die Automatisierungs-aufgaben erforderlichen Komponenten der angeschlossenen Maschinen und Roboter (Ladetüren, Spannmittel, Werkzeuge, NC-Programme etc.) mit ihren Attributen, Ereignissen und Methoden. Die Kommunikation auf dieser Ebene __erfordert keine Echtzeitfähigkeit__, da Steuerungsaufgaben mit Echtzeitanforderungen ausschließlich innerhalb der Maschinen- bzw. Robotersteuerung abgewickelt werden.

* Statusreport: Referenzarchitekturmodell Industrie 4.0 (RAMI4.0) => **Abb. 9 I4.0-Komponente** @Adolphs2015 
* Kruchten 4+1?
* arc42?

<!-- ## Virtuelle Maschinenrepräsentation -->

* Service-/Protokolllayer (OPC UA)
* CPS-Layer, Hardwareanbindung
* Einbetten eines dedizierten Web-Services  @Wang2004 
* Stage braucht eingebettetes Kontrollsystem @Wang2008

<!-- ## Kommunikations- & Informationsmodell -->

@Pauker2013 Komponentengranularität bis zur Achse (intelligente Maschinenteile)

<!-- ## Systemintegration -->

## Zusammenfassung

# Implementation

* Smoothieboard als Maschinen-Adapter
    - Nachteil: Beobachten des Prozessfortschritts langsam (_progress_) => kann nicht in online-FB einbezogen werden
* open62541 oder ähnliche OPC UA Stack-Implementierungen für Server auf Pi

## Zusammenfassung

# Evaluation

These/Behauptung?
* Steigerung des Automatisierungsgrads durch Feedback Loop
* physische Anwesenheit des Werkers technisch überwinden (Remote-Control/-Programming)
    - "Echtzeitanalyse" durch Werker auch entfernt mgl.
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

* Steuerungsalternative _Programs_
* MDSD mit @Pauker2016
* CNC ersetzen durch STEP-NC? [@Suh2003;@Xu2006;@Xu2006b;@Xu2006a]
* Prozessmodell für Abstrakte Leitebene
* AutomationML und OPC UA @OPCFoundation2014
* Wo läuft die Logik für orchestrierende Steuerung? (OPC UA Clients)
* Surrogate als reaktiver Agent => Einbindung in MAS denkbar
* Echtzeitfähigkeit des Konzepts überprüfen
* Möglichkeiten des Nutzens der Daten
    * Welcher G-Code Befehl korrelliert auf welche Weise mit welchen gemessenen Werten?
    * Automatische Erkennung von Gut-/Schlechtteilen
