import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:internativeapp/states/userState.dart';
import 'package:internativeapp/view/userDetails.dart';

import '../commonFunctions.dart' as CommonFunctions;
import '../enums.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserState>(
      builder: (context, userState, _) => Scaffold(
        appBar: AppBar(
          title: Text("User"),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Reload",
          child: (userState.state == viewState.IsLoading)? CircularProgressIndicator(backgroundColor: Colors.white,):Icon(Icons.refresh),
          onPressed: () {
            userState.loadData();
          },
        ),
        body: (userState.state == viewState.IsLoading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userState.users.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Hero(
                    tag: "image$index",
                    child: CircleAvatar(
                      backgroundImage:
                           NetworkImage(userState.users[index].pictureSmall),
                    ),
                  ),
                  title: Text(
                    userState.users[index].fullName(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(userState.users[index].email),
                  trailing: SizedBox(
                    height: 20.0,
                  ),
                  onTap: () {
                    userState.currentSelected = userState.users[index];
                    Navigator.push(
                      context,
                       MaterialPageRoute(
                        builder: (context) => Details(),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
