import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mute_motion_passenger/constants.dart';

class DriverProfileViewBody extends StatelessWidget {
  const DriverProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(
          'Driver Profile',
          style: GoogleFonts.comfortaa(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height*1,       
             width: double.infinity,
          padding: const EdgeInsets.only(
            top: 20,
            left: 15,
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 20, top: 40, bottom: 20, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Driver will be in your destination ",
                  style: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  "After 15mins (2000m) ",
                  style: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff760F07),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/driver.png'),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Hassan Mohamed ",
                  style: GoogleFonts.comfortaa(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidStar,
                      color: Color(0xffF7B731),
                      size: 15,
                    ),
                    Text(
                      "4.9 (123 Reviewers)",
                      style: GoogleFonts.comfortaa(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 34,
                ),
                Container(
                  margin: EdgeInsets.only(right: 22, left: 10),
                  //padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                      color: const Color(0xff003248),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Toyota Corolla",
                            style: GoogleFonts.comfortaa(
                                fontSize: 10, color: Colors.white),
                          ),
                          Text(
                            "Color: white   Model: 2020 ",
                            style: GoogleFonts.comfortaa(
                                fontSize: 10, color: Colors.white),
                          ),
                          Text(
                            "( Automatic - Comfort - 4 seats)",
                            style: GoogleFonts.comfortaa(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        child: Image.asset('assets/images/car 1.png'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Container(
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.solidEnvelope),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'hassan.mohamed@gmail.com',
                        style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.phone),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '0100123456',
                        style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 58,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Show Map',
                            style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 58,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Message',
                            style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
