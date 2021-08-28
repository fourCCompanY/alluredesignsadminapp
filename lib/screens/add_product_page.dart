import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';

//===================MY OWN IMPORTS=====================
import 'package:alluredesigns_adminapp/db/db1.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Color kOurThemeColor = Color(0xFF626ABB);
  AddProductService productService = AddProductService();
  ImageService imageService = ImageService();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productSmallNameController = TextEditingController();
  TextEditingController productIDController = TextEditingController();
  TextEditingController productMaterialController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productOldPriceController = TextEditingController();
  TextEditingController productDiscountController = TextEditingController();
  File _image1;
  File _image2;
  File _image3;
  File _image4;
  File _image5;
  var selectedPrimaryCategory = 'Bridal';
  var selectedSecondaryCategory = '';
  final picker = ImagePicker();

  bool isFilled() {
    if (_image1 != null &&
        _image2 != null &&
        productCategoryController.text != null &&
        productDescriptionController.text != null &&
        productIDController.text != null &&
        productMaterialController.text != null &&
        productNameController.text != null &&
        productSmallNameController.text != null &&
        productDiscountController.text != null &&
        productPriceController.text != null &&
        productOldPriceController.text != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
    print('initstate pressed');
  }

  @override
  Widget build(BuildContext pagecontext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOurThemeColor,
        title: Text("Add Products"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
            ),
            child: Text(
              "Add Product Image : ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FlatButton(
                  onPressed: () {
                    _selectImage(
                      picker.getImage(source: ImageSource.gallery),
                      1,
                    );
                  },
                  child: _displayChild1(),
                ),
                FlatButton(
                  onPressed: () {
                    _selectImage(
                      ImagePicker().getImage(source: ImageSource.gallery),
                      2,
                    );
                  },
                  child: _displayChild2(),
                ),
                FlatButton(
                  onPressed: () {
                    _selectImage(
                      ImagePicker().getImage(source: ImageSource.gallery),
                      3,
                    );
                  },
                  child: _displayChild3(),
                ),
                FlatButton(
                  onPressed: () {
                    _selectImage(
                      ImagePicker().getImage(source: ImageSource.gallery),
                      4,
                    );
                  },
                  child: _displayChild4(),
                ),
                FlatButton(
                  onPressed: () {
                    _selectImage(
                      ImagePicker().getImage(source: ImageSource.gallery),
                      5,
                    );
                  },
                  child: _displayChild5(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ProfileLabel(label: " Product ID :"),
          ProfileTextField(
            labelHint: "Enter the unique Product ID...",
            controller: productIDController,
            textInputType: TextInputType.emailAddress,
          ),
          ProfileLabel(label: " Product Name :"),
          ProfileTextField(
            labelHint: "Enter Product Name...",
            controller: productNameController,
            textInputType: TextInputType.emailAddress,
          ),
          ProfileLabel(label: " Product Small Name :"),
          ProfileTextField(
            labelHint: "Enter small name of product (within 10 characters)...",
            controller: productSmallNameController,
            textInputType: TextInputType.emailAddress,
          ),
          ProfileLabel(label: " Product Price :"),
          ProfileTextField(
            labelHint: "Enter Product Price...",
            controller: productPriceController,
            textInputType: TextInputType.number,
          ),
          ProfileLabel(label: " Product Old Price :"),
          ProfileTextField(
            labelHint: "Enter Product Old Price...",
            controller: productOldPriceController,
            textInputType: TextInputType.number,
          ),
          ProfileLabel(label: " Product Discount :"),
          ProfileTextField(
            labelHint: "Enter Product Discount (in %)...",
            controller: productDiscountController,
            textInputType: TextInputType.number,
          ),
          ProfileLabel(label: " Product Description :"),
          ProfileTextField(
            labelHint: "Enter Product Description...",
            controller: productDescriptionController,
            textInputType: TextInputType.emailAddress,
          ),
          ProfileLabel(label: " Product Material :"),
          ProfileTextField(
            labelHint: "Enter Material used for product...",
            controller: productMaterialController,
            textInputType: TextInputType.emailAddress,
          ),
          ProfileLabel(label: " Product Category :"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileLabel(label: " ( Primary Category :  Select only 1 )"),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                  right: 10.0,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selectedPrimaryCategory,
                    onChanged: (value) {
                      setState(() {
                        selectedPrimaryCategory = value;
                      });
                      print(selectedPrimaryCategory);
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text("Bridal"),
                        value: 'Bridal',
                      ),
                      DropdownMenuItem(
                        child: Text("Casual"),
                        value: 'Casual',
                      ),
                      DropdownMenuItem(
                        child: Text("Party Wear"),
                        value: 'Party Wear',
                      ),
                      DropdownMenuItem(
                        child: Text("Kids"),
                        value: 'Kids',
                      ),
                      DropdownMenuItem(
                        child: Text("Daily Wear"),
                        value: 'Daily Wear',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileLabel(label: " ( Secondary Category :  Select only 1 )"),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                  right: 10.0,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selectedSecondaryCategory,
                    onChanged: (value) {
                      setState(() {
                        selectedSecondaryCategory = value;
                      });
                      print(selectedSecondaryCategory);
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text("Saree"),
                        value: 'Saree',
                      ),
                      DropdownMenuItem(
                        child: Text("Churidar"),
                        value: 'Churidar',
                      ),
                      DropdownMenuItem(
                        child: Text("Anarkali"),
                        value: 'Anarkali',
                      ),
                      DropdownMenuItem(
                        child: Text("Lehenga"),
                        value: 'Lehenga',
                      ),
                      DropdownMenuItem(
                        child: Text("Kurta"),
                        value: 'Kurta',
                      ),
                      DropdownMenuItem(
                        child: Text(""),
                        value: '',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 75.0,
        color: kOurThemeColor,
        child: Center(
          child: FlatButton(
            onPressed: () {
              print("proceed pressed");
              isFilled()
                  ? showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Confirm your post"),
                        content:
                            Text("Are you sure you want to upload this post?"),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("CANCEL"),
                          ),
                          FlatButton(
                            onPressed: () {
                              productService.createProductDetails(
                                productID: productIDController.text,
                                name: productNameController.text,
                                productSmallName:
                                    productSmallNameController.text,
                                description: productDescriptionController.text,
                                material: productMaterialController.text,
                                primaryCategory: selectedPrimaryCategory,
                                secondaryCategory: selectedSecondaryCategory,
                                productOldPrice: productOldPriceController.text,
                                productPrice: productPriceController.text,
                                productDiscount: productDiscountController.text,
                              );
                              validateAndUpload();
                              Navigator.pop(context);
                              Navigator.pop(pagecontext);
                            },
                            child: Text("PROCEED"),
                          ),
                        ],
                      ),
                    )
                  : showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Something went wrong."),
                        content: Text(
                            "Make sure you have filled all the necessary fields."),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      ),
                    );
            },
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
      ),
    );
  }

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

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Icon(
          Icons.add_photo_alternate,
          size: 50.0,
          color: Colors.grey,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Image.file(
          _image1,
        ),
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Icon(
          Icons.add_photo_alternate,
          size: 50.0,
          color: Colors.grey,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Image.file(
          _image2,
        ),
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Icon(
          Icons.add_photo_alternate,
          size: 50.0,
          color: Colors.grey,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Image.file(
          _image3,
        ),
      );
    }
  }

  Widget _displayChild4() {
    if (_image4 == null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Icon(
          Icons.add_photo_alternate,
          size: 50.0,
          color: Colors.grey,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Image.file(
          _image4,
        ),
      );
    }
  }

  Widget _displayChild5() {
    if (_image5 == null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Icon(
          Icons.add_photo_alternate,
          size: 50.0,
          color: Colors.grey,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
        ),
        child: Image.file(
          _image5,
        ),
      );
    }
  }

  void validateAndUpload() async {
    if (_image1 != null && _image2 != null) {
      final storage1 = FirebaseStorage.instance;
      var snapshot1 = await storage1
          .ref()
          .child('folderName/${productIDController.text}.1')
          .putFile(_image1);
      var downloadUrl1 = await snapshot1.ref.getDownloadURL();
      imageService.uploadImages(
          imageUrl: downloadUrl1, productID: '${productIDController.text}.1');

      final storage2 = FirebaseStorage.instance;
      var snapshot2 = await storage2
          .ref()
          .child('folderName/${productIDController.text}.2')
          .putFile(_image2);
      var downloadUrl2 = await snapshot2.ref.getDownloadURL();
      imageService.uploadImages(
          imageUrl: downloadUrl2, productID: '${productIDController.text}.2');

      if (_image3 != null) {
        final storage3 = FirebaseStorage.instance;
        var snapshot3 = await storage3
            .ref()
            .child('folderName/${productIDController.text}.3')
            .putFile(_image3);
        var downloadUrl3 = await snapshot3.ref.getDownloadURL();
        imageService.uploadImages(
            imageUrl: downloadUrl3, productID: '${productIDController.text}.3');
      }

      if (_image4 != null) {
        final storage4 = FirebaseStorage.instance;
        var snapshot4 = await storage4
            .ref()
            .child('folderName/${productIDController.text}.4')
            .putFile(_image4);
        var downloadUrl4 = await snapshot4.ref.getDownloadURL();
        imageService.uploadImages(
            imageUrl: downloadUrl4, productID: '${productIDController.text}.4');
      }

      if (_image5 != null) {
        final storage5 = FirebaseStorage.instance;
        var snapshot5 = await storage5
            .ref()
            .child('folderName/${productIDController.text}.5')
            .putFile(_image5);
        var downloadUrl5 = await snapshot5.ref.getDownloadURL();
        imageService.uploadImages(
            imageUrl: downloadUrl5, productID: '${productIDController.text}.5');
      }
      Fluttertoast.showToast(
        msg: 'Product Uploaded Successfully',
        timeInSecForIosWeb: 3,
      );
      // final String picture =
      //     "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
      // final task = storage.ref().child(picture);
      // task.putFile(_image1);
      // task.putFile(_image2);
      // if (_image3 != null) {
      //   task.putFile(_image3);
      // }
      // if (_image4 != null) {
      //   task.putFile(_image4);
      // }
      // if (_image5 != null) {
      //   task.putFile(_image5);
      // }
      // var imageUrl = await task.getDownloadURL();
      // imageService.uploadImages(imageUrl: imageUrl);
      // print('complete');
    } else {
      print('error');
    }
  }
}

class ProfileLabel extends StatelessWidget {
  final String label;

  ProfileLabel({
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        bottom: 10.0,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }
}

class ProfileTextField extends StatefulWidget {
  final labelHint;
  final controller;
  final textInputType;

  ProfileTextField({
    @required this.labelHint,
    @required this.controller,
    @required this.textInputType,
  });

  @override
  _ProfileTextFieldState createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 20.0,
            left: 20.0,
          ),
          child: TextFormField(
            keyboardType: widget.textInputType,
            key: widget.key,
            controller: widget.controller,
            style: TextStyle(
              height: 1.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: widget.labelHint,
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 10.0,
              ),
              contentPadding: EdgeInsets.only(
                top: 20.0,
                left: 10.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
            onChanged: (value) {
              print(value);
            },
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class OurCheckBox extends StatefulWidget {
  @override
  _OurCheckBoxState createState() => _OurCheckBoxState();
}

class _OurCheckBoxState extends State<OurCheckBox> {
  bool isChecked = false;
  Color kOurThemeColor = Color(0xFF626ABB);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: kOurThemeColor,
      onChanged: (newValue) {
        setState(() {
          isChecked = newValue;
        });
      },
    );
  }
}
