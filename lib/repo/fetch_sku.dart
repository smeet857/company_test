import 'dart:convert';

import 'package:company_test/model/sku.dart';
import 'package:company_test/model/super_responce.dart';
import 'package:company_test/util/api_provider.dart';
import 'package:company_test/util/constant.dart';
import 'package:flutter/material.dart';

class FetchSKuRepo {
  FetchSKuRepo._();

  static void fetchData({
    @required ValueChanged<SuperResponce> onSuccess,
    @required ValueChanged<String> onError,
  }) async {
    ApiProvider().getCall(
        url: 'getsku',
        onSuccess: (success) {
          var data = success['data'];
          if (data != null && data != "") {
            List<Sku> list = [];
            data.forEach((element) {
              list.add(new Sku.fromJson(element));
            });
            onSuccess(SuperResponce.fromJson(success, list));
          } else {
            onSuccess(SuperResponce.fromJson(success, {}));
          }
        },
        onError: (error) => onError(error));
  }
}
