import 'package:company_test/page/dashboard_page.dart';
import 'package:flutter/material.dart';

import 'util/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        return OrientationBuilder(
            builder: (context,orientation){
              SizeConfig.init(constraints, orientation);
              return MaterialApp(
                  title: 'Flutter Demo',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  home:DashBoardPage()
              );
            }
        );
      },
    );
  }
}
