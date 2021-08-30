import 'package:sage/core/view_models/base_view_model.dart';

class SettingProvider extends BaseViewModal {
  bool isMessageReceived = true;

  messageReceived(bool value) {
    isMessageReceived = value;
    notifyListeners();
  }
}
