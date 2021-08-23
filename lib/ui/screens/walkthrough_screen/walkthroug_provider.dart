import 'package:sage/core/view_models/base_view_model.dart';

class WalkThroughProvider extends BaseViewModal{
  int index=0;

  final List youtubeData=[
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vitae lorem ut dui'
        ' convallis viverra. Pellentesque habitant morbi tristique senectus et netus et'
        ' malesuada fames ac turpis egestas. Quisque semper quam at risus molestie'
        ', nec fermentum purus egestas. Ut hendrerit nibh eget nisl vulputate,'
        ' in iaculis justo malesuada.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vitae lorem ut dui',
    'malesuada fames ac turpis egestas. Quisque semper quam at risus molestie '
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vitae lorem ut dui',
    'nec fermentum purus egestas. Ut hendrerit nibh eget nisl vulputate,'
  ];


  ///
  /// update[increment] youtube data index
  ///
  getNextIndexData(int nextIndex){
    index = nextIndex;
    print(youtubeData[index]);
    notifyListeners();
  }

  ///
  /// update[decrement] youtube data index
  ///
  getPreviousIndexData(int previousIndex){
    index = previousIndex;
    print(youtubeData[index]);
    notifyListeners();
  }
}