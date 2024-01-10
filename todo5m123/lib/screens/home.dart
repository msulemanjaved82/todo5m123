import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo5m123/constants/colors.dart';
import 'package:todo5m123/model/todo.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Actions {delete,edit}
class _MyHomePageState extends State<MyHomePage> {
    final TodoL = Todo.todoList();
    final _todoController = TextEditingController();


    // this controller controls the navigation bar page's index
    final PageController _page = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    backgroundColor: background;
    return Scaffold(

  // Here I have created three main widgets.
      // 1. appBar: Top navigation bar of screen.
      // 2. bottomNavigationBar
      // 3. body: include all the tasks, pending and completed
      // 4. floatingActionButton: add icon button use to add new tasks
      appBar: _buildAppBar(),

      // Added the PageView widget to navigate through the pages of the screen.
        // Controller _page is used to control the page index
      body: PageView(
        controller: _page,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: buildColumn(),
              ),
            ],
          ),
          Center(
            child: Container(
              child: const Text("calendar page"),
            ),
          ),
          Center(
            child: Container(
              child: const Text("Settings page"),
            ),
          ),
        ],
      ),

        //Add button
        floatingActionButton: FloatingActionButton(
                  onPressed: () => _displayDialog(context),
                  tooltip: 'Add Task',
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  // elevation: 5.0,
                ),

        //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        //Bottom navigation bar buttons
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _page.jumpToPage(0);
                  });
                },
                icon: const Icon(Icons.check_box, color: navBar),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _page.jumpToPage(1);
                  });
                },
                icon: const Icon(Icons.calendar_month, color: navBar),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _page.jumpToPage(2);
                  });
                },
                icon: const Icon(Icons.settings, color: navBar),
              ),
            ],
          ),
        )
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
                  for(Todo Todos in TodoL)
                    Slidable(
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed:(context)=> _onDismissed(Todos.id),
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: buildListTile(Todos, ontodoChange: _handleToDoChange)),
                ]
              )
            ),
          ],
        );
  }

  ListTile buildListTile(todo, {required ontodoChange}) {
    DateTime now = DateTime.now();
    return ListTile(
                  onTap: (){
                    ontodoChange(todo);
                  },
                  leading: Icon(
                    todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
                    color: Colors.grey,),
                  title: Text(
                    todo.task!,
                    style: TextStyle(
                      fontSize: 16,
                      color: todo.isDone ? Colors.black.withOpacity(0.4): Colors.black,
                    ),
                  ),
                  trailing: Text(_formatTime(now),
                    style: TextStyle(color: todo.isDone ? Colors.black.withOpacity(0.4): Colors.black),)

    );
  }

  //This function is called in listTile function to add time to the task
  String _formatTime(DateTime dateTime) {
      return '${dateTime.hour}:${dateTime.minute}';
  }

  //Top navigation bar
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
      ],);
  }

    // function to change state of task, change completed task to pending and vice versa
    void _handleToDoChange(Todo todo){
      setState(() {
        todo.isDone = !todo.isDone;
      });
    }

    // method to add item in todoList by tapping on floating action button
    void _addItem(String title){
    TodoL.add(Todo(id: '5', task: title));
    _todoController.clear();
    }

    void _onDismissed(String? ID){
    final num = ID;
      setState(() {
        TodoL.removeWhere((item)=> item.id == num);
      });
    }

    Future<Future> _displayDialog(BuildContext context) async{
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Add task"),
            content: TextField(
              controller: _todoController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
          ),
            actions: [
              IconButton(
              onPressed: (){Navigator.of(context).pop();},
              icon: const Icon(Icons.cancel)),
              IconButton(onPressed: (){Navigator.of(context).pop();
                _addItem(_todoController.text);},
                icon: const Icon(Icons.add),
          )
          ],
          );
        });
    }

}
