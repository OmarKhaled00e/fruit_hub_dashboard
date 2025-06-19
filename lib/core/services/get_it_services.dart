import 'package:fruit_hub_dashboard/core/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo.dart/products_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_srorage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt.get<StorageService>()));
  // getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl());
}
