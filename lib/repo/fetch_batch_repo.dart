import 'dart:convert';

import 'package:company_test/model/batch_no.dart';
import 'package:company_test/model/sku.dart';
import 'package:company_test/model/super_responce.dart';
import 'package:company_test/util/api_provider.dart';
import 'package:company_test/util/constant.dart';
import 'package:flutter/material.dart';

class FetchBatchRepo {
  FetchBatchRepo._();

  static void fetchData({
    @required String skuId,
    @required ValueChanged<SuperResponce> onSuccess,
    @required ValueChanged<String> onError,
  }) async {
    ApiProvider().getCall(
        url: "getbatchbysku/$skuId",
        onSuccess: (success) {
          var data = success['data'];
          if (data != null && data != "") {
            List<Batch> list = [];
            data.forEach((element) {
              list.add(new Batch.fromJson(element));
            });
            onSuccess(SuperResponce.fromJson(success, list));
          } else {
            onSuccess(SuperResponce.fromJson(success, {}));
          }
        },
        onError: (error) => onError(error));
  }
}
