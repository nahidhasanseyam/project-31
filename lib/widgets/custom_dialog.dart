import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomdDialog extends StatelessWidget {
  final primaryColor = const Color(0xFF75A2EA);

  final String title,
      description,
      primariBtnTxt,
      primariBtnRout,
      sndBtnRout,
      sndBtnTxt;

  CustomdDialog(
      {@required this.title,
      @required this.description,
      @required this.primariBtnTxt,
      @required this.primariBtnRout,
      this.sndBtnTxt,
      this.sndBtnRout});
  static const double padding = 20.0;
  @override
  Widget build(BuildContext context) {
    final _hight = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0.0, 10.0),
                  )
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: _hight * 0.05),
                AutoSizeText(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: _hight * 0.01),
                AutoSizeText(
                  description,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: _hight * 0.05),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed(primariBtnRout);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 30, right: 30),
                    child: AutoSizeText(
                      primariBtnTxt,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
                SizedBox(height: _hight * 0.02),
                showSecodaryBTN(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  showSecodaryBTN(BuildContext context) {
    if (sndBtnRout != null && sndBtnTxt != null) {
      return FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(sndBtnRout);
          },
          child: AutoSizeText(
            sndBtnTxt,
            maxLines: 1,
            style: TextStyle(
                fontSize: 18, color: primaryColor, fontWeight: FontWeight.w400),
          ));
    } else {
      return SizedBox(
        height: 5,
      );
    }
  }
}
