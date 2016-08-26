# Roadmap {footer=false count=false .toc}

- [Einleitung](#einleitung)
- [Anforderungen](#anforderungen)
- [Forschungsstand](#forschungsstand)
- [Konzeption](#konzeption)
- [Implementation](#implementation)
- [Status & Vorgehen](#status-vorgehen)

# Einleitung {footer=false header=false count=false .center}

# Motivation

* _Industrie 4.0_ drängt CPS in die Produktion (CPPS)
* Maschinen ohne Infrastrukturanbindung vorhanden
    - fehlende Netzwerk- und Programmierschnittstellen
    - geschlossene Architekturen
    - ungenügende Sicherheitskonzepte
</br>
</br>
</br>
⇒ Anlagenmodernisierung - _Retrofitting_

# Aufgaben 

* ermitteln der Anforderungen für die Integration
* Recherchen zu bestehenden Arbeiten
* Konzeption von
    - virtueller Maschinenrepräsentation
    - erweiterbarem Framework

# Aufgaben (Forts.)

* ermöglichen von Kontrolle/Überwachung in CPPS
    - Transfer und Ausführung von Maschinencode
    - Erfassen von Produktionsdaten durch Sensoren
    - Verwendung von Einplatinencomputern für die Implementierung  
&nbsp;
* prototypische Implementierung belegt Machbarkeit
* Aufbau einer adäquaten Test-Infrastruktur

# Erwartungen
## Forschungskontext

* unterbrechungsfreie M2M-Kommunikation und Produktionskette
* Hierarchisierung von Kontrolle/Überwachung
* modellgetriebene Komponenten- und Funktionsstrukturabbildung
* dezentrale Informationsarchitektur verbessert
    - Produktionsstabilität
    - Just-in-Time-Fähigkeit
    - Automatisierungsgrad

# Erwartungen
## Praxis

* minimieren manueller Tätigkeiten  
  <small>z.B. Übertragen eines Programms</small>
* Diagnosen nicht nur vor Ort  
  <small>z.B. zentrale Auswertung der Betriebsdaten</small>
* Beschleunigung des Produktionsablaufs durch höheren Automatisierungsgrad
* Vereinfachung von Prozessplanung und Durchführung
* Kontrolle von Wartungszyklen und Störfällen
* Werkzeugbruch und -wechsel werden ad hoc an Verantwortliche kommuniziert

# Anforderungen {footer=false header=false count=false .center}

# Forschungsfrage 
<br><br>
Welchen softwaretechnologischen Konzepten muss die Modernisierung und der infrastrukturelle Kontext einer Altmaschine unterliegen, um eine ganzheitliche Integration in cyber-physische Produktionssysteme (CPPS) gewährleisten zu können?

# Teilfragen

1. Welche System- und **Softwarearchitektur** ist für die Kontrolle und Überwachung veralteter CNC-Maschinen im Kontext von CPPS geeignet?

2. Wie und wo werden **Informationen zur Maschine** erfasst, verarbeitet, persistiert und Fremdsystemen zur Verfügung gestellt?

3. Welche **standardisierten Protokolle** und Datenstrukturen eignen sich für M2M-Kommunikation in einem CPPS?

# REQ1 - Steuerung
<br><br>
Die Kontrolle der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Übertragung, Ausführung und Abbruch von NC-Programmen, beziehungsweise produktionsbedingter Steuerbefehle, durch Subsysteme des CPPS erfolgen kann.

# REQ2 - Überwachung
<br><br>
Die Überwachung von Betriebs- und Prozessdaten der Altmaschine und ihrer automatisierten Maschinen- und Werkzeugkomponenten ist ortsunabhängig, so dass Zustandserfassung und Störfalldiagnose durch Subsysteme des CPPS erfolgen kann.

# REQ3 - Standardisierung
<br><br>
Standardisierte Informationsprotokolle und -modelle werden für die Integration heterogener Altmaschinen eingesetzt, so dass Datenaggregation und M2M-Kommunikation gesamtheitlich gewährleistet werden kann.

# REQ4 - Lokalität
<br><br>
Die Erfassung und Persistierung anfallender Betriebs- und Prozessdaten, sowie die Interpretation von Maschinenbefehlen geschieht geografisch nahe der Anlage, wodurch zeitliche Latenzen, Kommunikationsaufwände und -fehler minimiert werden.

# Forschungsstand {footer=false header=false count=false .center}



# Konzeption {footer=false header=false count=false .center}

# Implementierung {footer=false header=false count=false .center}

# Status & Vorgehen {footer=false header=false count=false .center}

<!-- DSRM + erfüllte Ziele in % -->

# Danke für die Aufmerksamkeit {footer=false header=false count=false .center}
