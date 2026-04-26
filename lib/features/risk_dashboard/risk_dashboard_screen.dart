import 'package:countersurv/core/config/feature_flags.dart';
import 'package:flutter/material.dart';

class RiskDashboardScreen extends StatelessWidget {
  const RiskDashboardScreen({required this.featureFlags, super.key});

  final FeatureFlags featureFlags;

  @override
  Widget build(BuildContext context) {
    final sections = <RiskSection>[
      RiskSection(
        title: 'Umgebung',
        status: featureFlags.bleScanner ? 'Bereit' : 'Geplant',
        summary: 'BLE- und WLAN-Erkennung ist noch nicht aktiv.',
        icon: Icons.sensors,
        tone: RiskTone.neutral,
      ),
      RiskSection(
        title: 'Telefon',
        status: featureFlags.phoneAudit ? 'MVP aktiv' : 'Geplant',
        summary: 'Hardening-Checkliste ist fuer den MVP vorgesehen.',
        icon: Icons.phonelink_lock,
        tone: RiskTone.low,
      ),
      RiskSection(
        title: 'Datenbroker',
        status: featureFlags.dataBrokerAssistant ? 'MVP aktiv' : 'Geplant',
        summary: 'Registry, DSGVO-Schreiben und Fristen werden priorisiert.',
        icon: Icons.assignment_outlined,
        tone: RiskTone.attention,
      ),
      RiskSection(
        title: 'Vorhersagbarkeit',
        status: featureFlags.predictionDefense ? 'Bereit' : 'Geplant',
        summary: 'Inference Cards und Privacy Budget folgen nach dem MVP.',
        icon: Icons.timeline,
        tone: RiskTone.neutral,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterSurv'),
        actions: [
          IconButton(
            tooltip: 'Einstellungen',
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            Text(
              'Risk Dashboard',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              'Lokaler Status fuer Funkspuren, Telefonrisiken, Datenbroker und Vorhersagbarkeit.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            _StatusBand(activeFlags: featureFlags.activeCount),
            const SizedBox(height: 20),
            for (final section in sections) ...[
              _RiskSectionTile(section: section),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.fact_check_outlined),
              label: const Text('Beweisprotokoll vorbereiten'),
            ),
          ],
        ),
      ),
    );
  }
}

extension on FeatureFlags {
  int get activeCount {
    return [
      dataBrokerAssistant,
      phoneAudit,
      bleScanner,
      wifiTrust,
      predictionDefense,
      crowdMode,
    ].where((flag) => flag).length;
  }
}

class _StatusBand extends StatelessWidget {
  const _StatusBand({required this.activeFlags});

  final int activeFlags;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9EFE6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD1DACD)),
      ),
      child: Row(
        children: [
          const Icon(Icons.privacy_tip_outlined, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$activeFlags MVP-Module aktiv',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Rohdaten bleiben lokal. Externe Aktionen brauchen Zustimmung.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RiskSectionTile extends StatelessWidget {
  const _RiskSectionTile({required this.section});

  final RiskSection section;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E3DA)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(section.icon, color: section.tone.color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        section.title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    _StatusChip(
                      label: section.status,
                      color: section.tone.color,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(section.summary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class RiskSection {
  const RiskSection({
    required this.title,
    required this.status,
    required this.summary,
    required this.icon,
    required this.tone,
  });

  final String title;
  final String status;
  final String summary;
  final IconData icon;
  final RiskTone tone;
}

enum RiskTone {
  low(Color(0xFF2E7D32)),
  attention(Color(0xFF8A5A00)),
  neutral(Color(0xFF546E7A));

  const RiskTone(this.color);

  final Color color;
}
