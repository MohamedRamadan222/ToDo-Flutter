import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:untitled/modules/done_tasks/done_tasks_screen.dart';
import 'package:untitled/modules/new_tasks/new_tasks_screen.dart';
import 'package:untitled/shared/componentes/components.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

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
  late Database database;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool isButtomSheetShown = false;
  IconData fabIon = Icons.edit;
  var titleController = TextEditingController();
  var timeCintroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isButtomSheetShown) {
            Navigator.pop(context);
            isButtomSheetShown = false;
            setState(() {
              fabIon = Icons.edit;
            });
          } else {
            scaffoldkey.currentState?.showBottomSheet(
              (context) => Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    defaultFormField(
                        controller: titleController,
                        label: 'Task Title',
                        prefix: Icons.title,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'title must not be empty';
                          }
                          return null;
                        },
                        type: TextInputType.datetime),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                        controller: timeCintroller,
                        label: 'Task Time',
                        prefix: Icons.watch_later_outlined,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) => {print(value?.format(context))});
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'time must not be empty';
                          }
                          return null;
                        },
                        type: TextInputType.text),
                  ],
                ),
              ),
            );
            isButtomSheetShown = true;
            setState(() {
              fabIon = Icons.add;
            });
          }
        },
        child: Icon(
          fabIon,
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
    database = await openDatabase(
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
          // print('error When Creating table ${error.toString()}');
          return error;
        });
      },
      onOpen: (database) {
        print('database oppened');
      },
    );
  }

  void insertToDatabase() {
    database.transaction((txn) {
      return txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("first task", "2004", "445", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('error When Inserting new Record ${error.toString()}');
      });
    });
  }
}
