class Mundarija{
  final int id;
  final int page;
  final String title;
  final String?  desc;

  const Mundarija({required this.id, required this.page, required this.title, required this.desc});

  factory Mundarija.fromJson(Map<String, dynamic> json) {
    return Mundarija(
      id: json['id'],
      page: json['page'],
      title: json['title'],
      desc: json['desc'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['page'] = page;
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }

  @override
  String toString() {
    return 'Mundarija(id: $id, page: $page, title: $title, text: $desc)';
  }
}

class ClassModel{
  final int classId;
  final int classLevel;
  final List<Mundarija>mundarija;

  const ClassModel({required this.classId, required this.classLevel, required this.mundarija});

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      classId: json['classId'],
      classLevel: json['classLevel'],
      mundarija: List<Mundarija>.from(json['mundarija'].map((x) => Mundarija.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['classId'] = classId;
    data['classLevel'] = classLevel;
    data['mundarija'] = mundarija.map((e) => e.toJson()).toList();
    return data;
  }

  @override
  String toString() {
    return 'ClassModel(classId: $classId, classLevel: $classLevel, mundarija: $mundarija)';
  }
}

class BookModel{
  final int bookId;
  final String bookName;
  final String bookImage;
  final String status;
  final List<ClassModel>classes;

  const BookModel({required this.status,required this.bookImage,required this.bookId, required this.bookName, required this.classes});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookId: json['bookId'],
      bookName: json['bookName'],
      bookImage: json['bookImage'],
      status: json['status'],
      classes: List<ClassModel>.from(json['classes'].map((x) => ClassModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['bookId'] = bookId;
    data['bookName'] = bookName;
    data['bookImage'] = bookImage;
    data['status'] = status;
    data['classes'] = classes.map((e) => e.toJson()).toList();
    return data;
  }

  @override
  String toString() {
    return 'BookModel(bookId: $bookId, className: $bookName, classes: $classes)';  }
}

class DataModel{
  final List<BookModel>books;
  const DataModel({required this.books});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      books: List<BookModel>.from(json['books'].map((x) => BookModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['books'] = books.map((e) => e.toJson()).toList();
    return data;
  }

  @override
  String toString() {
    return 'DataModel(books: $books)';}}