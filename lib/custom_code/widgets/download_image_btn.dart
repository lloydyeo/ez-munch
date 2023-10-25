// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:gallery_saver/gallery_saver.dart';

class DownloadImageBtn extends StatefulWidget {
  const DownloadImageBtn({
    Key? key,
    this.width,
    this.height,
    required this.imageUrl,
    this.downloadQrCode,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String imageUrl;
  final Future<dynamic> Function()? downloadQrCode;

  @override
  _DownloadImageBtnState createState() => _DownloadImageBtnState();
}

class _DownloadImageBtnState extends State<DownloadImageBtn> {
  @override
  Widget build(BuildContext context) {
    String hexColor = "#ED7D31";

    return Container(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: () {
          _downloadFile(widget.imageUrl);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(
              int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text("Download QR Code",
            style: TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }

  void _downloadFile(String path) async {
    GallerySaver.saveImage(path);
  }
}
