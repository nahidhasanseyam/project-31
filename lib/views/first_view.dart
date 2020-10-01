import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/custom_dialog.dart';

class FirstView extends StatelessWidget {
  final primaryColor = const Color(0xFF75A2EA);
  @override
  Widget build(BuildContext context) {
    final _hight = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: primaryColor,
        height: _hight,
        width: _width,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: _hight * 0.1),
              AutoSizeText(
                "WellCome",
                style: TextStyle(fontSize: 44, color: Colors.white),
              ),
              SizedBox(height: _hight * 0.05),
              AutoSizeText("Let`s Start planning your Next Trip",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white70)),
              SizedBox(height: _hight * 0.1),
              RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomdDialog(
                            title: "Wold you like to Create a free account ?",
                            description:
                                "with am account , your data will desecurly saved,Wold you like to Create a free account  ",
                            primariBtnTxt: "Create My Account",
                            primariBtnRout: "/signUp",
                            sndBtnTxt: "Maybe later",
                            sndBtnRout: '/home',
                          ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 30, right: 30),
                  child: AutoSizeText(
                    "START ",
                    style: TextStyle(color: primaryColor, fontSize: 22),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              ),
              SizedBox(height: _hight * 0.03),
              FlatButton(
                  onPressed: () {},
                  child: Text("SING IN",
                      style: TextStyle(fontSize: 21, color: Colors.white70)))
            ],
          ),
        ),
      ),
    );
  }
}
