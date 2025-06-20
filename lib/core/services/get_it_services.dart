import 'package:fruit_hub_dashboard/core/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo.dart/products_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit(StorageService storageService) {
  getIt.registerSingleton<StorageService>(storageService);

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(getIt.get<StorageService>()),
  );
}