import 'package:flutter/material.dart';
import 'package:todo5m123/constants/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    backgroundColor:  background;
    return Scaffold(

      appBar: _buildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
          child: buildColumn(),
      ),
    );
  }

  Column buildColumn() {
    return Column(

          children: [
            Container(

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)
            ),

              boxShadow: [
                BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(0,3),
              )
              ]
            ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  buildListTile('Data Report'),
                  buildListTile('Go to Gym'),
                  buildListTile('BrainStorming')
                ]
              )
            ),
          ],
        );
  }

  ListTile buildListTile(String Title) {
    DateTime now = DateTime.now();
    return ListTile(
                  onTap: (){},
                  leading: const Icon(Icons.check_box_outline_blank,color: Colors.grey,),
                  title: Text(Title),
                  trailing: Text(_formatTime(now))
    );

  }

  String _formatTime(DateTime dateTime) {
      return '${dateTime.hour}:${dateTime.minute}';

  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Today'),
      backgroundColor: navBar,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            onPressed: (){
            },
            icon: const Icon(Icons.search)),
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_horiz_rounded))
      ],);
  }
}
