import 'package:flutter/material.dart';

import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewModel.dart';

class GridviewProvider with ChangeNotifier {
  List<GridviewModel> _gridView = [];

  List<GridviewModel> get gridView => _gridView;

  void addImage(GridviewModel gridView) {
    _gridView.add(gridView);
    print(_gridView.length);
    notifyListeners();
  }

  void deleteImage(int index) {
    _gridView.removeAt(index);
    notifyListeners();
  }

  void updateImage(int index, GridviewModel gridview) {
    _gridView[index] = gridview;
    notifyListeners();
  }
}
