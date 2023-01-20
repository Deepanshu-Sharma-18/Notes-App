import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'DataModel_Hive.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late String tag;
}
