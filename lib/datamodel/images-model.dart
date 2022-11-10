class ImageModel {
  List<Map<String, dynamic>> imageModel = [];
  ImageModel(this.imageModel);
  void addData(String imagePath) {
    imageModel.add({
      'time': DateTime.now(),
      'imagePath': imagePath,
    });
  }
}
