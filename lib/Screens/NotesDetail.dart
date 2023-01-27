import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/utils/DataModel_Hive.dart';
import 'package:notesapp/utils/Dimensions.dart';

class NoteDetail extends StatefulWidget {
  final Box box;
  final String title;
  final String description;
  final String? tag;
  final int hivekey;
  NoteDetail({
    Key? key,
    required this.box,
    required this.title,
    required this.description,
    this.tag,
    required this.hivekey,
  }) : super(key: key);
  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  late TextEditingController titleController =
      TextEditingController(text: widget.title);
  late TextEditingController desController =
      TextEditingController(text: widget.description);
  late TextEditingController tagController =
      TextEditingController(text: widget.tag);

  @override
  Widget build(BuildContext context) {
    _addInfo() async {
      if (titleController.text != null &&
          desController.text != null &&
          tagController.text != null) {
        final note = NotesModel()
          ..title = titleController.text
          ..description = desController.text
          ..tag = tagController.text;

        widget.box.putAt(widget.hivekey, note);
      } else {
        AlertDialog(
          title: Text(
            'Fields can\'t be empty',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: (() {
          FocusManager.instance.primaryFocus?.unfocus();
        }),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimension.size10,
                        right: Dimension.size10,
                        top: Dimension.size30),
                    height: Dimension.size50,
                    width: Dimension.size80,
                    color: Colors.black54,
                    child: ElevatedButton(
                        onPressed: () {
                          _addInfo();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellowAccent,
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: Dimension.size20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: Dimension.size10,
                ),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: Dimension.size10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueAccent,
                  ),
                  child: TextField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    maxLength: 15,
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(
                      fontSize: Dimension.size30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 700,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(Dimension.size20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.greenAccent),
                  child: SingleChildScrollView(
                    child: TextFormField(
                      controller: desController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(
                        fontSize: Dimension.size25,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: Dimension.size15),
                  width: double.maxFinite,
                  child: TextField(
                    controller: tagController,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
