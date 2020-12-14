// import 'dart:io';
// import 'package:hive/hive.dart';
//
// class FileAdapter extends TypeAdapter<File> {
//   @override
//   final typeId = 0;
//
//   @override
//   File read(BinaryReader reader) {
//     return User(reader.read());
//   }
//
//   @override
//   void write(BinaryWriter writer, User obj) {
//     writer.write(obj.name);
//   }
// }