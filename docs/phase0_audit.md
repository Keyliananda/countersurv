# Phase 0 Audit

Stand: 2026-04-26

## Repository

- Flutter: 3.32.8 stable
- Dart: 3.8.1
- App-Skelett: mit `flutter create --project-name countersurv --org dev.countersurv .` erstellt
- Plattformen: Android, iOS, Web, macOS, Linux, Windows durch Flutter-Scaffold vorhanden
- Package-Setup: keine produktiven Drittanbieter-Pakete ausser Flutter SDK und `cupertino_icons`
- Teststruktur: `flutter_test` Widget-Test vorhanden

## Architekturentscheidung

Das Projekt startet bewusst ohne Riverpod, Router, Datenbank oder native Sensor-Pakete. Der aktuelle MVP-Schnitt braucht zuerst eine stabile App-Huelle und klare Feature-Grenzen. Neue Abhaengigkeiten werden erst eingefuehrt, wenn ein konkreter vertikaler Slice sie benoetigt.

Startstruktur:

- `lib/main.dart`: App Entry Point, Theme, Root Screen
- `lib/core/config`: Feature Flags und spaeter Build-/Runtime-Konfiguration
- `lib/features/risk_dashboard`: lokaler Startscreen fuer den Arbeitsstatus

## Datenschutz- und Berechtigungsstrategie

- Rohdaten bleiben standardmaessig lokal.
- Externe Aktionen, Registry-Updates und Versand von Anfragen bleiben opt-in.
- Native Scanner- und Audit-Module werden hinter Feature Flags entwickelt.
- Berechtigungen werden erst angefragt, wenn die zugehoerige Funktion aktiv genutzt wird.
- Der MVP behauptet keine Ueberwachung, sondern trennt Status, Hinweis und geplante Module sichtbar.

## Inventar

Vorhandene Screens:

- `RiskDashboardScreen`: kompakter MVP-Startscreen mit Umgebung, Telefon, Datenbroker und Vorhersagbarkeit.

Vorhandene Feature Flags:

- `dataBrokerAssistant`
- `phoneAudit`
- `bleScanner`
- `wifiTrust`
- `predictionDefense`
- `crowdMode`

Aktiv im aktuellen MVP-Scaffold:

- `dataBrokerAssistant`
- `phoneAudit`

Deaktiviert bis zur spaeteren Implementierung:

- `bleScanner`
- `wifiTrust`
- `predictionDefense`
- `crowdMode`
