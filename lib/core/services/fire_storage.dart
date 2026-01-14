import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/stoarage_service.dart';

class FireStorage implements StoarageService {
  final stoargeReference = FirebaseStorage.instance;
  @override
  Future<String> uploadImage(String file) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
