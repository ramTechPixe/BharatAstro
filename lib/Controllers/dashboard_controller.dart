import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bharatastro/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DashboardController extends GetxController {
  final apiService = Get.put(ApiService());

  AuthController authcontroller = Get.put(AuthController());
  DummyController dummycontroller = Get.put(DummyController());
  TextEditingController shipEmailController = TextEditingController();
  TextEditingController shipMobileController = TextEditingController();
  TextEditingController shipFirstname = TextEditingController();
  TextEditingController shipLastName = TextEditingController();
  TextEditingController shipAddessController = TextEditingController();
  TextEditingController shipPincodeController = TextEditingController();
  TextEditingController shipStateController = TextEditingController();
  TextEditingController shipCountryController = TextEditingController();
  TextEditingController shipCityController = TextEditingController();
  var userDetails = {}.obs;
  //fetchAll Plans
  var allPlans = [].obs;
  var selectedPlanType = "".obs;
  var selectedPlanId = "".obs;
  var selectedPlanAmount = "".obs;
  var fetchPlansLoading = false.obs;
  Future<void> userfetchAllPlans() async {
    fetchPlansLoading(true);

    try {
      var response =
          await apiService.getRequest(endpoint: "auth/fetchAllPlans");
//   'https://api.bharatastrosage.com/api/auth/fetchAllPlans' \
      List data = jsonDecode(response);
      print(data);
      if (data != null) {
        allPlans.value = data;

        print("object");
      } else {
        Fluttertoast.showToast(
          msg: "Somethisng went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: KDarkPink_twg,
        textColor: Kwhite,
        fontSize: 16.0,
      );
    } finally {
      fetchPlansLoading(false);
    }
  }

  // Post Ship Address
  var shippedAddressData = {}.obs;
  var userCreateOrderLoading = false.obs;
  var impvalue = 0.obs;
  var razorAmount = 0.obs;

  Future<void> useCreateOrders(Map payload) async {
    userCreateOrderLoading(true);

    impvalue.value = double.parse(selectedPlanAmount.value).toInt();
    print("object");
    try {
      var response = await apiService.postReportRequestzz(
        endpoint:
            "shiprocket/createCardOrder/${userDetails["userProfileId"]}/${impvalue.value}/${selectedPlanType.value}",

        ///${userDetails["userProfileId"]}/${selectedPlanAmount.value}/${selectedPlanType.value}
        // "shiprocket/createCardOrder/14/799/Card",
        payload: payload,
      );

      if (response["message"] != "Error: " && response is Map) {
        shippedAddressData.value = response;
        dummycontroller.order_map.value = response;

        // razorAmount.value =  
        //     double.parse(shippedAddressData["sub_total"]).toInt();
        authcontroller.openCheckout(
            shippedAddressData["order_id"], shippedAddressData["sub_total"]);
        Fluttertoast.showToast(
          msg: "Saved Shipping Address Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      debugPrint("Error: $e");
      Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      userCreateOrderLoading(false);
    }
  }

  // Verify payment

  //////////////////////////
//   var shippedAddressData = {}.obs;
//   var userCreatOrderLoading = false.obs;
//   Future<void> useCreateOrders(Map payload) async {
//     userCreatOrderLoading(true);

//     try {
//       //
//       var response = await apiService.postreportRequestz(
//           endpoint: "shiprocket/createCardOrder/14/799/Card",
//           //    'shiprocket/createCardOrder/${userDetails["userProfileId"]}/${selectedPlanAmount.value}/${selectedPlanType.value}',
//           //  "https://api.bharatastrosage.com/api/shiprocket/createCardOrder/${dashController.userDetail["userProfileId"]}/799/Card";
// //userDetail["userProfileId"]
//           //  "auth/login?email=${payload['user_email']}&password=${payload['user_password']}",
//           payload: payload);
// //    http://192.168.1.29:9094/api/auth/login?email=raja123%40gmail.com&password=raja123
//       //    Map data = jsonDecode(response);
//       Map data = jsonDecode(response);
//       print(data);
//       if (data != null) {
//         shippedAddressData.value = data;
//         Fluttertoast.showToast(
//           msg: "Saved Shipping Address Successfully",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: KDarkPink_twg,
//           textColor: Kwhite,
//           fontSize: 16.0,
//         );

//         print("object");
//       } else if (data["status"] == "error") {
//         Fluttertoast.showToast(
//           msg: response["message"],
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: KDarkPink_twg,
//           textColor: Kwhite,
//           fontSize: 16.0,
//         );
//       } else {
//         Fluttertoast.showToast(
//           msg: data["message"],
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: KDarkPink_twg,
//           textColor: Kwhite,
//           fontSize: 16.0,
//         );
//       }
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: "Something went wrong",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: KDarkPink_twg,
//         textColor: Kwhite,
//         fontSize: 16.0,
//       );
//     } finally {
//       userCreatOrderLoading(false);
//     }
//   }

  //
}
