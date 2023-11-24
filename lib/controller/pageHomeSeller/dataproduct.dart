import 'dart:collection';

import 'package:graduation_project/Models/modelHomeSeller/homeSeller.dart';
import 'package:graduation_project/services/constant/path_images.dart';

class ControllerDataPostSeller {
  static final List<ModelDataProduct> _dataPost = [
    ModelDataProduct(
        image: PathImage.clothes1, price: 10.toString(), title: 'Clothes'),
    ModelDataProduct(
        image: PathImage.clothes1, price: 10.toString(), title: 'Clothes'),
    ModelDataProduct(
        image: PathImage.clothes1, price: 10.toString(), title: 'Clothes'),
  ];

  static UnmodifiableListView<ModelDataProduct> get _datalist =>
      UnmodifiableListView(_dataPost);
  static int get datalenght => _datalist.length;
  static ModelDataProduct getDataPost(int index) => _datalist.elementAt(index);
}
