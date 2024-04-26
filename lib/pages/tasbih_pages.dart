import 'package:flutter/material.dart';

class TasbiaPage extends StatefulWidget {
  const TasbiaPage({super.key});

  @override
  State<TasbiaPage> createState() => _TasbiaPageState();
}

class _TasbiaPageState extends State<TasbiaPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color(0xff333436),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Color(0xff7F8001),
          title: Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.speaker)),
              IconButton(onPressed: (){}, icon: Icon(Icons.share)),
              IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
              IconButton(onPressed: (){}, icon: Icon(Icons.speaker)),
              IconButton(onPressed: (){}, icon: Icon(Icons.speaker)),
              IconButton(onPressed: (){}, icon: Icon(Icons.speaker)),

            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              _incrementCounter();
            },
            child: Container(
              height: 200,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff168042),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                )
              ),
              child: Text("${_counter}",style: TextStyle(color: Colors.white,fontSize: 50),),
            ),
          ),
          
          Image.asset("images/hand.png")
        ],
      ),
    );
  }
}
