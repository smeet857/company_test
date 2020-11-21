import 'dart:convert';

import 'package:company_test/model/super_responce.dart';
import 'package:company_test/util/api_provider.dart';
import 'package:company_test/util/constant.dart';
import 'package:flutter/material.dart';


class CheckInCompleteShipperRepo {

  CheckInCompleteShipperRepo._();

  static void fetchData({
    @required ValueChanged<SuperResponce> onSuccess,
    @required ValueChanged<String> onError,
  }) async {
    ApiProvider().getCall(
        url: "checkincompleteshipper/101d56e2-e105-4d5c-8da3-2caf54acd713",
        onSuccess: (success) {
          var data = success['data'];
          if (data != null && data != "") {
            onSuccess(SuperResponce.fromJson(success, data));
          }else{
            onSuccess(SuperResponce.fromJson(success, {}));
          }
        },
        onError: (error) => onError(error)
    );
  }
}
