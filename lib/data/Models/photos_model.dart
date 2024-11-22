class PhotosModel {
  final String uploadDir;
  final String downloadURL;
  final String id;

  PhotosModel({
    required this.uploadDir,
    required this.downloadURL,
    required this.id,
  });

  factory PhotosModel.fromMap(Map<String, dynamic> map) {
    return PhotosModel(
      uploadDir: map['uploadDir'],
      downloadURL: map['downloadURL'],
      id: map['id'],
    );
  }
}
