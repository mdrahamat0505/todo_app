import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_appp/const/colors.dart';
import 'package:todo_appp/screen/add_note_screen.dart';
import 'package:todo_appp/widgets/stream_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool show = true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Add_creen(),
            ));
          },
          backgroundColor: customGreen,
          child: Icon(Icons.add, size: 30.r),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
            //  setState(() {
                show = true;
             // });
            }
            if (notification.direction == ScrollDirection.reverse) {
            //  setState(() {
                show = false;
            //  });
            }
            return true;
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                StreamNote(false),
                Text(
                  'isDone',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold),
                ),
                StreamNote(true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
