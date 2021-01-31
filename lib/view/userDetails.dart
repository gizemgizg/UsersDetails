import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:internativeapp/states/userState.dart';

class Details extends StatelessWidget {
  Widget _spacing(BuildContext context) {
    final responsive = MediaQuery.of(context).size.height;
    return Row(
      children: <Widget>[
         Expanded(
          child: SizedBox(
            height: responsive * 0.01,
            width: 500.0,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double responsive = MediaQuery.of(context).size.height;
    return Consumer<UserState>(
      builder: (context,userState,_)=>Scaffold(
        appBar: AppBar(
          title: Text(userState.currentSelected.fullName()),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
             Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    padding: EdgeInsets.only(top: responsive * 0.15),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: responsive * 0.15, bottom: responsive * 0.05),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                userState.currentSelected.fullName(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.0),
                              ),
                            ),
                            _spacing(context),
                             Text(
                              userState.currentSelected.email,
                              style: TextStyle(color: Colors.grey),
                            ),
                            _spacing(context),
                             Text(userState.currentSelected.phone),
                            _spacing(context),
                             Text(
                              userState.currentSelected.dob.split("T")[0],
                            ),
                            _spacing(context),
                            _spacing(context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset(
                                      "images/icons/facebook_logo.png",
                                      width: 30.0,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                InkWell(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset(
                                      "images/icons/instagram_logo.png",
                                      width: 30.0,
                                    ),
                                  ),
                                  onTap: () {
                                  },
                                ),
                                InkWell(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset(
                                      "images/icons/linkedin_logo.png",
                                      width: 30.0,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                InkWell(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset(
                                      "images/icons/twitter_logo.png",
                                      width: 30.0,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      elevation: 5.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: responsive * 0.2,
                      left: MediaQuery.of(context).size.width * 0.85),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
