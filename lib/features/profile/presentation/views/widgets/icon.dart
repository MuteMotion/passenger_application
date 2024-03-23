import 'package:flutter/material.dart';
import 'package:mute_motion_passenger/constants.dart';

class ButtomSheet extends StatelessWidget {
  const ButtomSheet(
      {required this.takePhoto, required this.openGallery, Key? key});
  final VoidCallback takePhoto;
  final VoidCallback openGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20.0, color: kPrimaryColor),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                color: kPrimaryColor,
                icon: Icon(Icons.camera),
                onPressed: takePhoto,
              ),
              Text(
                'Camera',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontFamily: 'Comfortaa',
                ),
              ),
              SizedBox(
                width: 70,
              ),
              IconButton(
                  color: kPrimaryColor,
                  icon: Icon(Icons.image),
                  onPressed: openGallery),
              Text(
                'Gallery',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
