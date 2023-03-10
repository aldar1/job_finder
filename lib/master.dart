import 'package:flutter/material.dart';
import 'package:job_finder/data.dart';

class Master extends StatefulWidget {
  const Master({super.key});

  @override
  State<Master> createState() => _MasterState();
}

class _MasterState extends State<Master> {

  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem? selectedItem;

  @override
  void initState(){
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
    for (var i = 0; i < navigationItems.length; i++) {
      list.add(buildNavigationItem(navigationItems[i]));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedItem = item;
          // print(selectedItem!.title = item.title);
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
            selectedItem!.title == item.title
            ? Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle
                  ),
                )
              ],
            )
            : Container()
          ],
        ),
      ),
    );
  }
}
