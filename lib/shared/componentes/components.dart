import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radios = 10.0,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(radios)),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  TextInputType? type,
  Function? validate,
  required lableText,
  TextStyle? style,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
  VoidCallback? onTap,
  Function? onChange,
  Color colorField = Colors.black54,
  bool isClickable = true,
  required String label,
}) =>
    TextFormField(
        enabled: isClickable,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onTap: onTap,
        // onChanged: (value) =>
        // onChange!(value)
        // ,
        validator: (value) {
          return validate!(value);
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: lableText,
          prefixIcon: Icon(
            prefix,
            color: colorField,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              suffixPressed!();
            },
            icon: Icon(suffix),
          ),
        ));

Widget buildTaskItem(Map model, context) => Dismissible(
  key: UniqueKey(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.black45,
              child: Text(
                '${model['time']}',
                style: TextStyle(
                    color: Colors.white),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'done', id: model['id']);
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'archived', id: model['id']);
              },
              icon: Icon(
                Icons.archive_outlined,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(
          id: model['id'],
        );

      },
    );

Widget tasksBuilder({
  required List<Map> tasks,
}) => ConditionalBuilder(
  condition: tasks.isNotEmpty,
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.menu,
          size: 100,
          color: Colors.grey,
        ),
        Text(
          'No Tasks yet, Please Add A New Task',
          style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  ),
  builder: (context) => ListView.separated(
      itemBuilder: (c, i) => buildTaskItem(tasks[i], c),
      separatorBuilder: (c, i) => Padding(
        padding: const EdgeInsetsDirectional.only(start: 20),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      ),
      itemCount: tasks.length),
);
