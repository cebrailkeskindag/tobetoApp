import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/tobeto_logo_footer.png",
                width: 150,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text("Bize Ulaşın",
                      style: TextStyle(color: Colors.black)))
            ],
          ),
          const Text("© 2022 Tobeto", style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
