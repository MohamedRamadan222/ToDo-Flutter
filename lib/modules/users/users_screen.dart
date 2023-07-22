import 'package:flutter/material.dart';
import '../../models/user/user_model.dart';

class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Mohamed Elsoudi',
      phone: '201153262755',
    ),
    UserModel(
      id: 2,
      name: 'Ramadan Elsoudi',
      phone: '201153202755',
    ),
    UserModel(
      id: 3,
      name: 'Ramadan Mohamed',
      phone: '201453202755',
    ),
    UserModel(
      id: 4,
      name: ' Doaa Ramadan',
      phone: '255553262755',
    ),
    UserModel(
      id: 5,
      name: 'Asmaa Elsoudi',
      phone: '201783262755',
    ),
    UserModel(
      id: 6,
      name: 'Amel Elsoudi',
      phone: '201185262755',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body:ListView.separated(itemBuilder: (context, index) => buildUsersItem(users[index]) ,
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      ),
    );
  }
  Widget buildUsersItem(UserModel user) =>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
