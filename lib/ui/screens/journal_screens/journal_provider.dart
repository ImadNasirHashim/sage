import 'package:flutter/cupertino.dart';
import 'package:sage/core/view_models/base_view_model.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/screens/journal_screens/journal_screen.dart';

class JournalProvider extends BaseViewModal {
  double sliderValue = 1;
  double sliderMinValue = 1;
  double sliderMaxvalue = 5;
  int index = 0;
  int behavioursLength = 0;
  String? behaviour;

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

  addNewBehaviour(int index,String value, BuildContext context){
    behaviours.add(value);
    index++;
    if(index < 4)
      {
        print(index);
        Navigator.push(context, CustomPageRoute(child: JournalScreen()));
      }
    notifyListeners();
  }
}
