import 'package:flutter/material.dart';

class ActivityMap extends StatefulWidget {
  const ActivityMap({super.key});

  @override
  State<ActivityMap> createState() => _ActivityMapState();
}

class _ActivityMapState extends State<ActivityMap> {
  Color color = Colors.grey;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 40,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: 371,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = selectedIndex == index;
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(5)),
            ),
          );
        },
      ),
    );
  }
}

class ActivityMapContainerWidget extends StatelessWidget {
  const ActivityMapContainerWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height / 40,
        width: MediaQuery.of(context).size.width / 18,
        color: color,
      ),
    );
  }
}
