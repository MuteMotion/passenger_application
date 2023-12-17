import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:mute_motion_passenger/constants.dart';
import 'package:mute_motion_passenger/features/navdrawer/presentation/views/nav_drawer_view.dart';
import 'package:mute_motion_passenger/features/requests/presentation/views/requests_view.dart';

import 'package:intl/intl.dart';
import 'package:mute_motion_passenger/features/requests/presentation/views/widgets/c_request_view.dart';
import 'package:mute_motion_passenger/features/requests/presentation/views/widgets/custom_drop_downn.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  bool btnPressed = false;
  static var formKey = GlobalKey<FormState>();
  var locationController = TextEditingController();
  var destinationController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var costController = TextEditingController();
  var paymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    final format = DateFormat("yyyy-MM-dd HH:mma");

    String dropdownvalue = 'Payment Method';

    var items = [
      'Payment Method',
      'VISA',
      'CASH',
    ];

    return Scaffold(
      drawer: NavDrawerView(),
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Requests',
          style:
              TextStyle(fontSize: 24, fontFamily: 'Lato', color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Choose which service you want',
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'Lato', color: kPrimaryColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(40, 70),
                                backgroundColor: kPrimaryColor,
                              ),
                              onPressed: () {
                                navigateTo(context, RequestsScreenView());
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Transport',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              left: 0,
                              top: -20,
                              child: Image.asset(
                                'assets/images/rafiki.png',
                                height: 55,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(40, 70),
                                backgroundColor: const Color(0xff316F89),
                              ),
                              onPressed: () {
                                navigateTo(context, RequestsScreenVieww());
                              },
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'City to city',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              left: 0,
                              top: -25,
                              child: Image.asset(
                                'assets/images/cuate.png',
                                height: 50,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: kPrimaryColor,
                  thickness: 1,
                  height: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'Please Enter your Location !!';
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    hintText: 'location',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'Please Enter your Destination !!';
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.airline_stops_rounded,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    hintText: 'Destination',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DateTimeField(
                  format: format,
                  decoration: InputDecoration(
                    hintText: 'Date and Time',
                    suffixIcon: Icon(Icons.date_range_rounded),
                    suffixIconColor: kPrimaryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: currentValue ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()));
                      return DateTimeField.combine(date, time);
                    } else {
                      return currentValue;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'Please Enter your Expexted Cost !!';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    hintText: 'Expected Cost',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // DropdownButtonFormField(
                //   dropdownColor: Colors.grey[200],
                //   value: dropdownvalue,
                //   icon: Icon(Icons.arrow_drop_down),
                //   items: items.map((String items) {
                //     return DropdownMenuItem(
                //       value: items,
                //       child: Text(items),
                //     );
                //   }).toList(),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownvalue = newValue!;
                //     });
                //   },
                // ),
                CustomDropDownn(),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(350, 60),
                    primary: kPrimaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      btnPressed = true;
                    });
                    if (formKey.currentState!.validate()) {
                      locationController.text;
                      destinationController.text;
                      timeController.text;
                      dateController.text;
                      costController.text;
                      paymentController.text;
                    }
                  },
                  child: btnPressed == false
                      ? Text(
                          'Send Request',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      : Text(
                          'Request Sent',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
