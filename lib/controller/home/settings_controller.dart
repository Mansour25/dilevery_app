import 'package:dilevery_app/core/class/crud.dart';import 'package:dilevery_app/core/constant/constant_data.dart';import 'package:dilevery_app/core/functions/printing.dart';import 'package:dilevery_app/core/functions/status_request.dart';import 'package:dilevery_app/core/model/order_model.dart';import 'package:dilevery_app/data/data_source/remote_data/home/archive_orders.dart';import 'package:get/get.dart';import '../../view/screens/home/archive_orders.dart';class SettingsController extends GetxController {  ArchiveOrders archiveOrders = ArchiveOrders(Crud());  StatusRequest? statusRequest;  List<OrderModel> archive_orders = [];  get_archive_orders() async {    statusRequest = StatusRequest.loading;    update();    try {      await archiveOrders.get_archive_order(delivery_id).then((val) {        if (val == StatusRequest.failure || val['status'] == 'failure') {          statusRequest = StatusRequest.failure;          update();        }        if (val['status'] == 'success') {          archive_orders.clear();          val['data'].forEach((element) {            archive_orders.add(OrderModel.fromJson(element));          });          statusRequest = StatusRequest.success;          update();        }      });    } catch (e) {      space_print(e);      Get.snackbar('Error during get archive orders', '');      statusRequest = StatusRequest.failure;      update();    }  }  @override  void onInit() async {    // TODO: implement onInit    await get_archive_orders();    super.onInit();  }}