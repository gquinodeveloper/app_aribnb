import 'package:app_airbnb/app/data/models/request_token.dart';
import 'package:app_airbnb/app/data/providers/local/storage_provider.dart';
import 'package:get/get.dart';

class StorageRepository {
  final _storageProvider = Get.find<StorageProvider>();

  Future<void> setSession({required RequestToken request}) =>
      _storageProvider.setSession(
        request: request,
      );

  Future<RequestToken> getSession() => _storageProvider.getSession();
}
