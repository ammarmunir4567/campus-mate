import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class resource extends StatefulWidget {
  const resource({super.key});

  @override
  State<resource> createState() => _resourceState();
}

class _resourceState extends State<resource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: _launchURL,
          child: new Text('Show Flutter homepage'),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url =
      'https://drive.google.com/drive/u/0/folders/1-xpPH-aPjhV2BLGp2pdk1inPcwiEpM-c';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
