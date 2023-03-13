import 'package:flutter/material.dart';
import 'package:job_finder/data.dart';
import 'package:job_finder/jobs.dart';
import 'package:job_finder/applications.dart';

class Master extends StatefulWidget{
  const Master({super.key});

  @override
  State<Master> createState()=> _MasterState();
}

class _MasterState extends State<Master>{
  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem? selectedItem;
  Widget? currentWidget;

  @override
  void initState(){
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
      currentWidget = const Jobs();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: currentWidget,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigationItems(),
        ),
      ),
    );
  }
  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (int i = 0; i < navigationItems.length; i++) {
      list.add(buildNavigationItem(navigationItems[i]));
    }
    return list;
  }
  Widget buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: (){
        setState(() {
          switch(item.title){
            case 'Jobs' : currentWidget = const Jobs(); break;
            case 'Applications' : currentWidget = const Applications(); break;
          }
          selectedItem = item;
        });
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: selectedItem == item ? 1.0 : 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            selectedItem == item
            ? Container(
                margin: const EdgeInsets.only(top: 4),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle
                ),
            )
            : Container()
          ],
        ),
      ),
    );
  }
}