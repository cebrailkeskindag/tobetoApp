import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CircularButton extends StatefulWidget {
  const CircularButton({Key? key}) : super(key: key);

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

/*
void _launchWhatsApp() async {
  const phoneNumber = '+905551234567'; // Uluslararası formatta telefon numarası
  const message =
      'Merhaba, pair8 üzerinden mesaj gönderiyorum!'; // Başlangıç mesajı
  final url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';
  Uri wpUri = Uri.parse(url);
  if (await canLaunchUrl(wpUri)) {
    await launchUrl(wpUri);
  } else {
    throw 'WhatsApp açılamadı';
  }
}
*/

class _CircularButtonState extends State<CircularButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FabCircularMenuPlus(
        ringDiameter: 350.0,
        ringWidth: 100.0,
        ringColor: Colors.white.withOpacity(0.8),
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
            onTap: () {
              // _launchWhatsApp();
            },
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
