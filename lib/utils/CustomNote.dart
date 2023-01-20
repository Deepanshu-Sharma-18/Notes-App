import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/utils/DataModel_Hive.dart';

import 'Dimensions.dart';

class CustomNote extends StatefulWidget {
  final bool isDarkMode;
  final Image? img;
  final String title;
  final String description;
  final String? tag;
  DateTime now = DateTime.now();
  final Color? color;
  final int hiveKey;
  final Box box;

  CustomNote(
      {Key? key,
      required this.isDarkMode,
      this.img,
      required this.title,
      required this.description,
      this.tag,
      required this.color,
      required this.hiveKey,
      required this.box})
      : super(key: key);

  @override
  State<CustomNote> createState() => _CustomNoteState();
}

class _CustomNoteState extends State<CustomNote> {
  Map<int, String> monthsInYear = {
    1: "Jan",
    2: "Feb",
    3: "March",
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: "Dec"
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        widget.box.delete(widget.box.keyAt(widget.hiveKey));
      },
      child: Container(
        height: Dimension.card320,
        width: Dimension.card175,
        padding: EdgeInsets.only(
            top: Dimension.size20,
            left: Dimension.size10,
            right: Dimension.size10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.size25),
          color: widget.color,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: Dimension.size20,
              fontWeight: FontWeight.w500,
              color: widget.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(
            height: Dimension.size15,
          ),
          Container(
            height: Dimension.card175,
            child: Text(
              widget.description,
              overflow: widget.description.length > Dimension.card195
                  ? TextOverflow.ellipsis
                  : TextOverflow.visible,
              maxLines: 10,
              style: TextStyle(
                fontSize: Dimension.size15,
                fontWeight: FontWeight.w400,
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: Dimension.size7),
                height: Dimension.size30,
                padding: EdgeInsets.symmetric(horizontal: Dimension.size15),
                //width: Dimension.size80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  border: Border.all(
                      color:
                          widget.isDarkMode ? Colors.white54 : Colors.black54),
                ),
                child: Center(
                  child: Text(
                    'Todo',
                    style: TextStyle(
                      fontSize: Dimension.size10,
                      fontWeight: FontWeight.w400,
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: Dimension.size7),
                padding: EdgeInsets.symmetric(horizontal: Dimension.size15),
                height: Dimension.size30,
                //width: Dimension.size80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  border: Border.all(
                      color:
                          widget.isDarkMode ? Colors.white54 : Colors.black54),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      (monthsInYear[widget.now.month].toString() +
                              ' ' +
                              widget.now.day.toString())
                          .toString(),
                      style: TextStyle(
                        fontSize: Dimension.size10,
                        fontWeight: FontWeight.w400,
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
