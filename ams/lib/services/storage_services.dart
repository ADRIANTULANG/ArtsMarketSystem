import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  saveCredentials({
    required String accntId,
    required String email,
    required String password,
  }) {
    storage.write("accntId", accntId);
    storage.write("email", email);
    storage.write("password", password);
  }

  saveUserProfiles({
    required String clientId,
  }) {
    storage.write("clientId", clientId);
  }

  removeStorageCredentials() {
    storage.remove("accntId");
    storage.remove("email");
    storage.remove("password");
  }

  alreadyReadFAQsAndTermsAndServices() {
    storage.write("isAlreadyDisplay", true);
  }
}
