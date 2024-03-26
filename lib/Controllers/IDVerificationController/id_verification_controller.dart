
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class IDVerificationController extends GetxController {

  var selectedDocumentType = 0.obs;
  void selectDocumentType(int? index) {
    selectedDocumentType.value = index ?? 0;
  }

  /// select the pdf file

  RxString selectedPdfPath = ''.obs;

  Future<void> pickPDF() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        selectedPdfPath.value = result.files.single.path!;
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      // Error picking the file
      print('Error picking PDF file: $e');
    }
  }

}
