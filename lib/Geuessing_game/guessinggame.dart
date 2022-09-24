import 'dart:math';


import 'package:flutter/material.dart';
import 'package:homework3/Geuessing_game/Guess.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homework3/Geuessing_game/dialog.dart';
class GuessingGame extends StatefulWidget {
  const GuessingGame({Key? key}) : super(key: key);

  @override
  State<GuessingGame> createState() => _GuessingGameState();
} //Guess g = new Guess();

Random r = Random();

class _GuessingGameState extends State<GuessingGame> {
  @override
  var myList = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  var show = 'ทายเลข 1 ถึง 100';
  var num ='';
  int count = 0;
  int a=0;
  int ans = r.nextInt(100) + 1;
  int t=-3;

  Widget Button(int i) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {

            setState(() {
              if(num.length<3){
                if(i==-1){
                  if(num.length==1){num=num.substring(0,0); }
                  else{
                  num=num.substring(0,num.length-1);
                  t=int.tryParse(num)!;}
                } else if(i==-2) {
                  num ='';

                }else{
                  num+=i.toString();
                  t=int.tryParse(num)!;
                }

              }else if(num.length==3){
    if(i==-1){
      if(num.length==1){num=num.substring(0,0);}
      else{
    num=num.substring(0,num.length-1);
    t=int.tryParse(num)!;}
    } else if(i==-2) {

    num ='';}
            } } );
            },
        customBorder: CircleBorder(),
        child: Container(
          width: 60.0,
          height: 30.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black26,
                width: 1.0,
              )),
          child: i == -1
              ? Icon(
                  Icons.backspace_outlined,
                  color: Colors.purple,
                )
              : i == -2
                  ? Icon(
                      Icons.clear,
                      color: Colors.purple,
                    )
                  : Text(
                      i.toString(),
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20.0,
                      ),
                    ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 10.0,
              ),
              width: 10000.0,
              height: 500.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFFF5DBFF),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/guess_logo.png',
                        width: 80,
                      ),
                      Column(
                        children: [
                          Text(
                            ' GUESS',
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xFFCE93D8),
                            ),
                          ),
                          Text(
                            ' THE NUMBER',
                            style:
                                TextStyle(fontSize: 15, color: Colors.purple),
                          ),
                          //ElevatedButton(onPressed: Dogeuss(),

                              //child: child),
                        ],

                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    num,
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(show,style: GoogleFonts.sarabun(fontSize: 18),),
                  SizedBox(
                    height: 12.0,
                  ),
                  for (var r in myList)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [for (var i in r) Button(i)],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(-2),
                      Button(0),
                      Button(-1),
                     
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(onPressed: (){
                    if (num==''){
                      showMyDialog(context, 'Error', 'กรุณากรอกตัวเลข.');
                    }
                    if (t > ans) {
                      num='';
                      setState(() {
                        show = '$t : มากเกินไป';
                        count++;
                      });
                    }
                    if(t==-3){
                      setState(() {
                        show = 'ทายเลข 1 ถึง 100';
                      });

                    }
                    else if (t < ans) {
                      num='';
                      setState(() {
                        show = '$t : น้อยเกินไป';
                        count++;
                      });
                    }
                    if (t == ans) {
                      setState(() {
                        num='';
                        count++;
                        show = '$t : ถูกต้อง 🎉 (ทาย $count ครั้ง)';
                      });
                    }
                  },
                      child:
                      Text('GUSS',style: TextStyle(color: Colors.white,),),
                    style: ElevatedButton.styleFrom(primary: Colors.purple),





                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
