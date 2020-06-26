import 'package:disenos/src/models/layout_model.dart';
import 'package:disenos/src/pages/launcher_tablet_page.dart';
import 'package:disenos/src/theme/theme.dart';
import 'package:flutter/material.dart';


import 'package:disenos/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

import 'src/pages/launcher_page.dart';



void main() => runApp(
  MultiProvider(
    providers:[
      ChangeNotifierProvider<ThemeChanger>(create: (_) =>  ThemeChanger( 2 ),),
      ChangeNotifierProvider<LayoutModel>(create: (_) =>  LayoutModel( ),)
    ],
    child: MyApp()
  )
);
// void main() => runApp(
//   ChangeNotifierProvider(
//     create: (_) => new ThemeChanger( 2 ),
//     child: MyApp()
//   )
// );
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation){
          // print('Orientation $orientation');
          final screenSize = MediaQuery.of(context).size;
          if(screenSize.width > 500){
            return LauncherTabletPage();
          }else{
            return LauncherPage();
          }
        })
    );
  }
}