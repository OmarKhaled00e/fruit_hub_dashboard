import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_services.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_storage.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SupabaseStorageService.initSupabase();
  await SupabaseStorageService.createBuckets('fruits_images');
  setupGetit();
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
