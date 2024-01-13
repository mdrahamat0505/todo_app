import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_appp/const/colors.dart';
import 'package:todo_appp/data/auth_data.dart';

class LogINScreen extends StatefulWidget {
  final VoidCallback show;
  LogINScreen(this.show, {super.key});

  @override
  State<LogINScreen> createState() => _LogINScreenState();
}

class _LogINScreenState extends State<LogINScreen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener(() {
     // setState(() {});
    });
    super.initState();
    _focusNode2.addListener(() {
     // setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              image(),
              SizedBox(height: 50.h),
              textfield(email, _focusNode1, 'Email', Icons.email),
              SizedBox(height: 10.h),
              textfield(password, _focusNode2, 'Password', Icons.password),
              SizedBox(height: 8.h),
              account(),
              SizedBox(height: 20.h),
              Login_bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14.sp),
          ),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              'Sign UP',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget Login_bottom() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.r),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote().login(email.text, password.text);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: customGreen,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            'LogIn',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget textfield(TextEditingController _controller, FocusNode _focusNode,
      String typeName, IconData iconss) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(
                iconss,
                color: _focusNode.hasFocus ? customGreen : Color(0xffc5c5c5),
              ),
              contentPadding:
              EdgeInsets.symmetric(horizontal: 15.r, vertical: 15),
              hintText: typeName,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 2.0.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: customGreen,
                  width: 2.0.w,
                ),
              )),
        ),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.r),
      child: Container(
        width: double.infinity,
        height: 300.h,
        decoration: BoxDecoration(
          color: backgroundColors,
          image: DecorationImage(
            image: AssetImage('images/7.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
