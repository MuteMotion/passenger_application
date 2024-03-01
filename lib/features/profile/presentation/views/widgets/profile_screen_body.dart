import 'package:flutter/material.dart';

import 'package:mute_motion_passenger/constants.dart';
import 'package:mute_motion_passenger/features/navdrawer/presentation/views/nav_drawer_view.dart';

class ProfileScreenViewBody extends StatelessWidget {
  ProfileScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawerView(),
      backgroundColor: Color(0xff003248),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    star(),
                    star(),
                    star(),
                    star(),
                    star(),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '(80 Reviews)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 320,
                      height: 75,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 25),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '100',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                                Text(
                                  ' Count of Req.',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                              endIndent: 0,
                              indent: 20,
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  ' EGP 2500',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                                Text(
                                  ' Cost of Rides',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Info(title: 'Full Name', subTitle: 'Norhan Ahmed'),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  thickness: 0.5,
                  height: 2,
                ),
                Info(
                  title: 'E-mail',
                  subTitle: 'Na0703346@gmail.com',
                ),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  thickness: 0.5,
                  height: 2,
                ),
                Info(
                  title: 'Phone',
                  subTitle: '01029585431',
                ),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  thickness: 0.5,
                  height: 2,
                ),
                Info(
                  title: 'Gender',
                  subTitle: 'Female',
                ),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  thickness: 0.5,
                  height: 2,
                ),
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/woman.png'),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: kPrimaryColor,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 24,
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 17, color: kPrimaryColor),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class star extends StatelessWidget {
  const star({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.amber,
      size: 20,
    );
  }
}
