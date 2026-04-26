# Counter-Surveillance App: Konzept und Roadmap

## Zielbild

Die App wird ein lokales Schutz- und Transparenzsystem fuer Personen, die wissen wollen:

- Welche Geraete und Funkspuren sind in meiner Umgebung sichtbar?
- Welche Apps, Netzwerke und Dienste koennen mich beobachten?
- Welche Datenbroker oder Plattformen koennten Profile ueber mich fuehren?
- Welche Vorhersagen koennten aus meinen Routinen, Standorten und App-Rechten entstehen?
- Welche konkreten Schritte kann ich ausloesen, um Daten zu reduzieren, Rechte zu entziehen oder Loeschung zu verlangen?

Das Produkt ist defensiv. Es greift keine fremden Geraete an, umgeht keine Schutzmechanismen, deanonymisiert keine Personen und stoert keine Funknetze.

## Produktprinzipien

1. Local-first: Rohdaten bleiben standardmaessig auf dem Geraet.
2. Explainable alerts: Jede Warnung erklaert, welche Beobachtung sie ausgeloest hat.
3. Keine Panik-UX: "Verdacht" und "Beweis" werden klar getrennt.
4. Datenschutz durch Design: Minimale Datenerhebung, kurze Retention, verschluesselte lokale Datenbank.
5. Nutzerkontrolle: Jede externe Anfrage, Cloud-Synchronisierung oder Crowd-Meldung ist opt-in.
6. Defensive Grenzen: Keine Identifikation fremder Personen, kein Jamming, keine Deauths, kein Auslesen fremder Geraete.

## Kernmodule

### 1. Home Risk Dashboard

Der Startscreen zeigt einen kompakten Status:

- Umgebung: Bluetooth/WLAN/Tracker-Auffaelligkeiten
- Telefon: Berechtigungen, Zertifikate, Profile, VPN/DNS
- Datenbroker: offene Loeschanfragen, Antwortfristen, neue Broker
- Vorhersagbarkeit: stabile Routinen und sensitive Datenfluesse
- Notfall: Beweisprotokoll starten, sichere Handlungsempfehlungen anzeigen

Wichtig: Der Screen soll als Arbeitsoberflaeche funktionieren, nicht als Marketing-Seite.

### 2. Funk- und Tracker-Erkennung

Android zuerst. iOS spaeter mit reduzierter Funktionalitaet.

Features:

- BLE-Scan fuer bekannte Tracker-Klassen
- Erkennung wiederkehrender Geraete
- "Moving with me"-Heuristik ueber Zeit, GPS-Ortswechsel und RSSI-Verlauf
- Known-safe-Liste fuer eigene Kopfhoerer, Auto, Smartwatch, Wohnung
- Zonen: Zuhause, Auto, Buero, Hotel, Reise
- Proximity-Modus mit RSSI-Verlauf zur groben Lokalisierung
- Exportierbares Ereignisprotokoll

Risikoindikatoren:

- unbekanntes Geraet an mehreren Orten
- starkes Signal ueber laengere Zeit
- bekannte Tracker-Signatur
- Geraet taucht in sensibler Zone auf
- Geraet ist neu gegenueber dem lokalen Baseline-Profil

Grenzen:

- Nicht sendende Geraete sind unsichtbar.
- Bluetooth-Adressen koennen rotieren.
- GPS-Tracker ohne BLE/WLAN-Signal sind nicht sicher erkennbar.
- Versteckte Mikrofone sind mit einem Handy allein kaum verlaesslich erkennbar.

### 3. WLAN- und Netzwerkvertrauen

Features:

- bekannte SSIDs mit BSSID-Verlauf merken
- neue BSSID fuer bekannte SSID markieren
- offene Klone bekannter Netzwerknamen erkennen
- Gateway-, DNS-, Proxy- und VPN-Status sichtbar machen
- Captive-Portal-Modus fuer Hotel/Flughafen/Cafe
- Warnung bei unsicherer Konfiguration: kein VPN in fremdem WLAN, privates DNS aus, unsichere DNS-Server

Nicht-Ziele:

- Keine aktiven Angriffe gegen WLANs
- Kein Umgehen von Netzwerkzugriffen
- Kein Mitschneiden fremder Inhalte

### 4. Phone Hardening Audit

Die App prueft, welche lokalen Einstellungen und App-Rechte ein Ausspaehen beguenstigen koennen.

Android-Audit:

- Standortrechte: immer, nur bei Nutzung, ungefaehr, genau
- Bluetooth-/Nearby-/WLAN-Rechte
- Mikrofon/Kamera/Sensoren
- Notification Access
- Accessibility Services
- Device Admin Apps
- installierte Profile oder MDM-nahe Konfigurationen, soweit sichtbar
- VPN, Proxy, Private DNS
- Nutzerinstallierte CA-Zertifikate
- Apps aus unbekannten Quellen
- Akku-Optimierung fuer Schutzdienste

iOS-Audit, soweit moeglich:

- Konfigurationsprofile manuell erklaeren
- App Privacy Report als Import/Checkliste
- Tracking Transparency Status
- Location Services Checkliste
- VPN/DNS/Profile Hinweise

### 5. Prediction Defense

Dieses Modul zeigt nicht nur Daten, sondern moegliche Schlussfolgerungen.

Beispiele:

- "Diese drei Apps koennen wahrscheinlich Zuhause und Arbeitsplatz ableiten."
- "Deine Pendelroute ist ueber Standortfreigaben sehr stabil."
- "Diese App-Kategorie kann Gesundheits-, Religions- oder Politikbezug indirekt offenlegen."
- "Werbe-ID plus Standort plus App-Nutzung kann dich ueber Datenbroker wiedererkennbar machen."

Funktionen:

- Inference Cards: Datenquelle -> moegliche Ableitung -> Gegenmassnahme
- Privacy Budget: Tages-/Wochenansicht erzeugter Datenrisiken
- Sensitive Location Guard: Arzt, Anwalt, Religion, Politik, Gewerkschaft, Therapie, Dating, Unterkunft
- Routine Stability Score: Wie gut sind Aufenthaltsorte und Zeiten vorhersagbar?
- Compartment Profiles: Alltag, Arbeit, Reise, Event/Demo, Gesundheit, Dating

Schutzmassnahmen:

- Standortrechte reduzieren
- Werbe-ID zuruecksetzen/deaktivieren
- App-Alternativen mit weniger Tracking empfehlen
- VPN/DNS-Profil aktivieren
- Barzahlung/Offline-Optionen als Hinweise fuer sensible Situationen
- Social-Media-Metadaten und Foto-Geotags pruefen

### 6. Datenbroker- und DSGVO-Assistent

Das ist das "Incogni-like, aber local-first und kostenfrei"-Modul.

Ziel:

- Nutzerprofil lokal erfassen
- relevante Datenbroker, People-Search-Seiten, Ad-Tech-Firmen und Plattformen verwalten
- Auskunfts-, Loeschungs-, Widerspruchs- und Opt-out-Anfragen generieren
- Fristen und Antworten tracken
- Belege und Folgeanfragen verwalten

Rechtsrahmen:

- EU/Deutschland: DSGVO-Auskunft, Loeschung, Widerspruch, Einschraenkung, Berichtigung
- USA: je nach Bundesstaat CCPA/CPRA und andere State Privacy Laws
- Global: Anbieter-spezifische Opt-out-Prozesse

Kernfeatures:

- Broker Registry mit Kategorien, Laendern, Kontaktwegen, Webformularen, E-Mail-Adressen
- Anfragegenerator mit Templates
- Identitaetsnachweis-Verwaltung, aber lokal und minimal
- Fristenkalender
- Status pro Broker: nicht kontaktiert, gesendet, bestaetigt, ID angefordert, geloescht, abgelehnt, eskaliert
- Antwort-Parser fuer E-Mail-Import oder manuelles Einfuegen
- Wiedervorlagen
- Export als ZIP/PDF fuer eigene Unterlagen

Wichtige UX-Regel:

Die App sendet nichts automatisch ohne Vorschau und Zustimmung. Viele Broker verlangen sensible Identitaetsdaten. Die App muss erklaeren, warum ein Nachweis riskant sein kann und wie man Daten minimiert.

### 7. Broker Registry

Die Registry ist ein versionierter Datensatz.

Schema:

- id
- name
- legal_entity
- country
- regions_supported
- categories: data_broker, people_search, adtech, analytics, location_broker, credit, marketing
- request_channels: email, web_form, postal
- opt_out_url
- privacy_policy_url
- required_fields
- recommended_fields
- proof_required
- deadline_days
- template_set
- notes
- last_verified_at
- source_urls
- risk_level

Pflege:

- Start mit manuell kuratierter Liste
- spaeter Community-Beitraege ueber signierte Registry-Updates
- keine ungeprueften Auto-Updates in die App
- jede Quelle mit Datum

### 8. Privacy-Preserving Crowd-Modus

Optional und spaeter.

Ziele:

- bekannte harmlose Geraetetypen besser klassifizieren
- Tracker-Signaturen verbessern
- Broker-Registry aktuell halten
- keine Bewegungsprofile der Nutzer erzeugen

Design:

- Opt-in
- keine Rohstandorte
- grobe Region statt exakte Koordinaten
- rotierende, gehashte Signaturen mit Salt
- lokaler Review vor Upload
- Transparenzseite: Was wuerde gesendet?

## Technische Architektur Flutter

### App-Schichten

- `app`: Routing, Theme, Shell, Navigation
- `features/risk_dashboard`
- `features/radio_scan`
- `features/network_trust`
- `features/device_audit`
- `features/prediction_defense`
- `features/data_brokers`
- `features/evidence_log`
- `features/settings`
- `core/database`
- `core/crypto`
- `core/permissions`
- `core/platform_channels`
- `core/notifications`
- `core/background`

### Empfohlene Flutter-Basis

Die finalen Pakete muessen gegen das vorhandene Repository geprueft werden. Als Zielbild:

- State Management: Riverpod oder vorhandenes Repo-Pattern beibehalten
- Routing: go_router oder vorhandener Router
- Lokale DB: Drift oder Isar; bei bestehendem sqflite-Setup nicht unnoetig wechseln
- Secure Storage: flutter_secure_storage fuer Schluessel und Secrets
- Verschluesselung: SQLCipher/verschluesselte DB oder app-seitige Feldverschluesselung fuer sensible Daten
- Permissions: permission_handler plus native Spezialfaelle
- Background Tasks: workmanager/foreground service auf Android, iOS eingeschraenkt
- Notifications: flutter_local_notifications
- PDF/Export: pdf + printing/share_plus, spaeter ZIP-Export
- Charts: fl_chart oder schlicht eigene Widgets

### Native Android-Schicht

Flutter allein reicht nicht fuer alle Sensoren. Wir brauchen Android-Platform-Channels oder ein eigenes Plugin.

Native Services:

- `BleScannerService`
- `WifiEnvironmentService`
- `NetworkTrustService`
- `PermissionAuditService`
- `CertificateAuditService`
- `ForegroundProtectionService`
- `BootReceiver` fuer optionalen Neustart nach Reboot

Android-Berechtigungen:

- Bluetooth Scan/Connect je nach Android-Version
- Nearby Wi-Fi Devices
- Fine Location dort, wo Scan-APIs es verlangen
- Foreground Service
- Post Notifications
- ggf. Background Location nur wenn technisch und produktlich wirklich noetig

### Datenmodell

Zentrale Tabellen:

- `observed_devices`
- `device_sightings`
- `trusted_devices`
- `places`
- `risk_events`
- `evidence_items`
- `app_permissions_snapshots`
- `network_observations`
- `inference_findings`
- `broker_registry`
- `broker_requests`
- `broker_request_events`
- `templates`
- `user_identity_profiles`

Sensible Felder:

- exakte Koordinaten
- Identitaetsdaten fuer Broker-Anfragen
- E-Mail-Antworten
- Screenshots/Belege
- Geraete-IDs

Diese Daten muessen lokal verschluesselt und exportierbar/loeschbar sein.

## Roadmap

### Phase 0: Repository-Audit und Produkt-Schnitt

Ziel: vorhandenes Flutter-Repo verstehen und Scope festlegen.

Tasks:

- [x] Flutter-Version, Architektur, State Management, Router, Build-System pruefen
- [x] Android/iOS Projektstruktur pruefen
- [x] vorhandene Screens, Themes und Komponenten inventarisieren
- [x] Datenschutz- und Berechtigungsstrategie dokumentieren
- [x] Feature Flags fuer riskante/plattformabhaengige Module anlegen

Akzeptanz:

- [x] App baut lokal
- [x] Startscreen laeuft
- [x] Architekturentscheidung dokumentiert
- [x] erste Teststruktur vorhanden

### Phase 1: Lokale Basis und Dashboard

Ziel: App-Skelett mit lokalem Speicher, Navigation und Risk Dashboard.

Tasks:

- Feature-Ordnerstruktur anlegen
- lokale DB mit Migrationen einrichten
- Settings und Privacy-Modus
- Risk Event Modell
- Dashboard mit Dummy-Daten
- Evidence Log Grundmodell

Akzeptanz:

- Nutzer sieht Dashboard
- Risk Events koennen lokal erzeugt, angezeigt und geloescht werden
- Datenbankmigrationen sind getestet

### Phase 2: Datenbroker-Assistent MVP

Ziel: Der erste praktische Nutzen ohne tiefe Sensorintegration.

Tasks:

- Broker Registry lokal als JSON/DB seeden
- Identitaetsprofil lokal speichern
- DSGVO-Templates fuer Auskunft, Loeschung, Widerspruch
- Request Wizard bauen
- Status-Tracking pro Broker
- Fristen und Reminder
- Export eines Schreibens als E-Mail-Text/PDF

MVP-Templates:

- Auskunft nach Art. 15 DSGVO
- Loeschung nach Art. 17 DSGVO
- Widerspruch gegen Direktwerbung/Profiling nach Art. 21 DSGVO
- Widerruf Einwilligung
- Berichtigung falscher Daten

Akzeptanz:

- Nutzer kann 10 Broker auswaehlen
- App generiert individualisierte Schreiben
- Nutzer kann Versandstatus und Antwortfrist tracken
- keine Anfrage wird ohne explizite Nutzeraktion versendet

### Phase 3: Phone Hardening Audit

Ziel: Sichtbar machen, welche lokalen Einstellungen riskant sind.

Tasks:

- App-Rechte auslesen, soweit Android erlaubt
- Accessibility/Notification Access/Device Admin Hinweise
- VPN/Proxy/Private DNS Status
- CA-Zertifikats-Hinweise
- Hardening Checklist
- Risk Findings mit konkreten Handlungsschritten

Akzeptanz:

- Nutzer sieht priorisierte Risiken
- jedes Risiko hat Begruendung und Fix-Schritte
- keine falschen "du wirst sicher ueberwacht"-Aussagen

### Phase 4: BLE Tracker Scan MVP

Ziel: manuelle und periodische BLE-Sichtungen.

Tasks:

- Android BLE Plugin/Platform Channel
- Runtime Permissions
- manueller Scan
- Sichtungen speichern: Zeit, RSSI, Typvermutung, roher Identifier gehasht
- Known-safe Liste
- Proximity UI
- einfache Tracker-Heuristiken

Akzeptanz:

- App erkennt BLE-Geraete in manueller Suche
- Nutzer kann eigene Geraete als bekannt markieren
- Sichtungsverlauf ist lokal sichtbar

### Phase 5: Moving-With-Me Detection

Ziel: echte Anti-Stalking-Logik.

Tasks:

- Ortswechsel in Sighting-Modell einbeziehen
- Heuristik: gleiche/verwandte Signatur an mehreren Orten
- False-Positive-Reduktion fuer Nachbarn, Bahn, Flughafen, Buero
- Benachrichtigungen
- Evidence Export fuer Tracker-Events

Akzeptanz:

- Warnung erst bei nachvollziehbarer Mehrfachsichtung
- Karte/Timeline zeigt, warum die App warnt
- Nutzer kann Event als harmlos markieren

### Phase 6: WLAN- und Network Trust

Ziel: Netzwerkmanipulationen und unsichere Netze sichtbar machen.

Tasks:

- WLAN-Umgebung lesen, soweit Android erlaubt
- bekannte SSID/BSSID-Baselines
- Evil-Twin-Indikatoren
- DNS/Gateway/VPN Status
- Fremdnetz-Profil mit Empfehlungen

Akzeptanz:

- bekannte Netzwerke bekommen Baseline
- App warnt bei auffaelligen Aenderungen
- Nutzer bekommt konkrete Schutzschritte

### Phase 7: Prediction Defense

Ziel: aus Rechten, Standortmustern und App-Kategorien ableiten, was Dritte prognostizieren koennten.

Tasks:

- Inference Rule Engine
- Sensitive Location Kategorien lokal verwalten
- Routine Stability Score
- Privacy Budget
- Compartment Profiles
- Empfehlungen pro Profil

Akzeptanz:

- App zeigt konkrete "aus diesen Daten koennte X abgeleitet werden"-Karten
- Nutzer kann Empfehlungen anwenden oder abhaaken
- alle Regeln sind transparent erklaert

### Phase 8: Registry Updates und Community

Ziel: Broker- und Signaturdaten aktuell halten, ohne Nutzer zu tracken.

Tasks:

- signierte Registry-Dateien
- Update-Check mit Changelog
- manuelle Importmoeglichkeit
- Community-Vorschlaege fuer Broker
- optional anonyme Statistik nur nach Review

Akzeptanz:

- Registry kann aktualisiert werden
- Nutzer sieht, was geaendert wurde
- keine Rohdaten verlassen das Geraet automatisch

### Phase 9: iOS Companion

Ziel: iOS nicht als vollstaendigen Ersatz verkaufen, sondern als Audit- und Broker-Assistent.

Tasks:

- Datenbroker-Assistent
- Prediction Defense
- manuelle Checklisten fuer iOS Privacy Report, Profiles, VPN/DNS
- begrenzte BLE-Unterstuetzung, soweit App Store und CoreBluetooth es erlauben

Akzeptanz:

- iOS-Version macht keine falschen Versprechen
- Kernnutzen Datenbroker/Profiling funktioniert

## Umsetzung aus vorhandenem Flutter-Repository

### Schritt 1: Repo pruefen

Commands:

- `flutter --version`
- `flutter pub get`
- `flutter test`
- `flutter analyze`
- Android Build pruefen
- iOS Build nur falls relevant

Ergebnis:

- bestehende Architektur festhalten
- keine unnoetige Migration von State Management oder Router
- kleine Feature-Slices statt grosser Rewrite

### Schritt 2: Feature Flags einfuehren

Flags:

- `dataBrokerAssistant`
- `phoneAudit`
- `bleScanner`
- `wifiTrust`
- `predictionDefense`
- `crowdMode`

Damit koennen unfertige/native Features im Build bleiben, ohne die App instabil zu machen.

### Schritt 3: Core Privacy Storage

Einbauen:

- lokale Datenbank
- Migrationsframework
- verschluesselter Secret Store
- Repository-Layer
- Export/Loeschen aller lokalen Daten

### Schritt 4: Datenbroker-Modul zuerst bauen

Warum zuerst:

- hoher Nutzen
- wenig native Risiken
- laeuft auf Android und iOS
- gute Grundlage fuer Templates, Fristen, Evidence Log

MVP-Screens:

- Broker-Liste
- Broker-Detail
- Identitaetsprofil
- Anfrage-Wizard
- Schreiben-Vorschau
- Status-Timeline
- Reminder

### Schritt 5: Device Audit

Danach lokale Telefonrisiken:

- Berechtigungen
- VPN/DNS/Proxy
- Zertifikatshinweise
- Accessibility/Notification Access Check
- konkrete Fix-Anleitungen

### Schritt 6: BLE Plugin

Erst wenn App-Basis stabil ist:

- Android Native Plugin
- Scan Service
- Foreground Notification
- Datenmodell fuer Sightings
- Known-safe UX
- Proximity UI

### Schritt 7: Heuristiken und Prediction Engine

Rule Engine lokal:

- einfache JSON/YAML-Regeln
- Versionierung
- Tests fuer jede Regel
- Ergebnis immer mit Erklaerung

### Schritt 8: Tests

Testarten:

- Unit Tests fuer Broker Templates
- Unit Tests fuer Fristen
- Unit Tests fuer Risk Scoring
- Golden Tests fuer kritische Screens
- Integration Tests fuer Request Wizard
- Native Android Tests fuer Permission Handling
- manuelle Feldtests fuer BLE/WLAN

## Sicherheits- und Rechtsgrenzen

Die App sollte klare Sprache verwenden:

- "Hinweis" statt "Beweis", wenn nur ein Indikator vorliegt
- "Dieses Muster kann Tracking ermoeglichen" statt "du wirst verfolgt"
- "Kontaktiere lokale Hilfe/Behoerden", wenn physische Gefahr besteht
- keine Anleitungen zum Stoeren, Angreifen oder Umgehen fremder Systeme

## Erste lieferbare Version

Version 0.1 sollte nicht versuchen, alles zu koennen.

Empfohlener Scope:

- Dashboard
- lokale DB
- Datenbroker Registry mit 20-50 Eintraegen
- DSGVO Request Wizard
- Fristen/Reminder
- Evidence Log
- Phone Hardening Checklist
- Android App Permission Audit light

Version 0.2:

- BLE manueller Scan
- bekannte Geraete
- Tracker Sighting Timeline

Version 0.3:

- Moving-with-me Heuristik
- Benachrichtigungen
- Evidence Export

Version 0.4:

- WLAN Trust
- Prediction Defense MVP

Version 0.5:

- signierte Registry Updates
- opt-in Community Contributions

## Offene Produktentscheidungen

- Nur Android zuerst oder parallel iOS?
- Soll der Datenbroker-Assistent E-Mails direkt versenden oder nur Entwuerfe erzeugen?
- Wie stark sollen Identitaetsnachweise in der App gespeichert werden?
- Soll es ein eigenes Backend geben oder nur statische signierte Registry-Dateien?
- Soll die App im Store erscheinen oder zunaechst als private APK/TestFlight?
- Welche Laender stehen in der ersten Broker-Registry im Fokus: Deutschland/EU, USA, UK?
