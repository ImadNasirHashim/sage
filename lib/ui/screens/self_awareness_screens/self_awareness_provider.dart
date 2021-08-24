import 'package:sage/core/view_models/base_view_model.dart';

class SelfAwarenessProvider extends BaseViewModal{
  String dropdownValue = 'Banana';
  List<String> items =  ['Banana','Apple','some'];

  selectDropDownValue(newValue){
    dropdownValue = newValue;
    notifyListeners();
  }
}
