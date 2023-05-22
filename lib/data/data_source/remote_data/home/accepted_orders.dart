import 'package:dilevery_app/core/class/crud.dart';import 'package:dilevery_app/core/constant/AppLink.dart';import 'package:dilevery_app/core/functions/printing.dart';import 'package:dilevery_app/core/functions/status_request.dart';import 'package:http/http.dart' as http;class AcceptedOrdersData {  Crud crud;  AcceptedOrdersData(this.crud);  accepted_orders(String delivery_id) async {    try {      return await crud.postData(AppLink.accepted_order, {        'delivery_id': delivery_id,      }).then((value) {        return value.fold((l) => l, (r) => r);      });    } catch (e) {      return Future.error(e);    }  }}