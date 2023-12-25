import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class CircularButton extends StatefulWidget {
  const CircularButton({Key? key}) : super(key: key);

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FabCircularMenuPlus(
        ringDiameter: 400.0,
        ringWidth: 100.0,
        fabOpenIcon: const Icon(
          Icons.message_outlined,
          color: Colors.white,
        ),
        fabCloseIcon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        children: <Widget>[
          FlutterSocialButton(
            onTap: () {},
            mini: true,
            buttonType: ButtonType.email,
          ),
          FlutterSocialButton(
            onTap: () {},
            mini: true,
            buttonType: ButtonType.whatsapp,
          ),
          FlutterSocialButton(
            onTap: () {},
            mini: true,
            buttonType: ButtonType.linkedin,
          ),
        ],
      ),
    );
  }
}
