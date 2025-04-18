import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StorageService with ChangeNotifier {
  final firebaseStorage = FirebaseStorage.instance;

  //Image stored in firebase as download url
  List<String> _imageUrls = [];

  //Loading Status
  bool _isLoading = false;

  //Uploading status
  bool _isUploading = false;

  //getter
  List<String> get imageUrls => _imageUrls;
  bool get isLoading => isLoading;
  bool get isUploading => _isUploading;

  //read img

  Future<void> fetchImages() async {
    _isLoading = true;

    final ListResult result =
        await firebaseStorage.ref('uploaded_images/').listAll();

    final urls =
        await Future.wait((result.items.map((ref) => ref.getDownloadURL())));

    _imageUrls = urls;

    _isLoading = false;
    //Update UI
    notifyListeners();
  }
  //delete img

  Future<void> deleteImages(String imageUrl) async {
    try {
      _imageUrls.remove(imageUrl);

      final String path = extractPathFromUrl(imageUrl);
      await firebaseStorage.ref(path).delete();
    } catch (e) {
      print("Error $e");
    }
    notifyListeners();
  }

  String extractPathFromUrl(String url) {
    Uri uri = Uri.parse(url);
    //extract the part of url we need
    String encodedPath = uri.pathSegments.last;
    //url decoding path
    return Uri.decodeComponent(encodedPath);
  }

  //Upload img

  Future<void> uploadImage() async {
    _isUploading = true;
    notifyListeners();

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    File file = File(image.path);

    try {
      String filePath = 'uploaded_images/${DateTime.now()}.jpg';
      await firebaseStorage.ref(filePath).putFile(file);
      String downloadUrl = await firebaseStorage.ref(filePath).getDownloadURL();

      _imageUrls.add(downloadUrl);
      notifyListeners();
    } catch (e) {
      print('Error : $e');
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }
}
