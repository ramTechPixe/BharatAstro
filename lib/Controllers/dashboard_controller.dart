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
  TextEditingController shipAddess2Controller = TextEditingController();
  TextEditingController shipPincodeController = TextEditingController();
  TextEditingController shipStateController = TextEditingController();
  TextEditingController shipCountryController = TextEditingController();
  TextEditingController shipCityController = TextEditingController();

  ///
  ///firstName:ram
// lastName:nayak
// mobileNumber:6281682528
// dateOfBirth:2025-06-14
// timeOfBirth:09:30 Am
// pincode:500072
// location:hyderabad
// style:south
// language:telugu
// gender:male
  TextEditingController addUserFnameController = TextEditingController();
  TextEditingController addUserLnameController = TextEditingController();
  TextEditingController addUserMobileController = TextEditingController();
  TextEditingController addUserPincodeController = TextEditingController();
  TextEditingController addUserLocationController = TextEditingController();
  TextEditingController addUserStyleController = TextEditingController();

  //
  TextEditingController editnameController = TextEditingController();
  TextEditingController editMobileController = TextEditingController();
  TextEditingController editLanguageController = TextEditingController();
  TextEditingController editImageController = TextEditingController();

  TextEditingController changeOldPasswordController = TextEditingController();
  TextEditingController changeNewPasswordController = TextEditingController();
  TextEditingController chnageConfirpasswordController =
      TextEditingController();

//image
  ///////////////////////////smb app
  Rx<File?> selectedImage = Rx<File?>(null);

  // Method to update the selected image
  void updateSelectedImage(File? image) {
    selectedImage.value = image;
    print("object");
  }

  ///
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
          await apiService.getRequest(endpoint: "api/auth/fetchAllPlans");
//   'https://api.bharatastrosage.com/api/auth/fetchAllPlans' \
      List data = jsonDecode(response);
      print(data);
      if (data != null) {
        allPlans.value = data;

        print(allPlans.value);
        print("scc");
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

  /// getOrders History
  ///
  var ordersList = [].obs;
  var orderDetails = {}.obs;
  var ordersLoading = false.obs;
  Future<void> userOrdersHistory() async {
    ordersLoading(true);
    ordersList.value = [];

    try {
      var response = await apiService.getRequestNoToken(
          endpoint:
              "api/shiprocket/fetchAllCardOrCardWebInvoices/${userDetails["userProfileId"]}");
//   ${BASE_URL}api/shiprocket/fetchAllCardOrCardWebInvoices/${userProfileId}

      List data = jsonDecode(response);
      print(data);
      if (data != null) {
        ordersList.value = data;

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
      ordersLoading(false);
    }
  }

  // orderForWEB
  Future<void> userOrdersHistoryWeb() async {
    ordersLoading(true);
    ordersList.value = [];
    try {
      var response = await apiService.getRequestNoToken(
          endpoint: "api/payments/webInvoice/${userDetails["userProfileId"]}");
//   ${BASE_URL}api/shiprocket/fetchAllCardOrCardWebInvoices/${userProfileId}
// ${BASE_URL}api/payments/webInvoice/${userProfileId}

      List data = jsonDecode(response);
      print(data);
      if (data != null) {
        ordersList.value = data;

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
      ordersLoading(false);
    }
  }

//   var deleteOderIDLoading = false.obs;
//   // Delete AstroRazorpay id
//   Future<void> deleterazorpayOrderid(String ids) async {
//     deleteOderIDLoading(true);

//     try {
//       var response = await apiService.deleterequestForID(
//           endpoint: "api/auth/deletePaymentBasedRazorPayOrderId/${ids}");
// //   https://api.bharatastrosage.com/api/auth/deletePaymentBasedRazorPayOrderId/776
// // ${BASE_URL}api/payments/webInvoice/${userProfileId}

//       List data = jsonDecode(response);
//       print(data);
//       if (data != null) {
//         print("object");
//       } else {
//         Fluttertoast.showToast(
//           msg: "Somethisng went wrong",
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
//       deleteOderIDLoading(false);
//     }
//   }

  ///

// ${BASE_URL}api/payments/webInvoice/${userProfileId}

// For web invoice-cum-order hi
  /// ///

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
            "api/shiprocket/createCardOrder/${userDetails["userProfileId"]}/${impvalue.value}/${selectedPlanType.value}",
        // "api/shiprocket/createCardOrder/${userDetails["userProfileId"]}/${impvalue.value}/${selectedPlanType.value}", value.replaceAll(" ", "")
        payload: payload,
      );

      if (response["message"] != "Error: " && response is Map) {
        shippedAddressData.value = response;
        dummycontroller.order_map.value = response;

        // razorAmount.value =
        //     double.parse(shippedAddressData["sub_total"]).toInt();
        // change flow
        //original
        // authcontroller.openCheckout(
        //     shippedAddressData["order_id"], shippedAddressData["sub_total"]);
        //test
        // test2

        // authcontroller.deleteRazorpayOrderID(shippedAddressData["order_id"]);
        // test3
        var total_value = shippedAddressData["frightCharges"] +
            shippedAddressData["sub_total"];
        showPaymentDialog(total_value);

        //   =34&=34&=cdc&=3e",
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

  //dialog
  void showPaymentDialog(double totalAmount) {
    Get.defaultDialog(
      title: "Confirm Payment",
      middleText: "Total Amount: ₹${totalAmount.toStringAsFixed(2)}",
      textCancel: "Cancel",
      textConfirm: "Continue",
      confirmTextColor: Colors.white,
      onCancel: () {
        var payload = {
          'shiprocketOrderId': shippedAddressData["shiprocketOrderId"]
        };
        delShip(payload);
        Get.back(); // Close dialog
      },
      onConfirm: () {
        var payload = {
          'paymentAmount': totalAmount,
          'planTypeId': selectedPlanId.value,
          'planType': shippedAddressData["planType"],
          'validity': "lifeTime"
          // 'validity': "lifeTime"
        };
        // ('https://api.bharatastrosage.com/api/payments/savePayment/24?paymentAmount=34&planTypeId=34&planType=cdc&validity=3e'));

        savepayment(payload);
        Get.back(); // Close dialog
        // Add your continue logic here
      },
      barrierDismissible: false, // Prevent dismissing by tapping outside
    );
  }
  //

  //changeflow1
  var delShipLoading = false.obs;
  Future<void> delShip(Map payload) async {
    delShipLoading(true);

    try {
      //
      var response = await apiService.postRequestDelSHipFormData(
          endpoint:
              "api/auth/deleteShipmentOrder?shiprocketOrderId=${payload["shiprocketOrderId"]}",
          //"api/auth/deleteShipmentOrder",

          // 'https://api.bharatastrosage.com/?shiprocketOrderId=675' \

          // "auth/login?email=${payload['user_email']}&password=${payload['user_password']}",
          payload: payload);
//    http://192.168.1.29:9094/api/auth/login?email=raja123%40gmail.com&password=raja123
      //    Map data = jsonDecode(response);
      Map data = jsonDecode(response);
      print(data);
      if (data != null) {
        // await UserSimplePreferences.setLoginStatus(loginStatus: true);

        // await UserSimplePreferences.setToken(token: data["token"].toString());

        // await UserSimplePreferences.setUserDetails(
        //     data["paymentDetails"][0] ?? {});

        Fluttertoast.showToast(
          msg: "Shipment deleted Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Kform_border_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        Get.back();
        // //userprofilecontroller.userProfileNavigation();
        // Get.toNamed(kNavigation);

        print("object");
      } else if (data["status"] == "error") {
        Fluttertoast.showToast(
          msg: response["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
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
      delShipLoading(false);
    }
  }

  //change flow2
  var savepaymentLoading = false.obs;
  Future<void> savepayment(Map payload) async {
    savepaymentLoading(true);

    try {
      //
      var response = await apiService.postRequestSavepaymentFormData(
          endpoint:
              "api/payments/savePayment/${userDetails["userProfileId"]}?paymentAmount=${payload["paymentAmount"]}&planTypeId=${payload["planTypeId"]}&planType=${payload["planType"]}&validity=${payload["validity"]}",
          // "api/auth/deleteShipmentOrder?shiprocketOrderId=${payload["shiprocketOrderId"]}",
          //"api/auth/deleteShipmentOrder",

          // 'https://api.bharatastrosage.com/?shiprocketOrderId=675' \

          // "auth/login?email=${payload['user_email']}&password=${payload['user_password']}",
          payload: payload);
//    http://192.168.1.29:9094/api/auth/login?email=raja123%40gmail.com&password=raja123
      //    Map data = jsonDecode(response);

      // await UserSimplePreferences.setLoginStatus(loginStatus: true);

      // await UserSimplePreferences.setToken(token: data["token"].toString());

      // await UserSimplePreferences.setUserDetails(
      //     data["paymentDetails"][0] ?? {});
      authcontroller.openCheckout(
          shippedAddressData["order_id"], shippedAddressData["sub_total"]);
      Fluttertoast.showToast(
        msg: "Payment Saved Successfully Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Kform_border_twg,
        textColor: Kwhite,
        fontSize: 16.0,
      );

      // //userprofilecontroller.userProfileNavigation();
      // Get.toNamed(kNavigation);
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
      savepaymentLoading(false);
    }
  }

  // savepayment mobile
  Future<void> savepaymentMobile(Map payload) async {
    savepaymentLoading(true);

    try {
      //
      var response = await apiService.savepaymobile(
          endpoint:
              //  "api/payments/savePayment/${userDetails["userProfileId"]}?paymentAmount=${payload["paymentAmount"]}&planTypeId=${payload["planTypeId"]}&planType=${payload["planType"]}&validity=${payload["validity"]}",
              "api/payments/savePayment/${userDetails["userProfileId"]}",
          // 'https://api.bharatastrosage.com/?shiprocketOrderId=675' \

          // "auth/login?email=${payload['user_email']}&password=${payload['user_password']}",

          payload: payload);
//    http://192.168.1.29:9094/api/auth/login?email=raja123%40gmail.com&password=raja123
      Map data = jsonDecode(response);

      // await UserSimplePreferences.setLoginStatus(loginStatus: true);

      // await UserSimplePreferences.setToken(token: data["token"].toString());

      // await UserSimplePreferences.setUserDetails(
      //     data["paymentDetails"][0] ?? {});

      authcontroller.openCheckout(
          data["razorPayOrderId"], data["paymentAmount"].toInt());
      // shippedAddressData["order_id"], shippedAddressData["sub_total"]);
      Fluttertoast.showToast(
        msg: "Payment Saved Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Kform_border_twg,
        textColor: Kwhite,
        fontSize: 16.0,
      );

      // //userprofilecontroller.userProfileNavigation();
      // Get.toNamed(kNavigation);
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
      savepaymentLoading(false);
    }
  }

  //Astroeditprofile
  var editAstroLoading = false.obs;
  Future<void> editAstro(Map payload) async {
    editAstroLoading(true);
    var pay = {};

    try {
      //
      var response = await apiService.editAstroRequest(
          endpoint:
              "api/userProfile/update2/${userDetails["userProfileId"]}?userName=${payload["userName"]}&mobileNumber=${payload["mobileNumber"]}&language=${payload["language"]}",
          // "api/payments/savePayment/${userDetails["userProfileId"]}?paymentAmount=${payload["paymentAmount"]}&planTypeId=${payload["planTypeId"]}&planType=${payload["planType"]}&validity=${payload["validity"]}",
          // "api/auth/deleteShipmentOrder?shiprocketOrderId=${payload["shiprocketOrderId"]}",
          //"api/auth/deleteShipmentOrder",

          // 'https://api.bharatastrosage.com/?shiprocketOrderId=675' \
          image: selectedImage.value,
          // "auth/login?email=${payload['user_email']}&password=${payload['user_password']}",
          payload: pay);
//    http://192.168.1.29:9094/api/auth/login?email=raja123%40gmail.com&password=raja123
      //    Map data = jsonDecode(response);

      var data = jsonDecode(response);
      print(data);
// {"success":"Issue created successfully"}
      if (!data.isEmpty) {
        // Fluttertoast.showToast(
        //   msg: data,
        // );
        Fluttertoast.showToast(
          msg: "Updated Successfully",
        );
        if (selectedImage.value != null) {
          updateSelectedImage(null);
        }
        // get latest data of user
        //////////////////////////////////////
        var payload = {
          "user_email": authcontroller.UserEmailSignInController.text,
          "user_password": authcontroller.UserEmailPasswordController.text
        };

        authcontroller.userSignInSplash(payload);
//////////////////////////////////////////////////////////////////////////
        //  Get.toNamed(kNavigation);
        // if (selectedVideos.value != null) {
        //   updateSelectedVideo(null);
        // }

        // else {
        //   Fluttertoast.showToast(
        //     msg: "Submitted Successfully",
        //   );
        // }

        // uploadImage();
        print("here");
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      }

      // //userprofilecontroller.userProfileNavigation();
      // Get.toNamed(kNavigation);
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
      editAstroLoading(false);
    }
  }

  //astroChangepassword
  var changeAstroLoading = false.obs;
  Future<void> astroChagnePassword(Map payload) async {
    changeAstroLoading(true);

    try {
      //
      var response = await apiService.changeAstroRequestv2(
          endpoint: "api/auth/changePassword/${userDetails["userProfileId"]}",
          payload: payload);
      // "api/auth/changePassword/${userDetails["userProfileId"]}?oldPassword=${payload["oldPassword"]}&password=${payload["password"]}&confirmPassword=${payload["confirmPassword"]}");

      var data = response;
      print(data);
// {"success":"Issue created successfully"}
      if (!data.isEmpty) {
        // Fluttertoast.showToast(
        //   msg: data,
        // );
        Fluttertoast.showToast(
          msg: "Changed Password Successfully",
        );

        //  Get.toNamed(kNavigation);
        // if (selectedVideos.value != null) {
        //   updateSelectedVideo(null);
        // }

        // else {
        //   Fluttertoast.showToast(
        //     msg: "Submitted Successfully",
        //   );
        // }

        // uploadImage();
        //here
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      }

      // //userprofilecontroller.userProfileNavigation();
      // Get.toNamed(kNavigation);
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
      changeAstroLoading(false);
    }
  }

  ///
  var postIssueLoading = false.obs;
  Future<void> update11User(Map payload) async {
    userDetailsUpdateLoading(true);

    //   "employee_id": scannedData["employee_id"],
    //   "employee_name": scannedData["employee_name"],
    //   "employee_designation": scannedData["employee_designation"],
    //   "profilepic": "base64 ${base64ImageValue.value}",
    //   "lat": "",
    //   "log": ""
    // };
    try {
      //
      //    var response = await apiService.postRequestDonorSignupFormDatabloodBank(
      var response = await apiService.postIssuesRequest(
          endpoint:
              "api/userProfile/update1/${userDetails["userProfileId"]}/${selectedPlanType.value}",
          payload: payload,
          // video: selectedVideos.value,
          image: selectedImage.value);
// https://twgpost.in/local_issues/upload/
      var data = jsonDecode(response);
      print(data);
// {"success":"Issue created successfully"}
      if (!data.isEmpty) {
        // Fluttertoast.showToast(
        //   msg: data,
        // );
        Fluttertoast.showToast(
          msg: "Submitted Successfully",
        );
        if (selectedImage.value != null) {
          updateSelectedImage(null);
        }
        var payload = {
          "user_email": authcontroller.UserEmailSignInController.text,
          "user_password": authcontroller.UserEmailPasswordController.text
        };

        // if (_formKey.currentState!.validate()) {
        //   authcontroller.userSignIn(payload);
        // }

        authcontroller.userSignInSplash(payload);

        //  Get.toNamed(kNavigation);
        // if (selectedVideos.value != null) {
        //   updateSelectedVideo(null);
        // }

        // else {
        //   Fluttertoast.showToast(
        //     msg: "Submitted Successfully",
        //   );
        // }

        // uploadImage();
        //here
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      userDetailsUpdateLoading(false);
    }
  }

  ///

  // afterpayment Add User
  var userDetailsUpdateLoading = false.obs;
  Future<void> update1User(Map payload) async {
    userDetailsUpdateLoading(true);

    impvalue.value = double.parse(selectedPlanAmount.value).toInt();
    print("object");
    try {
      var response = await apiService.postReportRequestzz(
        endpoint:
            "api/userProfile/update1/${userDetails["userProfileId"]}/${selectedPlanType.value}",
        // http://192.168.1.28:9094/api/userProfile/update1/24/Card and Web
        // "api/shiprocket/createCardOrder/${userDetails["userProfileId"]}/${impvalue.value}/${selectedPlanType.value}",
        // "api/shiprocket/createCardOrder/${userDetails["userProfileId"]}/${impvalue.value}/${selectedPlanType.value}", value.replaceAll(" ", "")
        payload: payload,
      );

      if (response != null) {
        shippedAddressData.value = response;
        dummycontroller.order_map.value = response;

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
      userDetailsUpdateLoading(false);
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
