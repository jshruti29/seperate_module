import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void cameraAndGalleryDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Camera Permission'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                    'to grant permission to access your camera , go to your setting > Apps >'
                    ' Camera > permission')
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => openAppSettings(), child: Text('Setting')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('cancel'))
          ],
        );
      });
}
