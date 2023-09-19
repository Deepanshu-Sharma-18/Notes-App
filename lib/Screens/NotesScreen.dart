// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/Screens/ExpandedNote.dart';
import 'package:notesapp/utils/Dimensions.dart';

import '../utils/CustomNote.dart';
import '../utils/DataModel_Hive.dart';
import '../utils/Tasks.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  bool isDarkMode = true;

  Map<int, Color> noteColor = {
    1: Colors.blueAccent,
    2: Colors.greenAccent,
    3: Color(0xD21EEFE6),
    4: Color(0xFFD9317C),
    5: Colors.blueAccent,
    6: Colors.greenAccent,
    7: Color(0xE8D7D642),
    8: Color(0xFF7B5DDC),
    9: Colors.blueAccent,
    0: Colors.greenAccent,
  };

  void updateMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  late final Box box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<NotesModel>('noteApp');

    if (kDebugMode) {
      print(box.keys);
    }
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      floatingActionButton: Container(
        width: 80,
        height: 100,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Center(
            child: FloatingActionButton(
              backgroundColor: Color(0xFC00B2FF),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExpandedNote()));
              },
              elevation: 20,
              child: Icon(
                Icons.add,
                size: Dimension.size30,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Container(
          margin:
              EdgeInsets.only(left: Dimension.size10, right: Dimension.size10),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                backgroundColor: isDarkMode ? Colors.black : Colors.white,
                title: Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: Dimension.size30,
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      updateMode();
                    },
                    icon: Icon(
                      isDarkMode
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      size: Dimension.size25,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
                pinned: false,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                          valueListenable: box.listenable(),
                          builder: (context, box, widget) {
                            Map<dynamic, dynamic> raw = box.toMap();
                            List list = raw.values.toList();
                            return MasonryGridView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                crossAxisSpacing: Dimension.size10,
                                mainAxisSpacing: Dimension.size10,
                                itemCount: list.length,
                                gridDelegate:
                                    SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: ((context, index) {
                                  if (kDebugMode) {
                                    print(index);
                                  }
                                  NotesModel noteModel = list[index];
                                  return CustomNote(
                                    isDarkMode: isDarkMode,
                                    title: noteModel.title,
                                    description: noteModel.description,
                                    tag: noteModel.tag,
                                    color: noteColor[index % 10],
                                    hiveKey: index,
                                    box: box,
                                  );
                                }));
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 30,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70), color: noteColor[9]),
          )),
    );
  }
}
