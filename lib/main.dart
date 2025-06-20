import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_services.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_storage.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
    
    await  Supabase.initialize(
      url: 'https://wibtaguysgrpvymnylwg.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndpYnRhZ3V5c2dycHZ5bW55bHdnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MDI2MTQ5NiwiZXhwIjoyMDY1ODM3NDk2fQ.0-Nug7IJgdstbLlkDMe-jFDSazn8WGfIITu1vWhVk-c',
    );
    final storageService = SupabaseStorageService();
    await storageService.createBuckets('fruits_images');
    setupGetit(storageService);
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
