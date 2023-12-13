import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertNumber extends StatefulWidget {
  var num, alfa;
  InsertNumber(this.num, this.alfa);
  // InsertNumber({super.key});
 static String number="";

  @override

  State<InsertNumber> createState() => _InsertNumberState();
}

class _InsertNumberState extends State<InsertNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
      color: Colors.green,
        borderRadius: BorderRadius.circular(50)
      ),
      child: Wrap(children: [
        Text(
          "${widget.num}\n${widget.alfa}",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
