import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// class AddProductService {
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   void createProductDetails({
//     @required String productID,
//     @required String name,
//     @required String description,
//     @required String material,
//     @required String primaryCategory,
//     String secondaryCategory,
//   }) {
//     var id = Uuid();
//     String productNameID = id.v1();
//     _firestore.collection('productDetails').doc(productNameID).set(
//       {
//         'productName': name,
//         'productID': productID,
//         'productDescription': description,
//         'productMaterial': material,
//         'productPrimaryCategory': primaryCategory,
//         'productSecondaryCategory': secondaryCategory,
//       },
//     );
//   }
// }

class ImageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String ref = 'Images';

  void uploadImages({
    @required String imageUrl,
    @required String productID,
  }) {
    firestore.collection(ref).doc(productID).set(
      {
        'images': imageUrl,
      },
    );
  }
}

class AddProductService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createProductDetails({
    @required String productID,
    @required String name,
    @required String description,
    @required String material,
    @required String primaryCategory,
    String secondaryCategory,
    @required String productPrice,
    @required String productOldPrice,
    @required String productDiscount,
    @required String productSmallName,
  }) {
    var id = Uuid();
    String productNameID = id.v1();
    _firestore.collection('allProducts').doc(productNameID).set(
      {
        'productName': name,
        'productID': productID,
        'productDescription': description,
        'productMaterial': material,
        'productPrice': productPrice,
        'productOldPrice': productOldPrice,
        'productSmallName': productSmallName,
      },
    );
    if (primaryCategory == 'Bridal') {
      _firestore.collection('bridal').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
    if (primaryCategory == 'Casual') {
      _firestore.collection('casual').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
    if (primaryCategory == 'Party Wear') {
      _firestore.collection('party wear').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
    if (primaryCategory == 'Kids') {
      _firestore.collection('kids').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
    if (primaryCategory == 'Daily Wear') {
      _firestore.collection('daily wear').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
    if (secondaryCategory == 'Saree') {
      _firestore.collection('saree').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
    if (secondaryCategory == 'Churidar') {
      _firestore.collection('churidar').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
    if (secondaryCategory == 'Anarkali') {
      _firestore.collection('anarkali').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
    if (secondaryCategory == 'Lehenga') {
      _firestore.collection('lehenga').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
    if (secondaryCategory == 'Kurta') {
      _firestore.collection('kurta').doc(productNameID).set(
        {
          'productName': name,
          'productID': productID,
          'productDescription': description,
          'productMaterial': material,
          'productPrice': productPrice,
          'productOldPrice': productOldPrice,
          'productSmallName': productSmallName,
        },
      );
    }
  }
}
