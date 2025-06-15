import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  
   MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
    double size = 0;
    String inputValue = "";
    String calcutedValue = "";
    String operator = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width/5;

    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(inputValue, style: TextStyle(color: Colors.white, fontSize: 100),),
            ),

            Column(
              children: [

                Row(
                  children: [

                    calcButton("7", Colors.white38),
                    calcButton("8", Colors.white38),
                    calcButton("9", Colors.white38),
                    calcButton("/", Colors.orange),

                  ],
                ),

                Row(
                  children: [

                    calcButton("4", Colors.white38),
                    calcButton("5", Colors.white38),
                    calcButton("6", Colors.white38),
                    calcButton("*", Colors.orange),

                  ],
                ),

                Row(
                  children: [

                    calcButton("1", Colors.white38),
                    calcButton("2", Colors.white38),
                    calcButton("3", Colors.white38),
                    calcButton("-", Colors.orange),

                  ],
                ),

                Row(
                  children: [

                    calcButton("0", Colors.white38),
                    calcButton(".", Colors.white38),
                    calcButton("=", Colors.orange),
                    calcButton("+", Colors.orange),

                  ],
                ),

                

              ],
            ),
            calcButton("Clear", Colors.black)


          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgColor){
    return InkWell(
      onTap: () {
        if(text == "Clear"){
          setState(() {
            inputValue = ""; 
            calcutedValue = "";
            operator = "";
          });
        }
        else if(text=="+" || text=="-" || text=="*" || text=="/"){
          setState(() {
            operator = text;
            calcutedValue = inputValue;
            inputValue = "";
          });
        }
        else if(text=="="){
          setState(() {
            // inputValue = calcutedValue + inputValue;

            double calcVal = double.parse(calcutedValue);
            double inputVal = double.parse(inputValue);

            if(operator == "+"){
              inputValue = (calcVal + inputVal).toString();
            }
            else if(operator == "-"){
              inputValue = (calcVal - inputVal).toString();
            }
            else if(operator == "*"){
              inputValue = (calcVal * inputVal).toString();
            }
            else if(operator == "/"){
              inputValue = (calcVal / inputVal).toString();
            }
    
          });
        }
        else{
          setState(() {
          inputValue = inputValue + text;
        }); 
        }
        
      },
      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(100)
                          
                        ),
                        margin: EdgeInsets.all(10),
                        height: size,
                        width: size,
                        alignment: Alignment.center,
                        child: 
                        Text(text, style: TextStyle(color: Colors.white, fontSize: 35),),
                      ),
    );
  }
}
