import 'package:assignmenttwo/api/PageTwoResponse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignmenttwo/api/UsersApiResponse.dart';
import 'package:assignmenttwo/api/UserApi.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  UsersResponse usersResponse;
  UsersResponseTwo usersResponseTwo;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((kk)
    {
      var future=Provider.of<UsersApi>(context,listen:false).PageOneUsersData();
      future.then((value){
        setState(() {
          usersResponse=value;
          print("response 1"+usersResponse.toString());
          print(" response--:"+usersResponse.page.toString());
        });
      });
    }
    );
    WidgetsBinding.instance.addPostFrameCallback((kk)
    {
      var future=Provider.of<UsersApi>(context,listen:false).PageTwoUsersData();
      future.then((value){
        setState(() {
         usersResponseTwo=value;
          print("response 2--"+usersResponseTwo.totalPages.toString());

        });
      });
    }
    );

    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
      appBar: AppBar(
        backgroundColor:Colors.grey,
        title:Text(" Show All Users ", style: TextStyle(
            color:Colors.white,
            fontSize:18,
            fontFamily: "Roboto",
            fontWeight:FontWeight.w500
        ),),

      ),
      body:usersResponse==null?Container(child:Center(child: CircularProgressIndicator()),):Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap:true,
                 physics:NeverScrollableScrollPhysics(),
                  itemCount:usersResponse.data.length,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child:Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:Image.network(usersResponse.data[index].avatar.toString()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                child:Column(
                                  children: [
                                    RichText(
                                      text:TextSpan(
                                          text: "ID : ${usersResponse.data[index].id.toString()}\n",
                                          style: TextStyle(
                                              color:Colors.blueGrey[900],
                                              fontSize:14,
                                              fontFamily: "Roboto",
                                              fontWeight:FontWeight.w400
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "First Name : ${usersResponse.data[index].firstName.toString()}\n",
                                              style: TextStyle(
                                                  color:Colors.blueGrey[900],
                                                  fontSize:14,
                                                  fontFamily: "Roboto",
                                                  fontWeight:FontWeight.w400
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Last Name : ${usersResponse.data[index].lastName.toString()}\n",
                                                style: TextStyle(
                                                    color:Colors.blueGrey[900],
                                                    fontSize:14,
                                                    fontFamily: "Roboto",
                                                    fontWeight:FontWeight.w400
                                                ),
                                            ),
                                            TextSpan(
                                              text: "E-mail  : ${usersResponse.data[index].email.toString()}",
                                              style: TextStyle(
                                                  color:Colors.blueGrey[900],
                                                  fontSize:14,
                                                  fontFamily: "Roboto",
                                                  fontWeight:FontWeight.w400
                                              ),
                                            )
                                          ]
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              usersResponseTwo.data[0].avatar==null?Container(child:Center(child: CircularProgressIndicator()),):    ListView.builder(
                  shrinkWrap:true,
                  physics:NeverScrollableScrollPhysics(),
                  itemCount:usersResponseTwo.data.length,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child:Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child:Image.network(usersResponseTwo.data[index].avatar.toString()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                child:Column(
                                  children: [
                                    RichText(
                                      text:TextSpan(
                                          text: "ID : ${usersResponseTwo.data[index].id.toString()}\n",
                                          style: TextStyle(
                                              color:Colors.blueGrey[900],
                                              fontSize:14,
                                              fontFamily: "Roboto",
                                              fontWeight:FontWeight.w400
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "First Name : ${usersResponseTwo.data[index].firstName.toString()}\n",
                                              style: TextStyle(
                                                  color:Colors.blueGrey[900],
                                                  fontSize:14,
                                                  fontFamily: "Roboto",
                                                  fontWeight:FontWeight.w400
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Last Name : ${usersResponseTwo.data[index].lastName.toString()}\n",
                                              style: TextStyle(
                                                  color:Colors.blueGrey[900],
                                                  fontSize:14,
                                                  fontFamily: "Roboto",
                                                  fontWeight:FontWeight.w400
                                              ),
                                            ),
                                            TextSpan(
                                              text: "E-mail  : ${usersResponseTwo.data[index].email.toString()}",
                                              style: TextStyle(
                                                  color:Colors.blueGrey[900],
                                                  fontSize:14,
                                                  fontFamily: "Roboto",
                                                  fontWeight:FontWeight.w400
                                              ),
                                            )
                                          ]
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
