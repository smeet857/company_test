
import 'package:company_test/dialog/progress_dialog.dart';
import 'package:company_test/model/batch_no.dart';
import 'package:company_test/model/sku.dart';
import 'package:company_test/page/scanning_page.dart';
import 'package:company_test/repo/fetch_batch_repo.dart';
import 'package:company_test/util/colors.dart';
import 'package:company_test/util/common_method.dart';
import 'package:company_test/util/images.dart';
import 'package:company_test/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class StartScanningShipperPage extends StatefulWidget {
  final List<Sku> skuList;

  StartScanningShipperPage(this.skuList);

  @override
  _StartScanningShipperPageState createState() =>
      _StartScanningShipperPageState();
}

class _StartScanningShipperPageState extends State<StartScanningShipperPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String skuValue = "Select product";
  bool isSelect = false;
  bool noBatches = true;
  bool isSelectBatch = false;
  Sku selectedSku;
  Batch selectedBatch;
  List<Batch> listBatch = [];

  void onStartScanningTap() {
    if(selectedSku == null){
      snackBarAlert(_scaffoldKey, "Please select product");
    }else if(selectedBatch == null){
      snackBarAlert(_scaffoldKey, "Please select batch");
    }else{
      navigateTo(context, ScanningPage(selectedSku,selectedBatch));
    }
  }

  void apiFetchBatchNo(String id) async {
    ProgressDialog.showProgressDialog(context);
    if (!await isInternetConnected()) {
      Navigator.pop(context);
      snackBarAlert(_scaffoldKey, "No internet connection");
    } else {
      FetchBatchRepo.fetchData(
        skuId: id,
        onSuccess: (object) {
          Navigator.pop(context);
          if (object.success == "1") {
            // listBatch = [];
            listBatch = object.data;
            if(listBatch.length == 0){
              noBatches = true;
            }else{
              noBatches = false;
            }
            isSelectBatch = false;
            setState(() {});
          } else {
            snackBarAlert(_scaffoldKey, object.message);
          }
        },
        onError: (error) {
          Navigator.pop(context);
          snackBarAlert(_scaffoldKey, "Something went wrong");
          print("api fail ====> $error");
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: GradientAppBar(
        gradient: MyColors.appBarGradient,
        title: Text(
          "Start Shipper Scanning",
          style: TextStyle(color: MyColors.appbarTitle),
        ),
        leading: IconButton(
            icon: Image.asset(
              MyImage.backWhite,
              height: 2.5.h,
              width: 2.5.h,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        titleSpacing: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name:",
              style: TextStyle(color: MyColors.gradient1, fontSize: 2.4.t),
            ),
            SizedBox(
              height: 2.h,
            ),
            DropdownButtonFormField<Sku>(
              items: widget.skuList.map((Sku e) {
                return DropdownMenuItem<Sku>(
                    value: e,
                    child: Text(
                      e.sku,
                      style: TextStyle(color: Colors.black54),
                    ));
              }).toList(),
              onChanged: (Sku value) {
                isSelect = true;
                selectedBatch = null;
                selectedSku = value;
                apiFetchBatchNo(value.id);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: !isSelect ? "Select Product" : ""),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Batch No:",
              style: TextStyle(color: MyColors.gradient1, fontSize: 2.4.t),
            ),
            SizedBox(
              height: 2.h,
            ),
            DropdownButtonFormField<Batch>(
              items: listBatch.map((e) {
                print("listVa ====> ${listBatch.length}");
                return DropdownMenuItem<Batch>(
                  value: e,
                    child: Text(
                  e.batchNo,
                  style: TextStyle(color: Colors.black54),
                ));
              }).toList(),
              onChanged: (value) {
                print("Change >>>>> Change");
                selectedBatch = value;
                isSelectBatch = true;
                setState(() {});
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: noBatches ? "No batches" : !isSelectBatch ? "Select batch" : ""
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            ButtonTheme(
              minWidth: double.infinity,
              child: FlatButton(
                  onPressed: onStartScanningTap,
                  color: MyColors.gradient1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Text(
                    "START SCANNING",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
