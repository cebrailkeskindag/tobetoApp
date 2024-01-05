import 'package:flutter/material.dart';

class EvaItem extends StatelessWidget {
  const EvaItem({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromARGB(255, 1, 48, 119),
                Color.fromARGB(255, 149, 181, 236)
              ],
                  transform: const GradientRotation(15),
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          width: screenWidth,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.list_alt_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                ElevatedButton(onPressed: () {}, child: const Text("Başla"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
