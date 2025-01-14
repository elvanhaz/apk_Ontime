import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void sendEmail() async {
    if (emailC.text.isNotEmpty) {
      isLoading.value = true;
    }
    try {
      await auth.sendPasswordResetEmail(email: emailC.text);
      Get.back();
      Get.snackbar("Berhasil", "Kami telah mengirim email");
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Terjadi Kesalahan", "Tidak dapat mengirim email");
    } finally {
      isLoading.value = false;
    }
  }
}
