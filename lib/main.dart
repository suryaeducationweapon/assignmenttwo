
import 'package:assignmenttwo/screens/UsersScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api/UserApi.dart';

void main() {
  runApp(
      MultiProvider(
          providers:[
            ChangeNotifierProvider(create:(_)=>UsersApi(),),
          ],
              child:Consumer<UsersApi>(
                builder:(ctx,auth,_)=>MaterialApp(
                  debugShowCheckedModeBanner: false,
           home:UsersScreen(),
                ),

      ),

      )



  );
}




