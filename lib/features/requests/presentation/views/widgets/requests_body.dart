import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mute_motion_passenger/constants.dart';
import 'package:mute_motion_passenger/features/navdrawer/presentation/views/nav_drawer_view.dart';
import 'package:intl/intl.dart';
import 'package:mute_motion_passenger/features/requests/presentation/views/requests_view.dart';
import 'package:mute_motion_passenger/features/requests/presentation/views/widgets/c_request_view.dart';
import 'package:mute_motion_passenger/features/requests/presentation/views/widgets/custom_drop_downn.dart';
import 'package:mute_motion_passenger/features/requests/presentation/views/widgets/requsts.dart';
import 'package:mute_motion_passenger/features/requests/presentation/views/widgets/stack.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestsBody extends StatefulWidget {
  const RequestsBody({super.key});

  @override
  State<RequestsBody> createState() => _RequestsBodyState();
}

class _RequestsBodyState extends State<RequestsBody> {
  bool btnPressed = false;

  static var formKey = GlobalKey<FormState>();
  var locationController = TextEditingController();
  var destinationController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var costController = TextEditingController();
  var paymentController = TextEditingController();
  var passengersController = TextEditingController();
  var bagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd HH:mma");
    bool _isLoading = false;

    String dropdownvalue = 'Payment Method';

    var items = [
      'Payment Method',
      'VISA',
      'CASH',
    ];

    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        drawer: NavDrawerView(),
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Requests',
            style: TextStyle(
                fontSize: 24, fontFamily: 'Lato', color: Colors.white),
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: stack_model(
                                color: Color(0xff316F89),
                                top: -20,
                                hight: 55,
                                image: 'assets/images/rafiki.png',
                                type: 'Transport',
                                widdget: RequestsScreenView()),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            child: stack_model(
                                color: kPrimaryColor,
                                top: -25,
                                hight: 50,
                                image: 'assets/images/cuate.png',
                                type: 'City to city',
                                widdget: RequestsScreenVieww()),
                          ),
                        ],
                      ),
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
                    // validator: (data) {
                    //   if (data!.isEmpty) {
                    //     return 'Please Enter your Expexted Cost !!';
                    //   }
                    // },
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
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'Please Enter No of Passenger !!';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      hintText: 'No of Passenger',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'Please Enter No of Passenger !!';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      hintText: 'No of bags',
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(350, 60),
                        backgroundColor: kPrimaryColor,
                      ),
                      onPressed: () async {
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
                          passengersController.text;
                          bagsController.text;
                        }
                        setState(() {
                          _isLoading = true;
                        });
                        String url =
                            'https://mutemotion.onrender.com/api/passengers/:passengerId/city-to-city-rides';
                        Map<String, dynamic> requestData = {
                          "location": locationController.text,
                          "destination": destinationController.text,
                          "dateAndTime": dateController.text,
                          "expectedCost": costController.text,
                          "noOfPassenger": passengersController.text,
                          "noOfBags": bagsController.text,
                          "paymentMehod": paymentController.text,
                          "driver": null
                        };
                        try {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? id = prefs.getString("_id");
                          print('The id is $id');
                          // Encode the data to JSON
                          String jsonBody = jsonEncode(requestData);
                          // Make the HTTP POST request
                          final response = await http.post(
                            Uri.parse(url),
                            headers: {
                              'Content-Type': 'application/json',
                            },
                            body: jsonBody,
                          );
                          if (response.statusCode == 200 ||
                              response.statusCode == 201) {
                            print('Request successful');
                            print('Response: ${response.body}');
                          } else if (response.statusCode == 400) {
                            _showErrorDialog(
                              context,
                              "This Email Already Exists",
                              destinationController,
                              locationController,
                              bagsController,
                              passengersController,
                              dateController,
                              costController,
                              paymentController,
                            );

                            print(
                                'Request failed with status: ${response.statusCode}');
                            print('Response: ${response.body}');
                          }
                        } catch (error) {
                          print('Error: $error');
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: btnPressed == false
                          ? Text(
                              'Send Request',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          : Text(
                              'Request Sent',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showErrorDialog(
  BuildContext context,
  String message,
  TextEditingController destination,
  TextEditingController location,
  TextEditingController bags,
  TextEditingController cost,
  TextEditingController date,
  TextEditingController passenger,
  TextEditingController payment,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontFamily: 'Comfortaa', color: kPrimaryColor),
          // ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              bags.clear();
              passenger.clear();
              date.clear();
              payment.clear();
              destination.clear();
              location.clear();
              cost.clear();
              Navigator.of(context).pop();
              // navigateTo(context, RequestsBody());
              // Close the dialog
            },
            child: Container(
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Try Again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Comfortaa',
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
