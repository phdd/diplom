
# Einleitung

Seit der Mitte des 18. Jahrhunderts ist die industrielle Fertigung in stetigem Wandel.
Mit der Entwicklung dampfgetriebener Arbeits- und Kraftmaschinen um 1750 wurde die erste industrielle Revolution eingeleitet.
Zum Ende des 19. Jahrhunderts ermöglichte die Einführung arbeitsteiliger Massenproduktion und wissenschaftlicher Betriebsführung das erste Transportband in der fleischverarbeitenden Industrie.
Knapp einhundert Jahre nach dieser zweiten Revolution wurden 1969 erste speicherprogrammierbare Steuerungen (SPS) zur variantenreichen Serienproduktion eingesetzt.
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

## Zielsetzung

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

Eine Ethernet-basierte Netzwerkinfrastruktur erlaubt das Einbinden eines virtuellen Maschinenabbilds in die Fertigungsstrecke.
Zugang zur Anlage, regelungstechnische Modifikationen und das Anbringen von Sensorik und Aktuatoren sind gegeben.
Die zu modernisierende Werkzeugmaschine wird durch rechnergestützte numerische Steuerung (CNC) kontrolliert.
Automatisierte Werkzeugkomponenten, wie Einspannvorrichtungen oder Schutztüren, sind an eine Speicherprogrammierbare Steuerung (SPS) gekoppelt.
Einplatinencomputer sind ausreichend leistungsfähig für die Steuerung und Überwachung von CNC-Maschinen @Grigoriev2016.

Auch ist das vorgestellte Konzept der Anlagenmodernisierung auf diskrete Fertigung mit bestehender Netzwerkinfrastruktur beschränkt.
Unter Berücksichtigung der besprochenen Ziele und Einschränkungen, wird eine konzeptuelle und prototypische Lösung durch die folgenden Schritte erreicht. 

1. Ermitteln der Anforderungen für eine Integration von Altmaschinen in moderne, verteilte Produktionsumgebungen -- im Folgenden als Retrofitting bezeichnet.
2. Recherchen zum heutigen Stand der Technik und die Einbeziehung vorhandener Systeme.
3. Konzeption einer virtuellen Repräsentation als Schnittstelle der zu integrierenden Anlage.
    - Einsatz von Einplatinencomputern als Integrationsequipment
4. Ermöglichen von dezentraler Kontrolle und Überwachung im Hinblick auf cyber-physische Produktionssysteme. 
    - Transfer und Ausführung von Maschinenprogrammen.
    - Erfassen von Produktionsdaten durch angeschlossene Sensoren.
    - adaptive Reaktion auf Zustandsänderung durch Rückkopplung.
5. Vorstellung eines skalierenden, erweiterbaren Frameworks.
6. Eine prototypische Implementierung belegt die prinzipielle Durchführbarkeit.

**Retrofitting** ist nicht nur die Integration von Altmaschinen.
Im Rahmen dieser Arbeit gilt die Definition von Bergweiler, nach der Retrofitting die Erweiterung des Equipments einer Anlage durch zusätzliche Hardware meint.
Der funktionale Umfang einer Maschine wird durch neue Module für die Übertragung und verteilte Verarbeitung der Daten ausgebaut.
Dadurch wird die Kommunikation zwischen individuellen Geräten und Produkten der Fertigung ermöglicht, bis die Fabrik den künftigen Standards, Direktiven und Prinzipien der Industrie 4.0 genügt @Bergweiler2015.
In Verbindung mit den Zielen muss die zusätzliche Hardware, für die Erweiterung des Equipments, in Einplatinencomputern bestehen.

Nach Klärung der Ziele, Beschränkung des Konzepts und dem Aufzeigen eines groben Lösungswegs werden in dieser Arbeit folgende Fragen zu beantworten sein.

> Welchen softwaretechnologischen Konzepten muss die Modernisierung und der infrastrukturelle Kontext einer Altmaschine unterliegen, um eine ganzheitliche Integration in cyber-physische Produktionssysteme (CPPS) gewährleisten zu können?
> 
> 1. Welche System- und Softwarearchitektur ist für ein flexibles Retrofitting zur Steuerung und Überwachung veralteter Fertigungsanlagen im Kontext von CPPS geeignet?
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

## Fertigung und Automatisierung

Fertigung, als Unterbegriff der Produktion, beschreibt Verfahren zur Umwandlung oder Erzeugung von Stoffen mit Hilfe von Energie und Informationen innerhalb eines Prozesses @Linke2015. 
Automatisierung, nach der DIN 19233, ist "das Ausrüsten einer Einrichtung, so dass sie ganz oder teilweise ohne Mitwirkung des Menschen bestimmungsgemäß arbeitet".
Eine Verknüpfung dieser beiden Konzepte ist in @fig:fertigungsautomatisierung dargestellt.
Die Rückkopplung von Prozessdaten in eine Automatisierungseinrichtung befähigt das System, unter Berücksichtigung von Zielen, steuernd auf die Fertigung zu wirken.
Direkte Eingriffe in den Prozess, sowie dessen Beobachtung durch den Menschen, werden verringert - im ökonomischen Zusammenhang rationalisiert (vgl. zu diesem Absatz @Linke2015).

![Automatisierte Fertigung aus @Linke2015](figures/fertigungsautomatisierung){#fig:fertigungsautomatisierung}

Um die verschiedenen Bereiche der klassischen[^klassische-autom] Automatisierung darzustellen, wird eine Schichtenorganisation herangezogen.
Die Struktur eines Unternehmens entspricht damit einer Automatisierungspyramide.
Unterschieden werden diese Ebenen aufgrund der unterschiedlichen Anforderungen an Datendurchsatz und Übertragungsgeschwindigkeit (vgl. zu diesem Absatz @Linke2015).
Wird eine neue Komponente in diese Pyramide integriert, geschieht dies entweder horizontal oder vertikal.
Ersteres bedeutet die Verbindung der Komponente mit Geräten gleicher Ebene.
Ist sie vertikal integriert, verbindet sie Komponenten unterschiedlicher Ebenen.
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
Speicherprogrammierbare Steuerungen (SPS, vgl. @sec:speicherprogrammierbare-steuerung) und numerische Kontrolle (NC, vgl. @sec:numerische-steuerung) erhalten Befehle in Echtzeit und automatisieren den Produktionsablauf.
Über einen Feldbus (vgl. @sec:kommunikationssysteme) werden diese Instruktionen und Messdaten an ein Supervisory Control and Data Acquisition (SCADA) System gekoppelt.
Derlei Systeme sind verantwortlich für die Überwachung und Steuerung technischer Prozesse und kontrollieren die übergeordnete Fertigungszelle, respektive Verbünde von Werkzeugmaschinen, Robotern und automatisierten Komponenten @Linke2015.
Ein MES, beziehungsweise Fertigungsmanagementsystem bildet dann die Schnittstelle zum Ressourcenmanagementsystem (ERP) der Unternehmensleitebene.

[^automatisierungspyramide]: Darstellung durch Wikipedia-Nutzer [UlrichAAB](https://de.wikipedia.org/wiki/Benutzer:UlrichAAB).
[^klassische-autom]: Automatisierung vor der vierten industriellen Revolution.

### Kommunikationssysteme

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
RTE ist hierbei ein Überbegriff verschiedener Netzwerkstandards wie Profinet IO, EtherNet/IP und EtherCAT @Durkop2014.
Bildverarbeitungssysteme, ihre Protokolle (z.B. GigE Vision[^gigevision]) und Beschreibungssprachen (z.B. GenICam[^genicam]) sind hier verbreitet.
Für Konfiguration und Überwachung der Systeme wird eine Mensch-Maschine-Schnittstelle (MMS) eingesetzt (vgl. zu diesem Absatz @Hammerstingl2015).  
Feldbusse sind digitale bidirektionale, serielle Kommunikationsnetzwerke für echtzeitfähige, verteilte Kontrolle von Instrumenten, Steuerungseinheiten und Aktuatoren @Mahalik2003.
Trotz der Standardisierungsbemühungen durch IEC 61158, existieren unterschiedliche Feldbusse wie CAN, ProfiBUS oder EtherCAT.
Jeder Hersteller von Maschinen, Robotern und automatisierten Komponenten stellt einen anderen Busstandard, weshalb die Kommunikation der Geräte nicht garantiert werden kann.
Für deren Verbindung mit unterschiedlichen Systemen wird ein Adapter benötigt, wodurch der Aufwand bezüglich Bereitstellung und Konfiguration steigt (vgl. zu diesem Absatz @Pauker2013).

Auf den höheren Ebenen der Automatisierungspyramide (vgl. @fig:automatisierungspyramide) etablierte sich das nicht Echtzeit-fähige Ethernet.
Die Variante des RTE verbreitet sich jedoch zunehmend auch auf den unteren Ebenen (vgl. @sec:zielsetzung) und erlaubt Kommunikation mit Remote Procedure Calls (RPC), TCP/IP-Sockets und OPC (ursprünglich OLE[^ole] for Process Control, vgl. @sec:opc-unified-architecture) @Pauker2013.
Die Homogenisierung der Infrastruktur, vom Ressourcenmanagement im ERP über die Speicherprogrammierbare Steuerung bis zum einzelnen Sensor auf der Feldebene, vereinfacht den Informationsaustausch und trägt zur Flexibilisierung des Gesamtsystems bei.
Weiterhin stehen damit die Daten aller Schichten für jeden anderen Netzwerkteilnehmer zur Verfügung.  
Diese Form der Kommunikations- und Informationsstruktur ist nach Hammerstingl und Reinhart in einer vierten Klasse zu finden.
@fig:automationsstruktur zeigt OPC und OPC UA (vgl. @sec:opc-unified-architecture) als Standard für den Datenaustauch zwischen dem Produktionsplanungssystem (PPS) und den speicherprogrammierbaren Steuerungen (SPS, vgl. @sec:speicherprogrammierbare-steuerung).
Mit dieser Technologie stellen Geräte aktiv ihre virtuelle Beschreibung bereit, was durch die Hersteller unterstützt und vorangetrieben wird (vgl. zu diesem Absatz @Hammerstingl2015).
Auch mit numerischer Steuerung (CNC, vgl. @sec:numerische-steuerung) kontrollierte Werkzeugmaschinen können so Informationen zu Zustand und Produktionsfortschritt bereitstellen.

[^ole]: Object Linking and Embedding
[^iolink]: Implementierung der IEC TR 61131-9
[^gigevision]: Schnittstellenstandard industrieller Bildverarbeitung
[^genicam]: Schnittstellenstandard für industriell eingesetzte Kameras

### Numerische Kontrolle

Für die Fertigung eines Produkts werden Bauteile benötigt, die durch Werkzeugmaschinen entstehen.
In der DIN 69651 ist eine Werkzeugmaschine definiert als eine "mechanisierte und mehr oder weniger automatisierte Fertigungseinrichtung, die durch relative Bewegung zwischen Werkstück und Werkzeug eine vorgegebene Form am Werkstück oder eine Veränderung einer vorgegebenen Form an einem Werkstück erzeugt" (Zitat aus @Hirsch2000).
Ein Werkstück ist dabei ein Rohling eines bestimmten Materials, welcher auf eine bestimmte Art durch Bearbeitung verändert wird.
Die aus diesem entstehende Form wird mit Software für Computer-Aided Design (CAD) entworfen, wobei eine zwei- oder dreidimensionale Visualisierung des Modells den Konstrukteur unterstützt.
In einem zweiten Schritt werden die so entstandenen Konstruktionspläne in Bewegungsmuster umgewandelt.
Der etablierte Kodierungsstandard für die Steuerungsinformationen zu diesen Mustern ist durch die DIN 66025, beziehungsweise ISO 6983 normiert und als G-Code bekannt.
Eine vollständige Kompatibilität der Befehle zwischen den Anlagen wird aufgrund spezifischer Werkzeug- und Maschinenparameter, wie Drehzahlen oder Begrenzungskoordinaten der Arbeitsfläche, verhindert.
Durch Präprozessoren und manuelle Anpassungen werden Steuerungsinformationen des zweiten Schritts auf die Maschine angepasst.  
Wurde der vorverarbeitete G-Code auf eine Werkzeugmaschine mit Computer Numerical Control (CNC) übertragen, kann diese mit dem eigentlichen Fertigungsschritt beginnen.
Derlei Maschinen besitzen mehrere durch Schrittmotoren und Servos angetriebene Bearbeitungsachsen, welche die Position des Werkzeugs relativ zum Werkstück durch Translation und Rotation (Hilfsachsen) verändern.
Mit dieser relativen Bewegung wird sukzessiv Material entfernt, wodurch die im CAD entworfenen Bauteile physisch entstehen.
Für das Entfernen von Material werden verschiedene Typen von Werkzeugmaschinen eingesetzt.
Drehmaschinen und Fräsen sind hier die prominentesten Repräsentanten, wobei zum Beispiel auch spezielle Roboter mit Befehlen der CNC gesteuert werden können (vgl. zu diesem Absatz @Hirsch2000).

![Beispielkonstruktion und G-Code für eine Drehbank](figures/lathe-example){#fig:lathe-example}

G-Code teilt sich in zwei Gruppen von Instruktionen, die wiederum herstellerspezifisch beziehungsweise generisch sind.
@fig:lathe-example zeigt das Beispiel einer Konstruktion und dessen Programm mit Bewegungsinstruktionen (G-Befehle) und sonstige Anweisungen (M-Befehle) für die Herstellung auf einer Drehbank[^lathe-example].
Das Einspannen des Rohlings durch `M12` schließt die Klammern - in der Konstruktion als schraffierte Blöcke dargestellt.
Ein Eilgang, wie durch `G0 X100 Z50`, richtet das Werkzeug ohne das Entfernen von Material an einem bestimmten Punkt aus, wobei sich `A` im Beipiel an Position `(X = 100, Z = 50)` befindet.
Der Befehl `G1` wird für den eigentlichen Fräsvorgang verwendet und lässt das Werkzeug mit einer Geschwindigkeit (Vorschub) von 600 mm/min durch das Material laufen.

Vielen CNC-Anlagen fehlt der Speicher für Programme mit mehreren tausend Bewegungsinstruktionen.
Derlei Befehlslisten müssen während der Bearbeitung durch ein Fremdsystem an die Maschine sukzessiv übertragen werden. 
Das Konzept der _Direct Numerical Control_ (DNC) steht für diese Verbindung via RS-232 oder Parallel Port.
Fremdsysteme sind PCs oder dedizierte DNC-Transfergeräte, die den Code von Speichermedien wie USB-Sticks und SD-Karten beziehen.
DNC, verstanden als _Distributed Numerical Control_, ermöglicht weiterhin die Verteilung von Programmen auf einen Maschinenverbund @Hirsch2000.

Die Vorteile der Fertigung mit CNC liegen in der Wiederholbarkeit und Genauigkeit der Operation.
Weiterhin wird die Rüstzeit, jene zum Einstellen der Maschine, verringert und damit die Produktivität erhöht (vgl. zu diesem Absatz @Smid2008).  
Dennoch sind auch moderne CNC-Anlagen in ihrer Funktion limitiert, da der verwendete G-Code lediglich Instruktionen und prozedurale Daten abbilden kann, wodurch ein Großteil der Konstruktionsinformationen verloren geht.
Zwei neue Standards, namentlich STEP-NC (ISO 10303-238) und Function Blocks (IEC 61499), etablieren sich aus diesem Grund.
Durch diese sollen CNC-Maschinen mit mehr Informationen, für intelligentere Fertigung und bessere Interoperabilität, ausgestattet werden.
Beispielsweise wird durch STEP-NC die Abhängigkeit von Parametern reduziert. 
Neuberechnungen zur Laufzeit beziehen unter anderem Verformungen durch Erhitzen des Werkstücks in die Fahrtenplanung ein.
Function Blocks dagegen, sind Teil eines Standards für verteilte industrielle Prozesse und Kontrollsysteme.
Sie kapseln Maschinendaten, wie Werkzeugeigenschaften oder Algorithmen, für CNC. (vgl. zu diesem Absatz @Xu2006a).  
Darüber hinaus besitzen Anlagen spezifische, automatisierte Maschinen- und Werkzeugkomponenten, die nur indirekt durch CNC steuerbar sind.
Schließmechanismen, Abluftsysteme oder Materialzufuhr werden von maschinenspezifischen, internen speicherprogrammierbaren Steuerungen in die Fertigung integriert @Hirsch2000.

[^lathe-example]: nach [www.helmancnc.com/cnc-lathe-simple-g-code-example-g-code-programming-for-beginners](http://www.helmancnc.com/cnc-lathe-simple-g-code-example-g-code-programming-for-beginners/) (abgerufen am 7.10.2016)

### Speicherprogrammierbare Steuerung

Daten und Zustände automatisierter Maschinen- Werkzeug- und Fertigungsprozesskomponenten werden durch speicherprogrammierbare Steuerungen (SPS) aufgenommen, verarbeitet und verändert.
Durch der DINIEC 60050-351 7-2013 sind sie definiert als eine "rechnergestützte programmierte Steuerung, deren logischer Ablauf über eine Programmiereinrichtung, zum Beispiel ein Bedienfeld, einen Hilfsrechner oder ein tragbares Terminal, veränderbar ist" (Zitat aus @Heinrich2015).
Nach Heinrich et al. sind folgende Komponenten dafür notwendig.
Ein Hardwaresystem stellte die Verbindung zum Fertigungsprozess und weiteren automatisierten Anlagen her.
Programm- und Datenspeicher sind für die Persistenz des Anwenderprogramms, beziehungsweise der Prozessdaten verantwortlich und werden durch die Verarbeitung verändert.
Dafür sind ein Betriebssystem, sowie ein Anwenderprogramm zuständig.

Der prinzipielle Aufbau einer SPS umfasst Stromversorgungs-, Signalverarbeitungs- und vier Schnittstellenfunktionen für den Datenaustausch.
Eine Mensch-Maschine-Schnittstelle ermöglicht dem Bediener den operativen Betrieb, z.B. durch Statusanzeigen, zu überwachen.
Die Programmier- und Test-Schnittstelle wird durch einen Programmierer, neben der Implementierung von Instruktionen, auch zur Fehleranalyse genutzt.
Kommunikationsfunktionen erlauben die Anbindung an externe Systeme, automatisierte Komponenten und Datenquellen.
Aktuatoren und Sensoren werden über die Prozessschnittstelle an eine SPS gekoppelt.
Der konzeptuelle Aufbau wird durch ein, in @fig:sps-aufbau dargestellten, Hardwaresystem implementiert.
Die Stromversorgungseinheit liefert die für den Betrieb notwendige Energie und kann an die jeweilige Quelle angepasst werden.
Eine Zentraleinheit mit CPU, Speicher, Verarbeitungseinheit und Anschlüssen für Programmiergeräte  und Netzwerk bildet die Steuerungslogik ab.
Die Kopplung an digitale und analoge Datenquellen und -empfänger erfolgt über Ein-/Ausgabe-, beziehungsweise Signaleinheiten.

![Grundlegender Hardwareaufbau einer SPS nach @Heinrich2015](figures/sps-aufbau){#fig:sps-aufbau}

Signalverarbeitungsfunktionen im Anwenderprogramm werden innerhalb der Verarbeitungseinheit zyklisch ausgeführt.
In einem ersten Schritt werden dafür die aktuellen Zustände der Eingänge erfasst, z.B. Sensordaten, und der Datenspeicher gelesen.
Das Anwenderprogramm wird nach dem EVA-Prinzip (Eingabe, Verarbeitung, Ausgabe) abgearbeitet, woraufhin Ausgangssignale, z.B. Befehle für Aktuatoren, erzeugt werden.
Diese Zyklen verbrauchen Zeit die kritische Aktionen verhindern können.  
So existieren neben den zyklusorientierten auch unterbrechungsfähige SPS.
Das aktuell laufende Programm kann dabei durch Interrupts pausiert und später wieder aufgenommen werden.
Programmiert werden Anwenderprogramme mit normierten Methoden der EN 61131-3.
In textueller Form existieren Standards für Anweisungslisten und strukturierten Text.
Grafisch wird die Logik einer SPS durch Kontaktpläne, eine Funktionsbaustein- oder Ablaufsprache implementiert.  
Eine weitere Kategorie bilden ereignisorientierte Steuerungen bei denen das Anwenderprogramm erst bei Statusveränderungen der Eingangssignale abgearbeitet wird.
Weiterhin unterschieden werden modulare SPS, wie die _Simatic S7_-Serie von Siemens, und kompakt-SPS, wie zum Beispiel _LOGO!_.
Letztere zeichnen sich durch fehlende Erweiterbarkeit aus.
Neben hardwarebasierten SPS ermöglichen Software-Steuerungen (Soft-SPS) eine weitere Stufe der Flexibilisierung.
Steuerungen mit Echtzeit-Betriebssystemen, auch in eingebetteten Recheneinheiten, übernehmen hier die Überwachung und Kontrolle des Prozesses, sind jedoch weniger verbreitet.  
Eine Alternative zu SPS bietet die verbindungsprogrammierte Steuerung (VPS), bei der die Komponenten der Ein- und Ausgabe festverdrahtet und die Logik vordefiniert ist.
Die speicherprogrammierbare Variante hat nicht nur den Vorteil der Flexibilität.
Der Funktionsumfang, die Verarbeitung analoger und digitaler Daten, sowie die geringen Betriebskosten etablierten die SPS als Standard in der industriellen Fertigungsautomatisierung (vgl. zu diesem Absatz @Heinrich2015).  

Die EN 61131-3 ist nicht die einzige Möglichkeit der Programmierung einer SPS.
Zugunsten vertikaler und horizontaler Integration hat die PLCopen[^plcopen], eine Vereinigung von Steuerungsherstellern, und die OPC-Foundation Funktionsbausteine in einer Spezifikation für OPC UA abgebildet.
Damit kann die SPS eine aktive Rolle innerhalb der Automatisierungspyramide einnehmen und sich beispielsweise Produktionsaufträge eigenständig abholen (vgl. zu diesem Absatz @OPCFoundation2014).

[^plcopen]: [www.plcopen.org](http://www.plcopen.org/)

## OPC Unified Architecture

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
[^opc-def]: nach [opcfoundation.org/about/what-is-opc](https://opcfoundation.org/about/what-is-opc/) (abgerufen am 23.09.2016)

## Cyber-physische Produktionssysteme

Die Verbindung von Überwachung und Kontrolle technischer Systeme mündet in Paradigmen, die Realität und virtuelle Umgebungen miteinander verschmelzen lassen.
So wurde das Konzept cyber-physischer Systeme (CPS) 2006 durch Edward A. Lee erstmalig erläutert.
Er versteht diese als Integration von Informationsverarbeitung und physischen Prozessen.
Virtuelle und physische Abläufe werden durch Sensoren und Aktuatoren überwacht, beziehungsweise beeinflusst, stehen in unmittelbarer Wechselwirkung und sind durch Kontrollschleifen rückgekoppelt @Lee2008.
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
    
# Anforderungen

Für die in @sec:zielsetzung aufgestellten Ziele, werden in diesem Kapitel die spezifischen Kriterien zu deren Erfüllung erläutert.

Informationssysteme in der Produktion dienen der Verbesserung der Wettbewerbsfähigkeit und müssen Innovations- und Zeitdruck standhalten. 
Moderne Produktionsumgebungen helfen Arbeitsabläufe zu optimieren und vereinfachen Beteiligten die Ausführung ihrer Arbeit.
Jedoch verhindern Altmaschinen aufgrund fehlender Infrastrukturanbindung und geschlossener Architekturen (vgl. @Deshpande2011) die Vollautomatisierung dieser Arbeitsabläufe und erfordern die physische Anwesenheit einer Fachkraft @Wang2004.

## Überwachung

Im Wartungs- und Störfall muss der Zustand der Anlage bekannt sein.
Dieser kann bei nicht integrierten Altmaschinen nur an deren Terminal eingesehen werden.
Ein Techniker muss die Betriebs- und Prozessdaten vor Ort erfassen um eine Diagnose stellen zu können und unter anderem das ERP-System darüber zu informieren.
Im Sinne der Industrie 4.0 wird diese Form ortsgebundener Arbeitsplätze an Bedeutung verlieren und einer dezentralen Nutzungsschnittstelle weichen @Gorecky2014.
Damit müssen die Daten über geeignete Schnittstellen zur Verfügung stehen.
Subsysteme können dann auch automatisiert über Zustandsänderungen der Maschine in Kenntnis gesetzt werden.
Weiterhin braucht ein CPPS diese Informationen um adäquat reagieren zu können (vgl. @sec:cyber-physische-produktionssysteme, @Lee2008).
Abgesehen von der notwendigen Dezentralisierung und dem Informationsgewinn für Rückkopplungsschleifen gilt es einen Werkzeugbruch zugunsten von Maschinenverfügbarkeit und Produktqualität, respektive der Ökonomie des gesamten Produktionssystems, zu verhindern @Ambhore2015.

R1
: Die Überwachung von Betriebs- und Prozessdaten der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Zustandserfassung und Störfalldiagnose durch Subsysteme des CPPS erfolgen kann.

## Steuerung

Um einen bestimmten Fertigungsschritt an einer numerisch kontrollierten (NC) Anlage durchzuführen, muss das auszuführende Programm nach DIN 66025 übertragen werden @Hirsch2000.
Auch Speicherprogrammierbare Steuerungen (SPS) benötigen ein Anwenderprogramm nach EN 61131-3 oder der PLCopen-Spezifikation [@Heinrich2015;@OPCFoundation2014].
Diese Befehlsketten werden entweder mit einem Speichermedium auf den Steuerungs-PC kopiert oder direkt an dessen Terminal kodiert. 
Der zeitliche Aufwand und das notwendige Personal verlangsamen die Fertigung des Endprodukts und führen zu einer suboptimalen Fertigungsstrecke @Ayatollahi2013.
Für das Retrofitting der Anlage muss die entfernte numerische Kontrolle ermöglicht werden.
Weiterhin sind Produktionsmaschinen mit zusätzlichen automatisierten Komponenten wie Schließmechanismen für Schutztüren, Kühl-, Entlüftungs- oder Einspannsystemen ausgestattet.
Auch die Steuerung dieser muss ortsunabhängig sein, damit ein CPPS ganzheitlich in den Produktionsprozess eingreifen kann @Gorecky2014.

R2
: Die Steuerung der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Übertragung, Ausführung und Abbruch von NC-Programmen, beziehungsweise produktionsbedingter Steuerbefehle, durch Subsysteme des CPPS erfolgen kann.

Die steigende Automatisierung zur Optimierung der Produktionsabläufe wird in einem CPPS durch Rückkopplung erreicht.
Mit den Einhalten der Anforderungen zu Überwachung und Steuerung hat das System die Möglichkeit automatisch auf veränderte Bedingungen zu reagieren.
<!-- Außerdem werden darauf aufbauende Konzepte wie Predictive Maintenance und Condition Monitoring ermöglicht. -->

## Standardisierung

Nach Ferrolho et al. entstehen auch mit Netzwerkanbindung und Programmierschnittstellen noch zu überwindende Probleme @Ferrolho2007.
CNC-Maschinen basieren auf einer geschlossenen Architektur numerischer Kontrolle und sind nicht für die Integration mit anderen ausgelegt.
Die Kontrolleinheit der Anlage lässt die Steuerung von einem entfernten PC nicht zu.
Programmierumgebungen sind nicht ausreichend leistungsfähig um komplexe Aufgaben, wie die kollaborative Operation innerhalb einer flexiblen Fertigungszelle, zu entwickeln.
Unterschiedliche Hersteller verwenden eigene Programmiersprachen und Entwicklungstools, wodurch Integration und gemeinschaftliche Produktion erschwert werden.
Die sich damit ergebende Heterogenität der Anlagen einer Produktionsstrecke ist ein bereits betrachtetes Problem cyber-physikalischer Systeme (vgl. @Siepmann2016).
Im Falle proprietärer Schnittstellen und geschlossener Architekturen muss ein Adapter die Standardisierung von Protokollen und Informationen durchsetzen [@Ayatollahi2013;@Gorecky2014].
Für SPS gelten in diesem Zusammenhang die gleichen Anforderungen.

R3
: Standardisierte Informationsprotokolle und -modelle werden für die Integration heterogener Altmaschinen eingesetzt, so dass Datenaggregation und M2M-Kommunikation gesamtheitlich gewährleistet werden kann.

## Lokalität

CPPS müssen in geringstmöglicher Zeit Betriebs- und Prozessdaten der Maschine analysieren, bewerten und in den Produktionsprozess eingreifen können.
Die Synchronisation des virtuellen Modells der Realität wird jedoch durch stetig wachsende Datenvolumina aufgrund steigender Geräteanzahl erschwert.
Damit verlangsamt sich die Verarbeitung der Daten mit der geografischen Entfernung zwischen Gerät und System.
Bei der Integration von Altmaschinen muss demnach die Datenanalyse, -persistenz und Historie, sowie die Reaktion auf dadurch erkannte Veränderungen möglichst nahe an der Anlage geschehen.
Läuft eine Rückkopplungsschleife direkt an der Maschine, muss außerdem nur ein Teil der anfallenden Daten veräußert und die Kontrolle nur teilweise an hierarchisch übergeordnete Systeme abgegeben werden (vgl. zu diesem Absatz @Bonomi2012).
Durch den verminderten Austausch zwischen den Systemen werden die Sicherheit der Daten verbessert und Kommunikationsfehler minimiert (vgl. @Wang2004).

R4
: Die Erfassung und Persistierung anfallender Betriebs- und Prozessdaten, sowie die Interpretation von Maschinenbefehlen geschieht geografisch nahe der Anlage, wodurch zeitliche Latenzen, Kommunikationsaufwände und -fehler minimiert werden.

Auch wenn die Zeit für die Kommunikation von Steuerbefehlen und Sensordaten durch die Nähe zur Maschine minimiert wird, ist weder harte noch weiche Echtzeit ein Kriterium.
Es wird davon ausgegangen, dass die Interpretation und Ausführung der Maschinenbefehle, sowie die Aggregation der Daten, direkt an der Maschine geschieht.
Um in adäquater Zeit reagieren zu können, unterliegen die für CPPS erforderlichen Kontrollschleifen damit ebenfalls dem Lokalitätskriterium @Bonomi2012.

## Integrationshardware

Die Leistungsfähigkeit von Einplatinencomputern, wie dem Raspberry Pi[^raspberry] oder Arduino[^arduino], sowie deren Tauglichkeit im Bereich der Maschinensteuerung (vgl. @Grigoriev2016), ist in der industriellen Fertigung nicht zu ignorieren.
Die Ökonomie eines Fertigungssystems hängt unmittelbar an den Kosten für zusätzliche Hardware, wodurch preisgünstige, eingebettete Systeme, nicht nur durch cyber-physische Produktion, an Attraktivität gewinnen [@Lee2008;@Kargermann2013].
Weiterhin können Einplatinencomputer durch Echtzeitbetriebssystemen auch zeitkritische Steuerungsaufgaben (vgl. @sec:speicherprogrammierbare-steuerung) übernehmen.
Demnach müssen Einplatinencomputer (Single-Board Computer) für das hardwareseitige Retrofitting eingesetzt werden.

R5
: Einplatinencomputer werden als zusätzliche Hardware zum Retrofitting eingesetzt, wodurch die Kosten der Modernisierungsmaßnahmen gering ausfallen.

[^raspberry]: [raspberrypi.org](https://www.raspberrypi.org/) (abgerufen am 10.11.2016)
[^arduino]: [arduino.cc](https://www.arduino.cc/) (abgerufen am 10.11.2016)

# Forschungsstand

Nach der Spezifikation der Zielvorgaben werden in diesem Kapitel der aktuelle Stand der Technik, sowie bereits bestehende Forschungsarbeiten zum Thema erläutert und mit den aufgestellten Kriterien für eine Lösung abgeglichen.

## Überwachung des Maschinenbetriebs

In cyber-physischen Produktionssystemen ist Adaptivität durch Rückkopplung zentrales Element.
Doch um korrigierend auf einen Produktionsprozess wirken zu können, muss der Zustand des physischen Systems bekannt sein. 
Dieser wird durch Sensorik an der Maschine erfasst und in einem Modell persistiert (vgl. zu diesem Absatz @sec:cyber-physische-produktionssysteme).

![Messgrößen bei der Maschinenüberwachung aus @Teti2010](figures/monitoring-kategorien){#fig:monitoring-kategorien}

Vielschichtige Möglichkeiten dieser Art der Erfassung von Betriebs- und Prozessdaten wurden über die Jahre untersucht.
Einen aktuellen Überblick hierzu veröffentlichten Teti et al. @Teti2010.
Für die Datenaggregation werden im Kontext dieser Arbeit direkte und indirekte Messmethoden mittels Sensorik betrachtet.
Bei einer direkten Messung werden Parameter wie Leistungsaufnahme, Drehzahl eines Motors oder die Position erfasst.
Indirekte Messungen hingegen sind dem Prozess näher und erfassen Daten wie die auf ein Werkzeug wirkende Kraft, Temperaturen am Werkstück oder Vibrationen.
@fig:monitoring-kategorien stellt diese beiden Kategorien am Beispiel einer Werkzeugmaschine dar.
Weitere von Teti et al. untersuchte Forschungsgebiete befassten sich mit Signalverarbeitung und Sensordatenfusion, der Kategorisierung von Messpunkten (Monitoring Scopes) und der Entscheidungsfindung bezüglich konkreter Reaktionen auf sich ändernde Zustände (vgl. zu diesem Absatz @Teti2010).  
Eine andere ausführliche Studie zu Arbeiten der Fertigungsprozessüberwachung wurde von Liang et al. veröffentlicht.
Sie kategorisierten Forschungsarbeiten nach der Anwendung auf konkrete Anwendungsfälle (vgl. zu diesem Absatz @Liang2004).  
Einen konkreten Anwendungsfall zur Signalverarbeitung untersuchten Deshpande und Pieper bei Altmaschinen.
Ihr Ziel war eine nicht-invasive Methode der Echtzeitüberwachung über die Stromaufnahme.
Die in Kilowatt eingehenden Verbrauchsdaten wurden durch an Bedingungen gekoppelte Schwellwerte in Status (an, aus, Leerlauf), Energieverbrauch, Werkzeugwechsel und Werkstückdurchsatz unterschieden.
Via TCP und UDP konnten diese Informationen zur Weiterverarbeitung an Fremdsysteme übergeben werden.
Für die Case Study und einen anschließenden Vergleich hatten Deshpande und Pieper auch moderne Maschinen mit der UPC ausgestattet (vgl. zu diesem Absatz @Deshpande2011).  
Der abstrakte Weg vom Produktionsprozess bis zur Quantifizierung des Werkzeugzustands wurde durch Ambhore et al. beschrieben.
Vom physischen Prozess ausgehend erfassen Sensoren unterschiedliche Werte, die durch Signalanalysen und Klassifikation zur Beschaffenheit des Werkzeugs führen (vgl. @fig:tcm-flow).
Zu jedem dieser Schritte des Tool Condition Monitoring (TCM) erläutern die Autoren aktuelle Forschungsarbeiten und belegen die ökonomische Relevanz (vgl. zu diesem Absatz @Ambhore2015).  

![Tool Condition Monitoring-System nach @Ambhore2015](figures/tcm-flow){#fig:tcm-flow}

Durch einer Instanz dieses Prozesses wurden indirekte Datenaggregation, Signalverarbeitung und TCM insgesamt am Beispiel von CNC-Maschinen in der Dissertation von Lee erforscht.
In seiner Arbeit untersucht und verglich er zahlreiche Sensorsysteme und analysierte durch neuronale Netzwerke und statistische Regression den Zustand des Werkzeugs (vgl. zu diesem Absatz @Lee2006).  
Fusion von Sensordaten in einer Fallstudie war Schwerpunkt der Arbeit zu TCM von Downey et al. 
Die Verortung und Signalkorrelation von Akustikemissions-, Vibrations- und Kraftsensorik ermöglicht das Erkennen von schlechten und guten Fräsverhältnissen.
Sie berücksichtigten dabei auch den aktuell ausgeführten CNC-Befehl (vgl. zu diesem Absatz @Downey2016).  

Die Konzepte und Zusammenfassungen von Teti et al. @Teti2010, Deshpande und Pieper @Deshpande2011, Ambhore et al. @Ambhore2015, Lee @Lee2006, Liang et al. @Liang2004 und Downey et al. @Downey2016 dienen der Kategorisierung von Überwachungsmöglichkeiten.
Der Rahmen dieser Arbeit endet mit dem Erfassen des Sensor-Signals im Modell von Ambhore et al. (vgl. @fig:tcm-flow).

## Steuerung von Fertigungssystemen 

Die Kontrolle von Werkzeugmaschinen geht von einem Computer aus, der CNC und interne speicherprogrammierbare Steuerungen (SPS) über eine proprietäre Schnittstelle oder Direct Numerical Control (DNC) mit Befehlen versorgt @Hirsch2000.
Während der erste Fall kaum Schwerpunkt aktueller Forschung ist, wurden DNC-Protokolle für die Fertigungsintegration detailliert beleuchtet.  
Ferrolho et al. legten den Fokus auf die Integration von Maschinen in flexible Fertigungssysteme (FFS) @Ferrolho2005.
Dazu untersuchten sie proprietäre DNC-Protokolle zweier CNC-Anlagen und konzeptionierten ein abstrahierendes Framework.
Sowohl die Steuerung der CNC, als auch der über DNC verfügbare Überwachungsmechanismus, kann über ein Netzwerk und somit aus der Ferne bedient werden.
Die anfallenden Daten werden auch für die Rückkopplung der Steuerung verwendet (vgl. zu diesem Absatz @Ferrolho2005).
Durch die Ethernet-basierte Kommunikation über DNC sind die Anforderungen R1 und R2 erfüllt (vgl. @sec:anforderungen).
Da bei der Abstraktion des DNC-Protokolls keine standardisierten Informationsmodelle und Kommunikationsmechanismen verwendet wurden, gilt R3 für dieses Konzept nicht.
Die Verortung und Art der Persistenz eingehender Daten ist in der Arbeit von Ferrolho et al. nicht beschrieben, womit R4 ebenfalls nicht erfüllt ist.
R5 ist nicht erfüllt, da als Integrationshardware, beziehungsweise Steuerungssysteme PCs verwendet werden.  <!-- WORK -->
Eine Sammlung von Softwarewerkzeugen für die Steuerung von Robotern, Fräs- und Drehmaschinen entwickelten Ferrolho et al. zwei Jahre später @Ferrolho2007.
Sie erkannten die Notwendigkeit von DNC-Adaptern und schufen ein erweitertes Framework für die verteilte Kontrolle dieser Produktionsmaschinen.
Die Generizität der dabei entstandenen Softwarearchitektur wurde in einem Fallstudie mit fünf Anlagen verifiziert und erlaubt die Integration, unabhängig von Hersteller und verwendetem Protokoll (vgl. zu diesem Absatz @Ferrolho2007).
Dennoch wurde auch in dieser Arbeit kein Standard verwendet (R3) und Lokalität (R4) nicht diskutiert, weswegen sie hier als Erweiterung des vorangegangenen Konzepts verstanden wird.  
Die Standardisierung von Kommunikationsprotokollen und Informationsmodellen ist eine Forderung der Industrie 4.0 @Adolphs2015.
Somit müssen auch bei der Aufbereitung der Steuerung einer Altmaschine etablierte Standards beachtet werden.

![Flexible Fertigungszelle des IFT Wien @Ayatollahi2013](figures/ffz-ift){#fig:ffz-ift}

Ayatollahi et al. entwickelten eine CNC-Steuerungsvariante auf Basis eines DNC-Protokolls mit OPC UA (vgl. @sec:opc-unified-architecture) @Ayatollahi2013.
Für die Integration einer Drehmaschine in ein FFS, wurde ein Informationsmodell entworfen.
Ein Server, verantwortlich für die Aktualisierung des Laufzeitmodells des Maschinenkontexts, hält die Verbindung zur Maschine und stellt die physikalischen Informationen und Methoden zur Kontrolle der CNC bereit.
@fig:ffz-ift zeigt den konzeptuellen Aufbau des Systems am Institut für Fertigungstechnik der TU Wien.
Weiterhin wurde ein OPC UA Frontend für den speziellen Fall der Maschinensteuerung entwickelt (vgl. zu diesem Absatz @Ayatollahi2013).
Die Autoren verifizierten den Anwendungsfall der Steuerung von CNC-Maschinen mit einem in der Industrie etablierten Standard [@OPCFoundation2014;@Hoppe2014].
Durch die Verwendung von OPC UA sind die Anforderungen R1-3 vollständig erfüllt.
Das Lokalitätskriterium ist bezüglich der Erfassung von Maschinendaten erfüllt.
OPC UA beinhaltet auch die Spezifikation von Historie und beantwortet damit auch die Persistenzfrage.
Analyse und Rückkopplung sind nicht Teil des Konzepts von Ayatollahi et al. und müssen durch Subsysteme implementiert werden.  
Zum Einsatz von Robotern innerhalb FFS forschten Pauker et al.
Sie entwarfen ein Konzept, ähnlich dem von Ayatollahi et al., für die Steuerung und Überwachung von Robotern @Pauker2014.
Die proprietäre Software des Roboters wird durch einen OPC UA Server gekapselt.
Ein Informationsmodell bildet den Roboter mit Funktionalität und Zuständen in Form von Variablen ab.
Ändert sich zur Laufzeit das vom Roboter eingesetzte Werkzeug, wird dies auch im Informationsmodell widergespiegelt.
Das Fehlen standardisierter Steuerungsschnittstellen wird den Autoren nach durch OPC UA ausgeglichen.
Außerdem existierte damit eine semantische Beschreibung der Komponenten eines Roboters (vgl. zu diesem Abschnitt @Pauker2014).
Aufgrund des Fokus auf Produktionsmaschinen wird die Steuerung von Robotern in dieser Arbeit nicht weiter betrachtet.
Die Weiterentwicklung des Konzepts der Steuerung beliebiger Maschinen über OPC UA bestärkt jedoch dessen Eignung für die Integration von Altmaschinen.  
Auch ältere SPS profitierten von der Beschreibung von Struktur und Funktionalität durch OPC UA.
Durch die Zusammenarbeit des PLCopen Konsortiums und der OPC Foundation (vgl. @sec:speicherprogrammierbare-steuerung) wird außerdem die Programmierung von SPS mit OPC UA möglich.  

![Service-orientierte Steuerungslogik nach @Windmann2015](figures/soa-steuerung){#fig:soa-steuerung}

Auf Basis von OPC UA stellte Windmann et al. das in @fig:soa-steuerung abgebildete, Service-orientierte Steuerungskonzept für die Automatisierung von Feldgeräten mit SPS vor @Windmann2015.
Der Fokus lag dabei auf Plug & Produce, wodurch sich das Gerät eigenständig in die Infrastruktur integriert, konfiguriert und arbeitet.
Aufgaben die für eine Programmierung mit IEC 61131-3 (vgl. @sec:speicherprogrammierbare-steuerung) zu komplex sind, werden mit einem Softwareagenten plattformunabhängig abgebildet.
Die Ein- und Ausgabe, sowie die Kommunikation über einen Feldbus übernimmt die Maschinensteuerung.
Mit einer Fallstudie zur Bewegungssteuerung mit SPS verifizierten die Autoren das Konzept (vgl. zu diesem Absatz @Windmann2015).
Die vorgestellte Schichtenarchitektur (vgl. @fig:soa-steuerung) kann nach entsprechenden Anpassungen für das Retrofitting eines Feldgerätes im Kontext cyber-physischer Produktionssysteme (CPPS) genutzt werden.
Durch die Verwendung von OPC UA sind die Anforderungen R1-3 erfüllt.
Der Software-Agent als Teil der Geräteabstraktion lässt neben der lokalen Datenhaltung auch komplexere Logik für Rückkopplungsschleifen zu, wodurch R4 erfüllt ist.

## System- und Softwarearchitektur flexibler Produktion

Überwachung und Steuerung einzelner Maschinen muss im Kontext einer Produktionsumgebung mit vielen heterogenen Feldgeräten betrachtet werden.
Die Software- und Systemarchitektur des Gesamtsystems nimmt damit eine zentrale Rolle bei der Integration von Altmaschinen ein.  
Wang et al. entwickelten eine offenen Architektur für die Echtzeitüberwachung und -kontrolle von im Netzwerk befindlichen CNC-Maschinen über eine grafische Schnittstelle mit 3D Repräsentation @Wang2004.  
Ein Web-basierter Thin-Client des _Wise-ShopFloor_ ermöglicht die Kontrolle und Überwachung der Maschinen über ein dreidimensionales Modell der Fertigungsstrecke.
Das darunterliegende Framework basiert auf einer Client/Server-Architekturstil und verwendet seitens des Servers das MVC-Entwurfsmuster.
Maschinen werden über das Fabriknetzwerk mit dem Server verbunden und sind somit vom Internet getrennt.
Bei der Verwendung mehrerer Clients wird für das Routing ein Publish/Subscribe Mechanismus über HTTP-Streaming eingesetzt.
Mit Hilfe dessen wird das Verhalten des auf Java 3D basierenden Visualisierungsmodells durch Sensorik an den Machinen beeinflusst.
In der von Wang et al. durchgeführten Case Study wurde unter Verwendung einer CNC-Fräsmaschine die Tauglichkeit des Konzepts verifiziert.
Die Schnittstelle zwischen Server und Maschine wurde durch einen _Open Architecture Controller_[^oac] bereitgestellt (vgl. zu diesem Absatz @Wang2004).  
Durch Verteilung von Steuerung und Überwachung der Maschine auf im Netzwerk befindliche Clients, sowie die browserbasierte Nutzungsschnittstelle, werden die Anforderungen R1 und R2 (vgl. [@sec:überwachung;@sec:steuerung]) vollständig erfüllt.
Ein Standard wird mit der Kommunikation via HTTP verwendet, während Informationsprotokoll und -modell nicht näher erläutert wird.
Damit ist R3 nur ansatzweise erfüllt.
Da aber Persistenz von Prozess- und Betriebsdaten von einem dedizierten Datenserver übernommen wird, ist das Lokalitätskriterium (R4) nur teilweise erfüllt.  
Handelt es sich, wie in einem flexiblen Fertigungssystem (FFS), um einen Verbund von Maschinen, werden Rekonfigurierbarkeit und flexible Datenhaltung architektonisch relevant.
Die Heterogenität und Austauschbarkeit der Feldgeräte (vgl. @sec:fertigung-und-automatisierung) muss zur Laufzeit berücksichtigt werden.
Unter dieser Maßgabe entwarfen Pauker et al. eine Kommunikations- und Integrationsarchitektur für die Montage und Konfiguration einer Fertigungszelle auf Informationsebene @Pauker2013.
Das Design beinhaltet ein Informationsmodell, sowie zentrale Datenhaltung für die Komponenten einer Zelle.
@fig:vgl-arch-ffz stellt den Unterschied zwischen einem herkömmlichen und dem Fertigungssystem von Pauker et al. dar.

![Vergleich der Architekturen von Fertigungszellen aus @Pauker2013](figures/vgl-arch-ffz){#fig:vgl-arch-ffz}

In ihrem Konzept werden die unterschiedlichen Kommunikationskanäle, wie Feldbusse, serielle und digitale Ein-/Ausgabe-Schnittstellen, durch ein TCP/IP-Protokoll auf Ethernet-Basis vereinheitlicht.
Aus dem Bereich der intelligenten Systeme übernahmen die Autoren das Blackboard-Konzept (vgl. @HayesRoth1985) für den Informationscache, respektive die zentrale Datenhaltung.
Parameter für die Kommunikation, der Maschinenstatus, das aktuelle Programm, sowie Informationen zu angeschlossenen Geräten werden hierfür in einer XML-Datei abgelegt.
Eine Sequenzkontrollkomponente legt seine Forderungen (z.B. starte CNC-Programm) in dieser Datei ab, wodurch andere ihre Aufgaben eigenständig abholen und wahrnehmen können.
Komponenten des FFS werden durch ein adaptierendes, nicht standardisiertes Protokoll angebunden.
Dieser Ansatz reduziert die Komplexität der Gerätetopologie und führt zu einem geringen Konfigurationsaufwand (vgl. zu diesem Absatz @Pauker2013).  
Steuerung und Überwachung können mit dem Blackboard auch aus der Ferne geschehen, womit R1 und R2 erfüllt sind.
Standardisierung ist nicht Teil des Konzepts, soll aber mit einer OPC UA-Anbindung durchgesetzt werden.
Gleiches gilt für die Lokalität von Daten und Logik, wodurch die Anforderungen R2 und R3 nicht erfüllt sind.
Für Retrofitting relevant ist die Arbeit im Bezug auf die zur Laufzeit mögliche Rekonfiguration der Komponenten.  
Während Pauker et al. die horizontale Vereinheitlichung der Kommunikation anstreben, forschten Moctezuma et al. an vertikalem und horizontalem Informationsaustausch @Moctezuma2012.
Dafür modernisierten die Autoren die Fastory Forschungsfertigungsstrecke.
Wenn die zur Steuerung notwendige Echtzeit nahe der Maschine bereitgestellt wird, können Web-Services die Anlagen für den abstrakteren Informationsaustausch kapseln.
Die ursprünglich heterogene Feldgerätelandschaft wurde durch eine Service-orientierte Architektur (SOA) ersetzt.
Ziel des Konzept ist unter anderem die Einsparung von Energie, Flexibilisierung und Rekonfigurierbarkeit, die Fähigkeit der eigenständigen Wiederherstellung nach Ausfall und Fehler (self-recovery), sowie prädiktive Wartung (predictive Maintenance).
Eine zentrale Anforderung an die Schnittstellen der Geräterepräsentation ist, neben Skalierbarkeit und Homogenität, die lokale Verarbeitung von Daten.
Intelligente Remote Terminal Units (RTU), wie auf der rechten Seite der @fig:rtu-retrofitting, kapseln dazu das industrielle Equipment.

![Equipment ohne und mit RTU-Retrofitting aus @Moctezuma2012](figures/rtu-retrofitting){#fig:rtu-retrofitting}

Das original-Equipment besteht aus der physischen Schicht (Physical) für Aktuatoren und Sensoren.
Darüber (Processing) werden die Daten umgewandelt -- bei einfachen Sensoren auch ohne Verarbeitung durchgereicht.
Die Schnittstellenschicht (Interface) bindet das Gerät an ein Bussystem, digitale Ein-/Ausgabesysteme oder andere, teils proprietäre Kommunikationsmedien (vgl. @sec:fertigung-und-automatisierung).
Mit der aufsetzenden RTU wird zuerst eine, zum jeweiligen Medium kompatible Schnittstelle eingesetzt.
Eine flexibel anpassbare Schicht für die lokale Datenverarbeitung und Logik stellt die Intelligenz der RTU.
Durch die Kommunikationsschicht werden dann Informationen, anstelle der Daten des original-Equipments weitergereicht und konsumiert.
Eine RTU kann außerdem mehrere funktional zusammengehörige Geräte zu einer logischen Einheit verbinden (vgl. zu diesem Absatz @Moctezuma2012).  
Das Konzept von Moctezuma et al. erfüllt alle Anforderungen, basiert aber im Gegensatz zu Windmann et al. auf Web-Services.  
Die Kombination aus Rekonfigurierbarkeit (@Pauker2013), Web-Service-basierter Kapselung von Feldgeräten (@Moctezuma2012) und der lokalen Informationsgewinnung aus Anlagen-Rohdaten untersuchten Dürkop et al. im Kontext von SOA @Durkop2014.
Die vorgeschlagene Architektur ermöglicht Plug-and-Produce, respektive die automatische Rekonfiguration nach physischen Veränderungen auf Basis abstrakter Prozessdefinitionen.
Da industrielle Automation beispielsweise Echtzeitkommunikation erfordert, ist eine reine SOA-Lösung unzureichend.
Ein Vorteil von Web-Services besteht in der Möglichkeit der Kombination zu abstrakten Diensten.
Der Produktionsprozess bestünde aus der Komposition mehrerer Fertigungszellen und Transportsysteme.
In vorgestellten Konzept wird daher die strikte Trennung von Web-Service Modul und Echtzeit-Gerätekontrolle postuliert, dargestellt in @fig:module-field-level.

![Aufteilung von Geräten in Automatisierungsmodule @Durkop2014](figures/module-field-level){#fig:module-field-level}

Ein Modul ist eine mechatronische Einheit, die abstrakte Funktionalität, beziehungsweise Dienste, externalisiert.
Die Implementierung der Funktionen ist gekapselt und besteht aus Sensoren, Aktuatoren und einer Kontrollkomponente.
Echtzeitkommunikation wird zwischen den Geräten, nicht aber zwischen den Modulen bereitgestellt.
Die Schnittstelle der beiden Schichten wird durch OPC UA bereitgestellt.
Dürkop et al. erläutern einen möglichen Arbeitsablauf in dem eine Prozessdefinitionssprache, wie die Business Process Execution Language (BPEL), den übergeordneten Produktionsablauf beschreibt.
Anhand derer ermittelt eine Orchestrierungskomponente die für den Prozess benötigten Dienste auf Modulebene.
Identifizierte Dienste werden mithilfe eines Diensteverzeichnis (Service Directory) ausgewählt (vgl. zu diesem Absatz @Durkop2014).  
Überwachung und Steuerung werden von entfernten Subsystemen teilweise übernommen.
Feingranulare Logik zur Kontrolle des einzelnen Geräts wird lokal verortet und übermittelt Informationen durch standardisierte Protokolle.
Damit sind alle Anforderungen erfüllt, wodurch die beschriebene Architektur für die Modernisierung von Altanlagen tauglich ist.  
Die bisher vorgestellten Arbeiten bereiten industrielles Equipment auf den Einsatz in CPPS vor, thematisieren ihn aber nicht.
Für die Integration von Altmaschinen in ein CPPS wird eine dedizierte Architektur benötigt.
Die fünf-Schichten CPS-Struktur (5C-Architektur) von Lee et al. liefert eine Leitfaden zu Entwicklung und Deployment von cyber-physischen Systemen (CPS) für die Produktionsdomäne @Lee2015.
Die unterste Ebene (Smart Connection) dient der zuverlässigen und akkuraten Erfassung von Daten der Maschinen und Komponenten, sowie deren Ethernet-basierte Kommunikation.
Darauf aufbauend (Data-to-Information Conversion) werden die Daten in Informationen gewandelt.
Inferenzsysteme und intelligente Analysen dienen hier der Ausfall- und Leistungsvorhersage und führen zur Selbstwahrnehmung (self-awareness) des Equipments.
Die folgende Cyber-Schicht bietet digitale Zwillinge der Maschinen und ihrer Komponenten.
Sie vergleichen die Leistungsmerkmale ihres physischen Äquivalents mit denen anderer Maschinen (self-compare), führen eine Historie (Time-Machine) und stellen eine cyber-physische Schnittstelle (Cyber-Physical Interface, CPI) für die Machine-to-Machine, beziehungsweise M2M-Kommunikation.
Auf einer darüber liegenden Schicht der Kognition, werten Systeme zur Entscheidungsfindung (Decision Support Systems, DSS) zur Unterstützung des Nutzers die Informationen der Cyber-Schicht aus.
Auch die Simulation und Synthese weiterer Schritte zählt zu den Aufgaben der Cognition-Ebene.
Die oberste Schicht (Configuration) ist als Kontrollinstanz verantwortlich für die Rückkopplung des physischen Raums in das virtuelle Modell.
Das Konzept der Time-Machine der Cyber-Ebene verwaltet Momentaufnahmen des erfassten Kontextes (Snapshot Collection) und verhilft dem System zu einer kumulierten Maschinenhistorie.
Dadurch kann das aktuelle Verhalten mit bereits bekanntem verglichen werden (Similarity Identification) und ermöglicht Vorhersagen.
Durch Simulation können Verhaltensmuster für Szenarien extrapoliert und optimierte Schritte synthetisiert werden (vgl. zu diesem Absatz @Lee2015).  
Aufgrund der abstrakten Beschreibung einer Schichtenarchitektur werden die Anforderungen nur teilweise erfüllt.
Die Time-Machine läuft nicht zwangsläufig nahe der Maschine.
Dennoch erfolgen Zustandserfassung und Störfalldiagnose durch Subsysteme des CPPS, womit R1 erfüllt ist.
Die Steuerung von industriellem Equipment ist kein Teil des Konzepts und erfüllt demnach R2 nicht.
R3 ist nicht erfüllt, da standardisierte Informationsprotokolle und Modelle nicht integriert wurden.
Die Verortung von Daten und Logik ist zweigeteilt.
Anforderung R4 ist teilweise erfüllt, da Zustandsüberwachung, sowie Ausfall- und Leistungsvorhersage an der Maschine geschehen, jedoch die Cyber-Ebene den zentralen Knotenpunkt für die Historie aller Geräte bildet.
Insgesamt bietet der Ansatz von Lee et al. eine architektonische Basis für CPS in der Produktion.

[^oac]: Steuerungskomponente, die Modifikationen über das API hinaus zulässt @Yonglin2004

## Zusammenfassung

Die Überwachung und Steuerung von Produktionsmaschinen für Anwendungen in der Industrie 4.0 ist Teil unterschiedlicher Forschungsprojekte.
Im Projekt OPC4Factory der TU Wien, wurden generische OPC UA Informationsmodelle entwickelt.
Diese verbessern die Konnektivität von NC-Maschinen, Industrierobotern und anderen Komponenten innerhalb einer flexibel automatisierten Fertigungszelle.
Die Orchestrierung der Fertigungsoperationen, sowie die Konfiguration der Komponenten soll durch die Lösung der Schnittstellenproblematik vereinfacht werden (vgl. zu diesem Absatz @OPC4Factory).  
Die Integration bestehender Hardware in die intelligente Steuerung einer Fabrik ist Thema des RetroNet-Projekts. Das Fraunhofer IPK entwickelt mit Industriepartnern physische und logische Adapter für die Anbindung von bestehenden Anlagen an eine Steuerungsplattform. Maschinen-, Anlagen und Produktionsdaten werden zu diesem Zweck zentral erfasst und gespeichert. Weiterhin soll eine Middleware im Client-Server-Architekturstil Dienste und zugrunde liegende Teilsysteme miteinander verbinden und eine vermittelnde Rolle im Gesamtsystem einnehmen (vgl. zu diesem Absatz @FraunhoferIPK2016).  
Forschung im Bereich Cloud-basierter Industriesteuerung wird in Zusammenarbeit von Fraunhofer, der TU Berlin und Industriepartnern betrieben. Im Projekt pICASSO werden die Auslagerung von Steuerungsdiensten in die Cloud und Möglichkeiten einer Verteilung und Modularisierung herkömmlicher Kontrollsysteme auf CPS-Komponenten untersucht (vgl. zu diesem Absatz @piCASSO).  
Der Schwerpunkt eines Großteils aktueller Forschung liegt auf der Vereinheitlichung der Schnittstellen und deren Durchsetzung -- meist mittels Software-Adaptern.
Die Gemeinsamkeit aller vorgestellten Architekturkonzepte liegt in der Verwendung von Maschinenrepräsentanten. 
Auch die Aufteilung einer solchen Repräsentation in zwei Schichten ist etabliert.
Der Echtzeit-Kontakt zur physischen Welt wird durch eine bereitgestellt.
Intelligentes Informationsmanagement, Analyse- und Rechenfähigkeit durch die andere @Monostori2016.
Das Referenzarchitekturmodell RAMI4.0 der VDI/VDE-Gesellschaft beschreibt diese Komponente als I4.0-Komponente mit virtueller Verwaltungsschale @Adolphs2015.  
Nahezu alle betrachteten Forschungsarbeiten erlauben die Steuerung und Überwachung durch Nutzungsschnittstellen oder Subsysteme eines Produktionssystems.
Standards werden oft gefordert, stehen jedoch meist nicht im Zentrum der wissenschaftlichen Betrachtungen.
Hervorzuheben ist hierbei die Verwendung der etablierten OPC Unified Architecture (vgl. @sec:opc-unified-architecture).
Aktuelle Feldgeräte besitzen entweder einen eingebetteten OPC UA Server, sind darauf vorbereitet oder können mit zusätzlicher Peripherie[^ibh-link] und Software[^ignition-opcua] ausgestattet werden.
Somit liegt die Verwendung dieser Spezifikationen für die Steuerung von Produktionskomponenten nahe und muss in ein Konzept für die Integration von Altmaschinen einfließen.

<!-- TODO: R5 Bla bla -->

Die Gegenüberstellung von Anforderungen und bestehenden, für das folgende Konzept relevanten, Forschungsarbeiten ist in @tbl:sota-req zusammengefasst, wobei ● die Erfüllung, ◐ die eingeschränkte oder teilweise Erfüllung und ○ die Nichterfüllung symbolisiert.

+-------------------+------+------+------+------+------+
|                   | R1   | R2   | R3   | R4   | R5   |
+===================+======+======+======+======+======+
| @Ferrolho2005     | ●    | ●    | ○    | ○    | ○    |
+-------------------+------+------+------+------+------+
| @Ayatollahi2013   | ●    | ●    | ●    | ◐    | ○    |
+-------------------+------+------+------+------+------+
| @Windmann2015     | ●    | ●    | ●    | ●    | ○    |
+-------------------+------+------+------+------+------+
| @Wang2004         | ●    | ●    | ◐    | ◐    | ○    |
+-------------------+------+------+------+------+------+
| @Pauker2013       | ●    | ●    | ○    | ○    | ○    |
+-------------------+------+------+------+------+------+
| @Moctezuma2012    | ●    | ●    | ●    | ●    | ○    |
+-------------------+------+------+------+------+------+
| @Durkop2014       | ●    | ●    | ●    | ●    | ○    |
+-------------------+------+------+------+------+------+
| @Lee2015          | ●    | ○    | ○    | ◐    | ○    |
+-------------------+------+------+------+------+------+

: Anforderungen bzgl. bestehender Forschungsarbeiten {#tbl:sota-req}

[^ibh-link]: [opcfoundation.org/products/view/ibh-link-ua](https://opcfoundation.org/products/view/ibh-link-ua) (abgerufen am 8.11.2016)
[^ignition-opcua]: [inductiveautomation.com/scada-software/scada-modules/ignition-core-modules/ignitionopc](https://inductiveautomation.com/scada-software/scada-modules/ignition-core-modules/ignitionopc) (abgerufen am 8.11.2016)

# Konzeption

Nach der Analyse bestehender Forschungsarbeiten folgt in diesem Kapitel die Konzeption einer Lösung zu den in @sec:einleitung beschriebenen Problemen unter Berücksichtigung der Anforderungen aus @sec:anforderungen und Konzepten aus @sec:forschungsstand.
Ein Softwareartefakt und seine Einbettung in eine System- und Softwarearchitektur werden vorgestellt.
Die verschiedenen Perspektiven auf den Entwurf werden durch das 4+1 Software-Architekturmodell nach Kruchten gegliedert @Kruchten1995.
Eine virtuelle Maschinenrepräsentation (VMR) bildet die Schnittstelle zur Altanlage, beziehungsweise zu ihren automatisierten Werkzeugkomponenten (AWK) und damit den Schwerpunkt des hier vorgestellten Designs.
Repräsentanten der berücksichtigten Maschinen sind in Szenarien beschrieben.
Die Arbeit im Kontext dieser Szenarien und die Aufteilung der Aufgaben unter den Produktionsbeteiligten wird durch Anwendungsfälle skizziert.

## Szenarien

##### S1 -- Werkzeugmaschine ohne Schnittstellen.

Besitzt die Altanlage keinerlei Schnittstellen, können weder CNC noch AWK von außen beeinflusst werden.
Die CNC ist fest mit der Antriebssteuerung verdrahtet und die maschineneigene SPS für AWK ist dem Entwickler verborgen.
Auch die notwendigen Daten zur Überwachung des Fertigungsprozesses können nicht durch externe Systeme bezogen werden.
Ein serieller RS-232 oder Parallelport verbindet lediglich die Steuerungseinheit mit der SPS.
Somit ist außer dem Lokalitätskriterium (vgl. @sec:lokalität) keine der Anforderung erfüllt.
Für solche Anlagen muss eine standardkonforme Schnittstelle und deren Anbindung an CNC und AWK vollständig durch die VMR bereitgestellt werden.

##### S2 -- Werkzeugmaschine mit Direct Numerical Control.

_Direct Numerical Control_ (DNC) erlaubt das sukzessive Übertragen der CNC-Befehle an die Maschine (vgl. @sec:numerische-steuerung).
Trotz der damit physisch kompatiblen Datenverbindung zur Anlage, sind unterschiedliche, meist proprietäre, Kommunikationsprotokolle für DNC üblich @Alting1994.
Die maschineneigene SPS ist verantwortlich für AWK wie Türautomatik oder Kühlsystem.
Dem Entwickler steht keine Schnittstelle für diese zur Verfügung.
Somit muss neben Adaptern für die DNC-Protokolle eine SPS-Anbindung durch die VMR umgesetzt werden, sofern die DNC jene nicht bereits kapselt.  
Sowohl Ayatollahi et al., als auch Ferrolho et al. nutzten für die Umsetzung ihres Konzepts die Drehmaschine _EMCO Concept Turn 55_, an der auch dieser Anwendungsfall orientiert ist (vgl. [@Ayatollahi2013;@Ferrolho2005], @sec:steuerung-von-fertigungssystemen).
Die in dieser Anlage verbauten AWK sind Einspann-, Luftdruck- und Kühlsystem, sowie eine Türautomatik.
Ein proprietäres, serielles DNC-Protokoll ermöglicht die Anbindung externer Systeme.
<!-- ASK
- CNC bleibt Maschinenspezifisch
- DIN 66025 für M-Befehle
- CNC Welt + SPS Welt einzeln betrachten => nummeriert 
-->

##### S3 -- Speicherprogrammierbare Steuerungen.

Beim Retrofitting von speicherprogrammierbaren Steuerungen werden in dieser Arbeit drei Fälle unterschieden.
Im aufwändigsten Fall besitzt die SPS keine Ethernetanbindung für Kommunikation via TCP/IP und arbeitet über einen Feldbus.
<!-- Das Nachrüsten modularer Steuerungen mit einer Netzwerkkarte sorgt für die Integration in ein Netzwerk. -->
Der zweite Fall von zu modernisierenden SPS setzt eine Netzwerkanbindung voraus, veräußert jedoch weder ein Informationsmodell noch standardisierte Kommunikationsprotokolle.
<!--Existiert, im zweiten Fall, eine physische Netzwerkverbindung, müssen 
Informationsmodelle und Protokolle definiert und über Teilsysteme Implementiert werden.
Selbiges gilt auch für Geräte der ersten Kategorie.-->
Im letzten Fall verfügt die SPS bereits über ein integriertes Informationsmodell und kommuniziert durch standardisierte Protokolle.
Gegebenenfalls müssen Adapter die Protokolle und Modelle zu einem, im Netzwerk einheitlichen überführen.
<!-- UML => OPC UA, etc. @Pauker2016 -->
<!-- ASK
- Werkzeugmaschine ist im Kontext weiterer Automatisierungseinrichtungen
- SPS soll genauso handhabbar sein
-->

## Anwendungsfälle

Die unterschiedlichen Anforderungen der mit dem System interagierenden Menschen werden in Anwendungsfällen deutlich, die auszugsweise aus den Personas von Denner et al. hervorgegangen sind @Denner2015.

##### A1 -- Produktionsleiter.

Wie in @fig:uc-produktionsleiter dargestellt, ist ein Produktionsleiter hauptsächlich für die Erstellung, Überwachung und Dokumentation von Produktionsplänen zuständig.
Er ist für eine reibungslos funktionierende Fertigungsstrecke verantwortlich und benötigt eine zusammenfassende Darstellung der Betriebs- und Prozessdaten  um auch Wartungsaufträge delegieren zu können.
Altmaschinen können diese Daten auch erfassen.
Jedoch lassen sie die Einsicht aus der Ferne aufgrund fehlender Infrastrukturanbindung nicht zu.

![Anwendungsfälle eines Produktionsleiters](figures/uc-produktionsleiter){#fig:uc-produktionsleiter}

##### A2 -- Montagearbeiter.

Ein Montagearbeiter ist neben dem Zusammensetzen einer Maschine verantwortlich für die Verwaltung und Reparatur der einzelnen Komponenten (vgl. @fig:uc-montagearbeiter).
Dafür muss er wissen, welche Teile verbaut werden sollen und wie diese zusammenhängen.
Eine einfache Stückliste leistet das nicht und muss bei der Anlagenmodernisierung durch ein digitales Modell der Zusammensetzung -- zugänglich auch für andere Teammitglieder -- abgebildet werden.
Bei modernen Anlagen ist der Maschinenhersteller ist für die Modellierung des Informationsmodells zur Maschinenstruktur und für die initiale Einrichtung verantwortlich.

![Anwendungsfälle eines Montagearbeiters](figures/uc-montagearbeiter){#fig:uc-montagearbeiter}

##### A3 -- Maschinenbediener.

Der Maschinenbediener richtet die Anlage ein (vgl. @fig:uc-maschinenbediener).
Er integriert sie in den Kontext der Produktionsstrecke und bindet sie an das bestehende Automatisierungssystem.
Kenntnis der technischen Schnittstellen für diese Integration entnimmt er dem digitalen Modell der Maschine.
Die detaillierte Darstellung des Systemzustands hilft einem Maschinenbediener bei der Überwachung des Fertigungsschritts und der Reaktion bei Störfällen.
Auch maschinenspezifische Anpassungen von CNC-Programmen werden von ihm verantwortet.

![Anwendungsfälle eines Maschinenbedieners](figures/uc-maschinenbediener){#fig:uc-maschinenbediener}



---

**MATERIAL**

Warum OPC UA? => @Izaguirre2011


@Windmann2015 vs. @Moctezuma2012:

* horizontale Integration mit OPC UA, wegen Verbreitung unter Feldgeräten
* vertikale Integration mit WS (BPEL etc. mgl.), wegen Verbreitung unter ERP/highlevel Services


> Specifications like Device Profile for
> Web Services (DPWS, @Moctezuma2012) and OPC Unified Architecture (OPC UA, @Windmann2015)
> are the most suitable solutions for implementing a Service
> Oriented Architecture (SOA) on the shop-floor level
> which includes eventing mechanisms

Orchestrierung? Überall Siemens Systeme => Was nun?

## Virtuelle Maschinenrepräsentation

* CNC
    1. DNC-Schnittstellenadapter
    2. Schrittmotoren und SERVOS => Adapter für Antriebssteuerung 
* Peripherie
    1. maschineneigene SPS ansprechen (OPC UA Wrapper) => eher vermeiden, CNC kapselt bereits
    2. Surrogate direkt an Sensor/Aktuator angeschlossen

* CNC
* automatisierte Werkzeugkomponenten (AWK)
* Überwachung
* Ethernetanbindung mit TCP/IP
* Surrogate ist standardisierendes Element


---

* System- und Softwarearchitektur
    - 
* Informationsmodell
  - Modellierung der Anlagenstruktur
  - Laufzeitmodell
* Überwachung
  - Datenaggregation und Persistenz
  - Bereitstellung von Informationen
* Steuerung
  - Numerisch kontrollierte Maschinen
  - SPS und automatisierte Komponenten
    1. kein Ethernet mit TCP/IP 
        + gekoppelt an Bus
        + SPS-Netzwerkkarten nachrüstbar
    2. Ethernet mit TCP/IP
        + Ignition OPC UA Modul
        + PLCopen Companion Specification für OPC UA
    3. integrierter OPC UA Server 
* Rückkopplung

---

* Regelbasierte Rückkopplung => anlernen dessen ist Engineering, nicht Forschung (kann man immer noch machen => Ausblick)
* Sensorwert-Thresholds für Anomaly Detection
* Distributed NC!

* Umwandlung von Daten zu Informationen?? (vgl. @Lee2015)

* http://www.sps-magazin.de/?inc=artikel/article_show&nr=92951 (OPC UA für S5 & S7)
* https://www.traeger.de/industrial-ethernet/s7-lan-mpi-lan.html (TCP/IP & OPC UA für S7)
* https://en.wikipedia.org/wiki/Ignition_SCADA#OPC-UA  (SW-Wrapper für SPS)
  The OPC-UA Ignition module is an OPC server that supports modular drivers for PLCs and other devices and network connections. It is the first 100% native Java OPC UA stack.[14] The OPC-UA module includes a Quick Client that allows users to read and write PLC register values via an AJAX web page hosted on the Ignition Gateway.
  Current drivers include A-B Suite, ModbusTCP, Siemens Ethernet, and Simple TCP/UDP, allowing users to connect to a multitude of devices such as PLCs, solar cells, lights, generators, flow meters, bar code scanners, etc.
  Inductive Automation offers the Ignition OPC-UA server for free. The required license must be obtained through the company web site or by direct contact.

* Laufzeitkonfiguration des Surrogate? 
* Surrogate in bestehende Netzwerkinfrastruktur einbinden?
    1. direkte SG-Kommunikation (Wifi-Direct, BT, ...) zur Konfiguation der Netzwerkanbindung via Mobile device
      1. Auswahl des Access-Points
      2. Festlegen der OPC UA Discovery-Service Adresse
    2. SG mit Infrastr. verbunden + Registrierung bei Discovery-Service
    3. OPC UA Systemevent => neues Surrogate registriert
    3. Konfiguration des Adressraums via HTTP/WebApp

* Controlling nicht aus der Cloud @... sondern an der Maschine  
    * CNC-Kernel auf dediziertem Controller  
      * Kernel muss nicht portiert werden (vgl. @Grigoriev2016)  
    * Echtzeit kein Problem (OPC UA kann's eh nicht)  
    * kein Feldbus, keine Koppler, kein DI/DO (vgl. @Grigoriev2016)  
    * Ethernet-basierte Kommunikation  
    
* Konzept eines _Cell Controller_ als Basis (vgl. [@Ayatollahi2013;@Fallah2016a])
* kein Maschinenspez. NC-Terminal => verteiltes System => entfernte Mensch-Maschine-Schnittstelle  (vgl. @Grigoriev2016)
* Rekonfigurierbare FFZ [@Pauker2013;@Durkop2014]
* Bisher OPC UA Server als Adapter zu proprietären Maschinenprotokollen 
    * Server <-> Maschine => Server <-> Adapter <-> Maschine ?
    * Smoothieboard/Embedded kompakte(soft-)SPS als Adapter zu Maschine
* Wiederverwendung @Ayatollahi2013
    * des Informationsmodells
    * des Flow-Charts für die Server-Logik (teilweise)
* Persistenzkonzept: Blackboard? @Pauker2013
* Kontrolle der Arbeitssequenz? (PROtEUS, BPMN/Activiti)

* Framework
    - Definition der Bindings von Extension Points in OPC UA Modell

* SPS siehe @Windmann2015 Bild 3
  - Surrogate+OPCUA-Modell auch für SPS (Programm übertragen, starten, reset, etc.)

> Unlike web services, OPC UA is currently integrated in a large number of PLCs on the market. (vgl. OPC-UA Ignition Module, Gegenargument SOA TODO)
> The IEC standardization commission recommends OPC UA as a standard for the implementation 
> of a smart factory [23]. For this reason, OPC UA is used as server standard for NGDs.
> However, OPC UA does not allow real-time transmission, which is why a real-time
> communication channel must still exist.
> -- @Hammerstingl2015

Nach Rücksprache

* OPC UA zur Metamodellierung bzgl. der Machine/SPS
* But not hard real-time (not yet) => nicht geeignet für direkt Bewegungskontrolle @Pauker2014
* OPC UA Modell synchron mit Realität => Laufzeitmodell
* Zu erwartendes Verhalten des physischen Systems über FB-Loop (MAPE-K?) kontrollierbar => Modellierung/Sprache der _Regeln?_
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
* Pi hat Grenzen bei CNC => Smoothieboard
* Industriekomponenten nicht mit Smoothieboard vergleichbar 
* Energieverbrauch?

## Zusammenfassung

# Zusammenfassung

## Schlussfolgerung

## Ausblick

* Steuerungsalternative _Programs_
* Fog mit OPC UA und WS
* BPEL/BPMN/etc. für abstrakte Leitebene
* MDSD mit @Pauker2016
* CNC ersetzen durch STEP-NC? [@Suh2003;@Xu2006;@Xu2006b;@Xu2006a]
* AutomationML und OPC UA @OPCFoundation2014
* Case-Study!!!
* Möglichkeiten des Nutzens der Daten
    * Welcher G-Code Befehl korrelliert auf welche Weise mit welchen gemessenen Werten? @Downey2016
    * Automatische Erkennung von Gut-/Schlechtteilen
