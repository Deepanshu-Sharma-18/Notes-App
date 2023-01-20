import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/utils/Dimensions.dart';

class Tasks extends StatefulWidget {
  final bool isDarkMode;
  const Tasks({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  var isChecked1 = false;
  var isChecked2 = false;
  var isChecked3 = false;
  var isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.card250,
      width: Dimension.card175,
      padding: EdgeInsets.only(top: Dimension.size20, left: Dimension.size10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.size25),
        color: widget.isDarkMode ? Color(0xFF2A58F1) : Color(0xFF7FB3E7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center(
          //   widthFactor: double.maxFinite,
          // child:
          Text(
            'Tasks',
            style: TextStyle(
              fontSize: Dimension.size20,
              fontWeight: FontWeight.w500,
              color: widget.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          // ),
          //SizedBox(height: Dimension.size2,),
          Container(
            height: Dimension.card150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Dimension.size20,
                      height: Dimension.size20,
                      child: Checkbox(
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value!;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith((states) =>
                            widget.isDarkMode ? Colors.black : Colors.white),
                        shape: CircleBorder(side: BorderSide.none),
                        checkColor:
                            widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: Dimension.size13,
                    ),
                    Expanded(
                      child: Text(
                        'Learn New Things',
                        style: TextStyle(
                          fontSize: Dimension.size13,
                          fontWeight: FontWeight.w500,
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: Dimension.size20,
                      width: Dimension.size20,
                      child: Checkbox(
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith((states) =>
                            widget.isDarkMode ? Colors.black : Colors.white),
                        shape: CircleBorder(side: BorderSide.none),
                        checkColor:
                            widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: Dimension.size13,
                    ),
                    Expanded(
                      child: Text(
                        'Design Themes',
                        style: TextStyle(
                          fontSize: Dimension.size13,
                          fontWeight: FontWeight.w500,
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: Dimension.size20,
                      height: Dimension.size20,
                      child: Checkbox(
                        value: isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith((states) =>
                            widget.isDarkMode ? Colors.black : Colors.white),
                        shape: CircleBorder(side: BorderSide.none),
                        checkColor:
                            widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: Dimension.size13,
                    ),
                    Expanded(
                      child: Text(
                        'Share my work',
                        style: TextStyle(
                          fontSize: Dimension.size13,
                          fontWeight: FontWeight.w500,
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: Dimension.size20,
                      height: Dimension.size20,
                      child: Checkbox(
                        value: isChecked4,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked4 = value!;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith((states) =>
                            widget.isDarkMode ? Colors.black : Colors.white),
                        shape: CircleBorder(side: BorderSide.none),
                        checkColor:
                            widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: Dimension.size13,
                    ),
                    Expanded(
                      child: Text(
                        'Stay hydrated',
                        style: TextStyle(
                          fontSize: Dimension.size13,
                          fontWeight: FontWeight.w500,
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimension.size7,
          ),
          Container(
            margin: EdgeInsets.only(left: Dimension.size7),
            height: Dimension.size30,
            width: Dimension.size80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.size5),
              border: Border.all(
                  color: widget.isDarkMode ? Colors.white54 : Colors.black54),
            ),
            child: Center(
              child: Expanded(
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
          )
        ],
      ),
    );
  }
}
