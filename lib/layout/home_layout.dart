import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:untitled/modules/done_tasks/done_tasks_screen.dart';
import 'package:untitled/modules/new_tasks/new_tasks_screen.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screen = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  @override
  void initState() {
    super.initState();

    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getName().then((value) {
            print(value);
            print('khaled');
            // throw('errr');
          }).catchError((error) {
            print('error is ${error.toString()}');
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive_outlined,
            ),
            label: 'Archived',
          ),
        ],
      ),
    );
  }

  Future<String> getName() async {
    return 'mohamed ramadan';
  }

  void createDatabase() async {
    var database = await openDatabase(
      'db.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY,'
                ' title TEXT,'
                ' date TEXT,'
                ' time TEXT,'
                ' status TEXT)')
            .then((value) => {
                  print('table created'),
                })
            .catchError((error) {
          print('error When Creating table ${error.toString()}');
        });
      },
      onOpen: (database) {
        print('database oppened');
      },
    );
  }

  void insertToDatabase() {}
}
