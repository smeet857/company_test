import 'package:company_test/model/batch_no.dart';
import 'package:company_test/model/sku.dart';
import 'package:company_test/util/colors.dart';
import 'package:company_test/util/images.dart';
import 'package:company_test/util/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ScanningPage extends StatefulWidget {
  final Sku sku;
  final Batch batch;

  ScanningPage(this.sku, this.batch);

  @override
  _ScanningPageState createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: MyColors.appBarGradient,
        title: Text(
          "Scanning",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 3.h, right: 3.w, left: 3.w),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
            decoration: BoxDecoration(
                gradient: MyColors.boxGradient,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Batch No : ${widget.sku.sku} ${widget.batch.batchNo}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 2.5.t,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  "Shipper Size : 1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 2.5.t,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  "Scanned Product : 0",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 2.5.t,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        decoration: BoxDecoration(
                          gradient: MyColors.boxGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Scan Shipper",
                          style:
                              TextStyle(color: Colors.white, fontSize: 1.5.t),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        decoration: BoxDecoration(
                          gradient: MyColors.boxGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Scan Product",
                          style:
                              TextStyle(color: Colors.white, fontSize: 1.5.t),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        decoration: BoxDecoration(
                          gradient: MyColors.boxGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Change Batch",
                          style:
                              TextStyle(color: Colors.white, fontSize: 1.5.t),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(
              "Product List",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 3.t),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      backgroundColor: MyColors.gradient1,
      child: Icon(Icons.add),),
    );
  }
}
