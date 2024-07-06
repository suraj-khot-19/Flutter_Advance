import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter07AnimatedList extends StatefulWidget {
  const Flutter07AnimatedList({super.key});

  @override
  State<Flutter07AnimatedList> createState() => _Flutter07AnimatedListState();
}

class _Flutter07AnimatedListState extends State<Flutter07AnimatedList> {
  //creating list of items
  final _items = [];
  //key for amimated list state
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  //method to add item
  void add() {
    //item1
    //item2
    // ....
    _items.insert(0, "Item ${_items.length + 1}");
    //without using setstate we can rebuild widget using key
    _key.currentState!.insertItem(
      0, //index
      duration: const Duration(
        seconds: 2,
      ),
    ); /*Insert an item at [index] and start an animation that will be passed to
     [AnimatedList.itemBuilder] when the item is visible.*/
  }

//method to remove item
  void remove(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        // Creates a size transition.
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text(
                "Deleted",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
      duration: const Duration(seconds: 1),
    ); /*Remove the item at index and start an animation that will be passed to 
    builder when the item is visible.Items are removed immediately. After an 
    item has been removed, its index will no longer be passed to the itemBuilder. 
    However, the item will still appear for duration and during that time builder 
    must construct its widget as needed.*/

    //we removed item from current state but also need to remove forom list also
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                IconButton(
                  onPressed: add,
                  icon: const Icon(
                    Icons.add,
                    size: 50,
                  ),
                ),
                AnimatedList(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  //Creates a scrolling container that animates items when they are inserted or removed.
                  key: _key,
                  initialItemCount: 0,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index, animation) {
                    return SizeTransition(
                      sizeFactor: animation,
                      //Creates a key that is equal only to itself.
                      key: UniqueKey(),
                      child: Card(
                        color: Colors.blueAccent,
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            _items[index],
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () => remove(index),
                            icon: const Icon(Icons.delete_forever),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            CodeDisplay(text: MyCodes().animatedList)
          ],
        ),
      ),
    );
  }
}
