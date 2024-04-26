import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/widget/utils_widget.dart';

class SuraPage extends StatelessWidget {
  const SuraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Color(0xff4CB050),
          leading: BackButton(
              color: Colors.white
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset("images/tra.png"),
            )
          ],
          title: Column(
            children: [
              Text('আল ফাতিহা',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),


                ),
              ),
              Text('بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),


                ),
              ),

            ],
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height *0.9,
            child: ListView.builder(
                itemCount: GlobalVarriable.items2.length,
                itemBuilder: (context,index){
              return Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          GlobalVarriable.items2[index].image,

                        ),
                        Text(GlobalVarriable.items2[index].arabic,style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),


                        ),)


                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(GlobalVarriable.items2[index].title,style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),


                    ),),
                    Text(GlobalVarriable.items2[index].subtitle,style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w100),


                    ),),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(0xff4CB050),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.pause,color: Colors.white,)),
                          IconButton(onPressed: (){
                            Clipboard.setData(ClipboardData(text: GlobalVarriable.items2[index].title));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Text copied to clipboard!')),
                            );
                          }, icon: Icon(Icons.copy,color: Colors.white,)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,)),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            }),
          ),
        ),
      ),




      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Increment',
        onPressed: (){},
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    


// floatingActionButton: FloatingActionButton(
//   backgroundColor: Color(0xff4CB050),
//   elevation: 0,
//
//   onPressed: (){},child: Icon(Icons.pause),),
    );
  }
}
