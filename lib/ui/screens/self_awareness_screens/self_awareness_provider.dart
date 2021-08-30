import 'package:sage/core/view_models/base_view_model.dart';

class SelfAwarenessProvider extends BaseViewModal {
  String dropdownValue = 'Active';
  List<String> items = ['Active', 'Ambitious', 'Cautious', 'Creative'];

  selectDropDownValue(newValue) {
    dropdownValue = newValue;
    notifyListeners();
  }
}
