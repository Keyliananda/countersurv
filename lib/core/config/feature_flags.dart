class FeatureFlags {
  const FeatureFlags({
    required this.dataBrokerAssistant,
    required this.phoneAudit,
    required this.bleScanner,
    required this.wifiTrust,
    required this.predictionDefense,
    required this.crowdMode,
  });

  static const mvp = FeatureFlags(
    dataBrokerAssistant: true,
    phoneAudit: true,
    bleScanner: false,
    wifiTrust: false,
    predictionDefense: false,
    crowdMode: false,
  );

  final bool dataBrokerAssistant;
  final bool phoneAudit;
  final bool bleScanner;
  final bool wifiTrust;
  final bool predictionDefense;
  final bool crowdMode;
}
