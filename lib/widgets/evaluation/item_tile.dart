import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        //tileColor: color.withOpacity(0.3),
        onTap: () {},

        title: Row(
          children: [
            Icon(Icons.list_alt_outlined),
            Text("Title"),
            ElevatedButton(onPressed: () {}, child: const Text("Başla"))
          ],
        ),
      ),
    );
  }
}
