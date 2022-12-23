class StudentModel {
  String imageUrl;
  String studentName;
  String studentId;

  StudentModel({
    required this.imageUrl,
    required this.studentId,
    required this.studentName,
  });

  factory StudentModel.fromJson(Map<String, dynamic> jsonData) {
    return StudentModel(
      studentId: jsonData['studentId'] as String? ?? "",
      studentName: jsonData['studentName'] as String? ?? '',
      imageUrl: jsonData['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'studentName': studentName,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return ''''
       studentId : $studentId,
       studentName : $studentName,
       imageUrl : $imageUrl,
      ''';
  }
}
