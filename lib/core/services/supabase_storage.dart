import 'dart:io';

import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;


class SupabaseStorageService implements StorageService {
  final SupabaseClient supabase;

  SupabaseStorageService() : supabase = Supabase.instance.client;

   Future<void> createBuckets(String bucketName) async {
    var buckets = await supabase.storage.listBuckets();
    bool isBucketExists = buckets.any((bucket) => bucket.id == bucketName);

    if (!isBucketExists) {
      await supabase.storage.createBucket(bucketName);
    }
  }

  @override
  Future<String> uploadFile(String path, File file) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);

    await supabase.storage
        .from('fruitsimages')
        .upload('$path/$fileName$extensionName', file);

    final String publicUrl = supabase.storage
        .from('fruitsimages')
        .getPublicUrl('$path/$fileName$extensionName');

    return publicUrl;
  }
}
