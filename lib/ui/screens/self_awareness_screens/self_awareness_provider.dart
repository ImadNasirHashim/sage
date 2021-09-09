import 'package:sage/core/view_models/base_view_model.dart';

class SelfAwarenessProvider extends BaseViewModal {
  String dropdownValue = 'Select a Self-Awareness Habit';
  List<String> items = ['Select a Self-Awareness Habit', 'Select an Accountability Habit'];

  selectDropDownValue(newValue) {
    dropdownValue = newValue;
    notifyListeners();
  }
}
