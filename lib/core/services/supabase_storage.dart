import 'dart:io';

import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExits = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExits = true;
        break;
      }
    }
    if (!isBucketExits) {
      _supabase.client.storage.createBucket(bucketName);
    }
  }

  static void initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://wibtaguysgrpvymnylwg.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndpYnRhZ3V5c2dycHZ5bW55bHdnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAyNjE0OTYsImV4cCI6MjA2NTgzNzQ5Nn0.pluJI1saB7VMVKQWD-vEQWR0kPU9JvV2kEx1vWEIUXM',
    );
  }

  @override
  Future<String> uploadFile(String path, File file) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$extensionName', file);

    final String publicUrl = _supabase.client.storage
        .from('public-bucket')
        .getPublicUrl('$path/$fileName.$extensionName');

    return result;
  }
}
