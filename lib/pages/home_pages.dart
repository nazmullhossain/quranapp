import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/utils_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131C19),
appBar: AppBar(
  backgroundColor: Color(0xff131C19),
),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),

            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff169315),

                  ),
                  child: Column(
                    children: [
                     Image.asset("images/ass.png",fit: BoxFit.fill,height: 50,),
                      Text(
                        'Today`s Dua',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),


                        ),
                      ),
                      SizedBox(height: 3,),

                      Text(
                        '19 Ramadan 1445 AH',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),


                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'Allah is enough for me. There is no true god \n but Him.in Him I put my trust, an He is the \n Lord of the Great Throne.[Repeat seven tim..',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),


                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 250,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: GlobalVarriable.items.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15,
                          // mainAxisSpacing: 10,
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            // navigateToSearchScreen(context, GlobalVarriable.items[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff169315),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  GlobalVarriable.items[index].image,
                                  width: 30,
                                  height: 30,
                                  // color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  GlobalVarriable.items[index].title,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Image.asset("images/bac.png",width: double.infinity,fit: BoxFit.fill,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
