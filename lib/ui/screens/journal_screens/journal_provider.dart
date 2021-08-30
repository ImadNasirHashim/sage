import 'package:sage/core/view_models/base_view_model.dart';

class JournalProvider extends BaseViewModal {
  double sliderValue = 1;
  double sliderMinValue = 1;
  double sliderMaxvalue = 5;
  int index = 0;

  List<String> behaviours = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
        ' Aenean at euismod ante. Donec in dictum lacus. Phasellus'
        ' in nunc et tellus sagittis varius nec at augue. Vestibulum '
        'ante ipsum primis in faucibus orci luctus et ultrices posuere'
        ' cubilia curae; Nunc consectetur urna felis, sit amet feugiat'
        ' nunc imperdiet nec. Integer pharetra nec lectus id euismod.'
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem '
        'ipsum dolor sit amet, consectetur adipiscing elit. ',
    ' in nunc et tellus sagittis varius nec at augue. Vestibulum '
        'ante ipsum primis in faucibus orci luctus et ultrices posuere'
        ' cubilia curae; Nunc consectetur urna felis, sit amet feugiat'
        ' nunc imperdiet nec. Integer pharetra nec lectus id euismod.'
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem '
        'ipsum dolor sit amet, consectetur adipiscing elit. ',
    'ipsum dolor sit amet, consectetur adipiscing elit.'
  ];

  changeSliderValue(double value) {
    sliderValue = value;
    print(sliderValue);
    notifyListeners();
  }

  getNextIndexData(int nextIndex) {
    index = nextIndex;
    print(behaviours[index]);
    notifyListeners();
  }
}
