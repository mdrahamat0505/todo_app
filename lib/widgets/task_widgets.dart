import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_appp/const/colors.dart';
import 'package:todo_appp/data/firestor.dart';
import 'package:todo_appp/model/notes_model.dart';
import 'package:todo_appp/screen/edit_screen.dart';

class TaskWidget extends StatefulWidget {
  Note _note;
  TaskWidget(this._note, {super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    bool isDone = widget._note.isDon;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5.r,
              blurRadius: 7.r,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              // image
              imageee(),
              SizedBox(width: 25.w),
              // title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget._note.title,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Checkbox(
                          activeColor: customGreen,
                          value: isDone,
                          onChanged: (value) {
                           // setState(() {
                              isDone = !isDone;
                           // });
                            FirestoreDatasource()
                                .isdone(widget._note.id, isDone);
                          },
                        )
                      ],
                    ),
                    Text(
                      widget._note.subtitle,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                    ),
                    Spacer(),
                    edit_time()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget edit_time() {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: customGreen,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 6.h,
              ),
              child: Row(
                children: [
                  Expanded(flex: 0,child: Image.asset('images/icon_time.png')),
                  SizedBox(width: 5.w),
                  Expanded(flex: 0,
                    child: Text(
                      widget._note.time,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20.w),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditScreen(widget._note),
              ));
            },
            child: Container(
              width: 90.w,
              height: 28.h,
              decoration: BoxDecoration(
                color: Color(0xffE2F6F1),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                child: Row(
                  children: [
                    Image.asset('images/icon_edit.png'),
                    SizedBox(width: 10.w),
                    Text(
                      'edit',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageee() {
    return Container(
      height: 130.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/${widget._note.image}.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
