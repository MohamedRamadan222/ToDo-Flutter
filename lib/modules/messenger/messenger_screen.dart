import 'package:flutter/material.dart';

class messengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius:20.0,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/125136333?s=400&u=f4b7aa628c9ad274296ec553fd87b16a0f92fef4&v=4'),

            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color:Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: CircleAvatar(
              backgroundColor:Colors.blue,
              radius: 15.0,
              child: Icon(Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
          ),
          ),
          IconButton(onPressed: (){}, icon: CircleAvatar(
            backgroundColor:Colors.blue,
            radius: 15.0,
            child: Icon(Icons.edit,
              size: 16.0,
              color: Colors.white,
            ),
          ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0,),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children:
                  [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Searsh',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buidStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder:( context,  index) =>buidChatItem (),
                  separatorBuilder:( context,  index) => SizedBox(
                    height: 20.0,
                  ),
                  itemCount:15
              ),
            ],
          ),
        ),
      )
    );
  }

// build item

Widget buidChatItem () => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius:30.0,
          backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/125136333?s=400&u=f4b7aa628c9ad274296ec553fd87b16a0f92fef4&v=4'),

        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 3.0,
            end: 3.0,
          ),
          child: CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.green,
          ),
        ),
      ],
    ),
    SizedBox(
      width: 20.0,
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Elsoudi mohamed Elsoudi mohamed Elsoudi mohamed',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'hello my name is mohamed ahmed',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 7.5,
                  height: 7.5,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                '02:00 pm',
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
Widget buidStoryItem () => Container(
  width: 60.0,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius:30.0,
            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/125136333?s=400&u=f4b7aa628c9ad274296ec553fd87b16a0f92fef4&v=4'),

          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 6.0,
      ),
      Text(
        'Mhmd Ramadan Elsoudi',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  ),
);
}