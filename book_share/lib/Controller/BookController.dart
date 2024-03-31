

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class BookController extends GetxController{
  RxInt bookQuantity = 1.obs;

  RxInt purchaseBookPrice = 0.obs; 
}