import 'package:countersurv/core/config/feature_flags.dart';
import 'package:countersurv/features/risk_dashboard/risk_dashboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CounterSurvApp());
}

class CounterSurvApp extends StatelessWidget {
  const CounterSurvApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF1D5C63),
      brightness: Brightness.light,
    );

    return MaterialApp(
      title: 'CounterSurv',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color(0xFFF7F8F4),
        useMaterial3: true,
      ),
      home: const RiskDashboardScreen(featureFlags: FeatureFlags.mvp),
    );
  }
}
