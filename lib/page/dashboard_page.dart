import 'package:company_test/dialog/progress_dialog.dart';
import 'package:company_test/model/sku.dart';
import 'package:company_test/page/start_shipper_scanning_page.dart';
import 'package:company_test/repo/check_in_complete_shipper.dart';
import 'package:company_test/repo/fetch_sku.dart';
import 'package:company_test/util/colors.dart';
import 'package:company_test/util/common_method.dart';
import 'package:company_test/util/images.dart';
import 'package:company_test/util/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  onShipperTap(){
   apiCheckShipper();
  }

  List<Sku> skuList = [];

  void apiCheckShipper()async{
    ProgressDialog.showProgressDialog(context);
    if(!await isInternetConnected()){
      Navigator.pop(context);
      snackBarAlert(_scaffoldKey, "No internet connection");
    }else{
      CheckInCompleteShipperRepo.fetchData(
          onSuccess: (object){
            Navigator.pop(context);
            if(object.message == "Incomplete shipper does not found."){
              apiFetchSku();
            }else{
              snackBarAlert(_scaffoldKey, object.message);
            }
          },
          onError: (error){
            Navigator.pop(context);
            snackBarAlert(_scaffoldKey, "Something went wrong");
            print("api fail ====> $error");
          }
      );
    }
  }
  void apiFetchSku()async{
    ProgressDialog.showProgressDialog(context);
    if(!await isInternetConnected()){
      Navigator.pop(context);
      snackBarAlert(_scaffoldKey, "No internet connection");
    }else{
      FetchSKuRepo.fetchData(
          onSuccess: (object){
            Navigator.pop(context);
            if(object.success == "1"){
              skuList = object.data;
              navigateTo(context, StartScanningShipperPage(skuList));
            }else{
              snackBarAlert(_scaffoldKey, object.message);
            }
          },
          onError: (error){
            Navigator.pop(context);
            snackBarAlert(_scaffoldKey, "Something went wrong");
            print("api fail ====> $error");
          }
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GradientAppBar(
        gradient: MyColors.appBarGradient,
        title: Text(
          "Dashboard",
          style: TextStyle(color: MyColors.appbarTitle),
        ),
        leading: IconButton(
            icon: Image.asset(
              MyImage.menu,
              height: 2.5.h,
              width: 2.5.h,
            ),
            onPressed: () {}),
        titleSpacing: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(gradient: MyColors.screenGradient),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    MyImage.logo,
                    height: 18.h,
                    width: 18.h,
                  ),
                ),
                /*SizedBox(
                height: 6.h,
              ),*/
                Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  alignment: Alignment.center,
                  width: 90.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: onShipperTap,
                            child: Image.asset(
                              MyImage.createShipperCode,
                              height: 10.h,
                              width: 10.h,
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text("Create Shipper",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          MyImage.createShipperCardStart,
                          height: 6.h,
                          width: 6.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          MyImage.createShipperCardStart,
                          height: 6.h,
                          width: 6.h,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                MyImage.rightSticky,
                height: 10.h,
                width: 20.w,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                MyImage.leftSticky,
                height: 15.h,
                width: 10.w,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                MyImage.bottomSticky,
                height: 10.h,
                width: 40.w,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
