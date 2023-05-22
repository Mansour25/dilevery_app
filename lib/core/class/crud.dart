import 'dart:convert';import 'package:dilevery_app/core/functions/check_internet.dart';import 'package:dilevery_app/core/functions/printing.dart';import 'package:http/http.dart' as http;import 'package:dilevery_app/core/functions/status_request.dart';import 'package:dartz/dartz.dart';class Crud {  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {    var response = await http.post(Uri.parse(linkUrl), body: data);    if (response.statusCode == 200 || response.statusCode == 201) {      Map response_body = jsonDecode(response.body);      return Right(response_body);    } else {      return Left(StatusRequest.failure);    }    // if (checkInternet() == true) {    //    // } else {    //   return Left(StatusRequest.offline_failure);    // }  }}