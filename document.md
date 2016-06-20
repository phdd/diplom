# Einleitung

## Motivation

Durch sinkende Losgrößen und steigende Produktvariabilität sind Echtzeitüberwachung und -kontrolle in verteilten, rekonfigurierbaren Fertigungssystemen notwendig @Wang2004.

Die Infrastruktur für eine Verbindung zwischen automatisiertem Equipment und E-Manufacturing fehlt @Wang2004.


## Zielsetzung

## Aufbau der Arbeit

    
# Grundlagen

## Cyber-physische Produktionssysteme

## Zusammenfassung


# Forschungsstand

## Remote real-time CNC machining for web-based manufacturing @Wang2004 

Purpose

:   Das Ziel von Wang et al. war die Entwicklung einer offenen Architektur für die Echtzeitüberwachung und -kontrolle von im Netzwerk befindlichen CNC-Maschinen.


Design/Methodology/Approach

:   Ein Web-basierter Thin-Client des _Wise-ShopFloor_ ermöglicht die Kontrolle und Überwachung der Maschinen über ein dreidimensionales Modell der Fertigungsstrecke.
    Das darunterliegende Framework basiert auf einer Client/Server-Architekturstil und verwendet seitens des Servers das MVC-Entwurfsmuster.
    Maschinen werden über das Fabriknetzwerk mit dem Server verbunden und sind somit vom Internet getrennt.
    Bei der Verwendung mehrerer Clients wird für das Routing ein Publish/Subscribe Mechanismus über HTTP-Streaming eingesetzt.
    Mit Hilfe dessen wird das Verhalten des auf Java 3D basierenden Visualisierungsmodells durch Sensorik an den Machinen beeinflusst.
    In der von Wang et al. durchgeführten Case Study wurde unter Verwendung einer CNC-Fräsmaschine die Tauglichkeit des Konzepts verifiziert.
    Die Schnittstelle zwischen dem Server und der Maschine wurde durch OAC[^oac] bereitgestellt.
    Für die Kontrolle der Fräse kann zwischen einem manuellen und einem automatischen Modus gewählt werden, wobei letzterer die direkte Übertragung von G-Code ermöglicht.


Findings

:   Das Internet ist ein zentraler Aspekt verteilter Produktion.
    Jedoch sind damit Sicherheitslücken fatal für interne Daten und vertrauliche Informationen der Organisation.
    Die gezielte Verbreitung dieser stellt ein ehöhtes wirtschafliches Risiko dar und muss in besonderem Maße geschützt werden.
    Weiterhin sind Systemfehler auf Maschinenebene im Bezug auf Personen- und Materialschäden untragbar.
    Daher muss die reibungslose Kommunikation von Steuerungsbefehlen zu jeder Zeit gewährleistet sein.

[^oac]: Open Architecture Controller


Research Limitations/Implications

:   Standards für die Kommunikation von Sensor- und Steuerungsinformationen sind notwendig um Effizienz und Integration der Systeme zu vereinfachen.
    So müssen globale Schnittstellen definiert und durch die Komponenten des Systems implementiert werden.
    Durch die Verwendung eines zuverlässigen NC-Befehlsinterpreters ist die verteilte Echtzeitsteuerung von CNC-Maschinen nach Wang et al. praktisch möglich.


Practical Implications

:   Die direkte Verbindung des Clients zu einer Maschine ist mit der verwendeten Technologie nicht möglich.
    Sowohl die Java Sicherheitsinfrastuktur, als auch die Überwindung von Firewalls stellen zukünftig zu lösende Probleme dar.
    Für künftige Maschinen ist daher das Einbetten eines dedizierten Web-Services in die Kontrolleinheit notwendig.


Originality/Value

:   Ein wichtiger Aspekt des Konzepts von Wang et al. ist die technische Umsetzung auf der Java-Plattform.
    Mit dieser werden Sicherheitsinfrastrukturmerkmale wie byte-code-Verifikation und Rechtemanagement direkt unterstützt.
    Die Indirektion des Kontrollflusses über den Server der Architektur zu den Maschinen verhilft zur Einhaltung.


## A web-based virtual CNC turn-milling system 

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


## Zusammenfassung 


# Konzeption

## Abgrenzung

## Zusammenfassung


# Implementation

## Zusammenfassung


# Evaluation

## Zusammenfassung


# Zusammenfassung

## Schlussfolgerung

## Ausblick
