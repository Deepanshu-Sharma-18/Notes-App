import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notesapp/utils/Dimensions.dart';
import 'package:notesapp/utils/DataModel_Hive.dart';

class ExpandedNote extends StatefulWidget {
  const ExpandedNote({Key? key}) : super(key: key);

  @override
  State<ExpandedNote> createState() => _ExpandedNoteState();
}

class _ExpandedNoteState extends State<ExpandedNote> {
  final title = TextEditingController();
  final description = TextEditingController();
  final tag = TextEditingController();
  late final Box box;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box<NotesModel>('noteApp');
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    tag.dispose();
    super.dispose();
  }

  _addInfo() async {
    if (title.text != null && description.text != null && tag.text != null) {
      final note = NotesModel()
        ..title = title.text
        ..description = description.text
        ..tag = tag.text;

      box.add(note);
      if (kDebugMode) {
        print(box);
      }
    }
  }

  // _getInfo() {
  //   // Get info from people box
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Dimension.size10, vertical: Dimension.size25),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.size50),
                            color: Colors.black),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                          iconSize: Dimension.size25,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.size50),
                            color: Colors.black),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                          ),
                          iconSize: Dimension.size25,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: Dimension.size15, top: Dimension.size30),
                  width: double.maxFinite,
                  child: TextField(
                    controller: title,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    maxLength: 15,
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(
                      fontSize: Dimension.size30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimension.size2,
                ),
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color(0xFF6E6EEE),
                    borderRadius: BorderRadius.circular(Dimension.size7),
                  ),
                  padding: EdgeInsets.only(left: Dimension.size15),
                  child: TextFormField(
                    controller: description,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(
                      fontSize: Dimension.size20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimension.size15,
                ),
                Container(
                  padding: EdgeInsets.only(left: Dimension.size15),
                  width: double.maxFinite,
                  child: TextField(
                    controller: tag,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    maxLength: 8,
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(
                      fontSize: Dimension.size20,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Tag',
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimension.size30,
                ),
                TextButton(
                    onPressed: () {
                      _addInfo();
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 15),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Color(0xFFFFF900)),
                        minimumSize: MaterialStateProperty.resolveWith(
                            (states) =>
                                Size(Dimension.card120, Dimension.size50))),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: Dimension.size20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
