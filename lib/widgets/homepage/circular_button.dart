import 'dart:io';

import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CircularButton extends StatefulWidget {
  const CircularButton({Key? key}) : super(key: key);

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

late BuildContext _context;
whatsapp() async {
  var contact = "+905551234567";
  var androidUrl = "whatsapp://send?phone=$contact&text=Merhaba TOBETO";
  var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Merhaba TOBETO')}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    ScaffoldMessenger.of(_context).showSnackBar(
        const SnackBar(content: Text("WhatsApp is not installed.")));
  }
}

void _launchWhatsApp() async {
  const phoneNumber = '+905551234567';  
  const message =
      'Merhaba, pair8 üzerinden mesaj gönderiyorum!'; 
  final url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';
  
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'WhatsApp açılamadı';
  }
}

_launchURL() async {
  final Uri url = Uri.parse('https://www.linkedin.com/company/tobeto/');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'info@tobeto.com',
    queryParameters: {'subject': 'Merhaba TOBETO'});

class _CircularButtonState extends State<CircularButton> {
  @override
  Widget build(BuildContext context) {
    _context = context;
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
            onTap: () {
              launchUrl(_emailLaunchUri);
            },
            mini: true,
            buttonType: ButtonType.email,
          ),
          FlutterSocialButton(
            onTap: () {
              whatsapp();
            },
            mini: true,
            buttonType: ButtonType.whatsapp,
          ),
          FlutterSocialButton(
            onTap: () {
              _launchURL();
            },
            mini: true,
            buttonType: ButtonType.linkedin,
          ),
        ],
      ),
    );
  }
}
