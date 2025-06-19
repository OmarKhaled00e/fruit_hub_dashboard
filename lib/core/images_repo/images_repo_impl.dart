import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart'
    show StorageService;
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl(this.storageService);
  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(
        BackendEndpoint.images,
        image,
      );
      return Right(url);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
