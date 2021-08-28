import 'package:alluredesigns_adminapp/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class AddCarouselScreen extends StatefulWidget {
  @override
  _AddCarouselScreenState createState() => _AddCarouselScreenState();
}

class _AddCarouselScreenState extends State<AddCarouselScreen> {
  File _image1;
  File _image2;
  File _image3;
  File _image4;
  File _image5;
  void _selectImage(Future<PickedFile> pickImage, int imageNumber) async {
    PickedFile tempImage = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() {
          _image1 = File(tempImage.path);
        });
        break;
      case 2:
        setState(() {
          _image2 = File(tempImage.path);
        });
        break;
      case 3:
        setState(() {
          _image3 = File(tempImage.path);
        });
        break;
      case 4:
        setState(() {
          _image4 = File(tempImage.path);
        });
        break;
      case 5:
        setState(() {
          _image5 = File(tempImage.path);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOurThemeColor,
        title: Text("Add Carousel"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    onPressed: () {
                      _selectImage(
                        ImagePicker().getImage(source: ImageSource.gallery),
                        1,
                      );
                    },
                    child: displayChild1(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    onPressed: () {
                      _selectImage(
                        ImagePicker().getImage(source: ImageSource.gallery),
                        2,
                      );
                    },
                    child: displayChild2(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    onPressed: () {
                      _selectImage(
                        ImagePicker().getImage(source: ImageSource.gallery),
                        3,
                      );
                    },
                    child: displayChild3(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    onPressed: () {
                      _selectImage(
                        ImagePicker().getImage(source: ImageSource.gallery),
                        4,
                      );
                    },
                    child: displayChild4(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    onPressed: () {
                      _selectImage(
                        ImagePicker().getImage(source: ImageSource.gallery),
                        5,
                      );
                    },
                    child: displayChild5(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 75.0,
        color: kOurThemeColor,
        child: Center(
          child: Text(
            "UPDATE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Image.file(
          _image1,
        ),
      );
    }
  }

  Widget displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Image.file(
          _image2,
        ),
      );
    }
  }

  Widget displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Image.file(
          _image3,
        ),
      );
    }
  }

  Widget displayChild4() {
    if (_image4 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Image.file(
          _image4,
        ),
      );
    }
  }

  Widget displayChild5() {
    if (_image5 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          30.0,
          70.0,
          40.0,
          70.0,
        ),
        child: Image.file(
          _image5,
        ),
      );
    }
  }
}
