import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/controller/calculate_controller.dart';

void main() {
  group('CalculateController Tests', () {
    test('testing jika di inputkan data 2 + 3 apakah hasil nya 5 ', () {
      CalculateController calculateController = CalculateController();
      calculateController.userInput = '2+3';
      calculateController.equalPressed();
      expect(calculateController.userOutput, '5.0');
    });

    test(
        'testing jika diisi data seperti sebelumnya dihapus apakah hasilnya hilang atau kosong(tombol C yg buat clear data semua)',
        () {
      CalculateController calculateController = CalculateController();
      calculateController.userInput = '2+3';
      calculateController.userOutput = '5.0';
      calculateController.clearInputAndOutput();
      expect(calculateController.userInput, '');
      expect(calculateController.userOutput, '');
    });

    test('testing jika mengisi data 23 dan dihapus 1 angka apakah hasilnya 2',
        () {
      CalculateController calculateController = CalculateController();
      calculateController.userInput = '23';
      calculateController.deleteBtnAction();
      expect(calculateController.userInput, '2');
    });

    test('On Number Button Tapped', () {
      CalculateController calculateController = CalculateController();
      calculateController.onBtnTapped(['1', '2', '3'], 1);
      expect(calculateController.userInput, '2');
    });
  });
}
