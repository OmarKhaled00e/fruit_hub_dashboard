import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://wibtaguysgrpvymnylwg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndpYnRhZ3V5c2dycHZ5bW55bHdnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAyNjE0OTYsImV4cCI6MjA2NTgzNzQ5Nn0.pluJI1saB7VMVKQWD-vEQWR0kPU9JvV2kEx1vWEIUXM',
  );
  runApp(const MainDash());
}

class MainDash extends StatelessWidget {
  const MainDash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}
