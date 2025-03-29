import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bharatastro/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';

class MatchingController extends GetxController {
  final apiService = Get.put(ApiService());
  DashboardController dashController = Get.put(DashboardController());
  // AuthController authcontroller = Get.put(AuthController());
  // fetch astro data
  ////////////////////////////////////

  /////////////////////
  var astroDataLoading = false.obs;
  var astroDataWebhook = {}.obs;
  var getAstroPayload = {}.obs;

  var finalPayload = {}.obs;
  // fetch time zone
  var timezoneloading = false.obs;
  var timezoneData = {}.obs;

  Future<void> userfetchTimezone(Map pload) async {
    timezoneloading(true);
    //  vilages.value = [];
    final double lat = pload["lat"];
    final double lng = pload["lng"];

    try {
      var response = await apiService.weatherRequest(
          endpoint:
              "https://weatherapi-com.p.rapidapi.com/timezone.json?q=$lat,$lng"
          //  "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/${code}",
          );
      // "api/auth/fetchAllPlans");
//
      var data = jsonDecode(response);
      print(data);
      if (data != null) {
        // allPlans.value = data;
        timezoneData.value = data["location"];
        print("object");
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
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
      timezoneloading(false);
    }
  }

  // get villages
  var villagesLoading = false.obs;
  var vilages = [].obs;
  var selectd_village = "".obs;
  Future<void> userfetchVillages(String code) async {
    villagesLoading(true);
    vilages.value = [];

    try {
      var response = await apiService.vilagegetRequest(
        endpoint:
            "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/${code}",
      );
      // "api/auth/fetchAllPlans");
//
      var data = jsonDecode(response);
      print(data);
      if (data != null) {
        // allPlans.value = data;
        vilages.value = data;
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
      villagesLoading(false);
    }
  }

  //

  //////////////start

  //  weekOfTheMonth.value = getWeekOfMonth(DateTime.now());

  //   user.value = {
  //     "Date": formattedDate.value,
  //     "Zodiac": null,
  //     "show_same": true,
  //     "split": true,
  //     "Lang": null,
  //     "Week": weekOfTheMonth.value,
  //     "Year": DateTime.now().year,
  //     "Dob": null,
  //   };
  // }

  int getWeekOfMonth(DateTime date) {
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    int pastDays = date.difference(firstDayOfMonth).inDays;
    return ((pastDays + firstDayOfMonth.weekday) / 7).ceil();
  }

  var postastroDataLoading = false.obs;
  /////////////end\
  // Api Post Prediction Astro Data
  Future<void> postAstroData(Map payload) async {
    postastroDataLoading(true);

    print("object");
    try {
      var response = await apiService.postRequest(
        endpoint:
            "api/matching/save/${dashController.userDetails["userProfileId"]}",
        // `${BASE_URL}api/matching/save/${userProfileId}`,
        //    "api/webhook/prediction/trigger?userProfileId=${dashController.userDetails["userProfileId"]}&title=${selected_cardData["title"]}&isLongTerm=${selected_cardData["isLongTerm"]}",
        //   "api/shiprocket/createCardOrder/${userDetails["userProfileId"]}/${impvalue.value}/${selectedPlanType.value}",
        //   `${BASE_URL}api/webhook/prediction/trigger?userProfileId=${userProfileId}&title=${selectedCardTitle}&isLongTerm=${isLongTerm}`,

        payload: payload,
      );
      var data = response;
      print(data);
      if (data != null) {
        // if (response["message"] != "Error: " && response is Map) {
        //   shippedAddressData.value = response;
        //   dummycontroller.order_map.value = response;

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

        //   =34&=34&=cdc&=3e",
        // Fluttertoast.showToast(
        //   msg: "${data}",
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   backgroundColor: kblack,
        //   textColor: Colors.white,
        //   fontSize: 16.0,
        // );
        Get.toNamed(kAstroOutput, arguments: "${data}");
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
      postastroDataLoading(false);
    }
  }

  ///
  var partnerDatas = {}.obs;
  Future<void> getAstroData() async {
    astroDataLoading(true);
    astroDataWebhook.value = {};
    try {
      var response = await apiService.getRequestNoToken(
          endpoint:
              "api/userProfile/webhook/${dashController.userDetails["userProfileId"]}"
          //
          );
//   ${BASE_URL}api/shiprocket/fetchAllCardOrCardWebInvoices/${userProfileId}
// ${BASE_URL}api/payments/webInvoice/${userProfileId}

      var data = jsonDecode(response);
      print(data);
      if (data != null) {
        /////
        // Dob: data.dateOfBirth,
        // Tob: data.timeOfBirth,
        // Tz: data.timeZone,
        // Lat: data.latitude,
        // Lon: data.longitude,
        // Gen: data.gender,
        // Lang: data.language,
        // Gen: data.gender,
        //////

        //
        astroDataWebhook.value = data;
        getAstroPayload['Lang'] = astroDataWebhook["language"];
        getAstroPayload['cardId'] = selected_cardData["id"];
        getAstroPayload['type'] = selected_cardData["Type"];
        // getAstroPayload['zodiac'] = astroDataWebhook["zodiac"];
        getAstroPayload['show_same'] = true;
        getAstroPayload['split'] = true;
        getAstroPayload['service'] = selected_cardData["title"];
        getAstroPayload['Date'] = astroDataWebhook["localDate"];
        getAstroPayload['Dob'] = astroDataWebhook["dateOfBirth"];
        getAstroPayload['Lat'] = astroDataWebhook["latitude"];
        getAstroPayload['Lon'] = astroDataWebhook["longitude"];
        getAstroPayload['Tz'] = astroDataWebhook["timeZone"];
        getAstroPayload['Tob'] = astroDataWebhook["timeOfBirth"];
        getAstroPayload['gender'] = astroDataWebhook["gender"];
        //  getAstroPayload['Week'] = astroDataWebhook["dateOfBirth"];
        DateFormat format = DateFormat("yyyy-MM-dd");
        DateTime parsedDate = format.parse(astroDataWebhook["localDate"]);
        //  DateTime parsedDate = format.parse("2024-03-12");

        weekOfTheMonth.value = getWeekOfMonth(parsedDate);
        getAstroPayload['Week'] = weekOfTheMonth.value;

        if (zodiacSigns.containsKey(astroDataWebhook["zodiac"])) {
          int zodiacValue =
              zodiacSigns[astroDataWebhook["zodiac"]]!; // Get the value
          print("Zodiac Value: $zodiacValue");
          getAstroPayload['zodiac'] = zodiacValue;
          // Compare with a value from astroDataWebhook
          // int astroDataValue = 5; // Example value

          // if (zodiacValue == astroDataValue) {
          //   print("Match Found: $zodiacKey");
          // } else {
          //   print("No Match Found");
          // }
        } else {
          print("Invalid Zodiac Sign");
        }

        ///
        //  getAstroPayload['Lang'] = astroDataWebhook["language"];
        // getAstroPayload['cardId'] = selected_cardData["id"];
        // getAstroPayload['type'] = selected_cardData["Type"];
        // // getAstroPayload['zodiac'] = astroDataWebhook["zodiac"];
        // getAstroPayload['show_same'] = true;
        // getAstroPayload['split'] = true;
        // getAstroPayload['service'] = selected_cardData["title"];
        // getAstroPayload['Date'] = astroDataWebhook["localDate"];
        //  = astroDataWebhook["timeOfBirth"];
        //  = astroDataWebhook["dateOfBirth"];
        //  getAstroPayload['Week'] = astroDataWebhook["dateOfBirth"];
        // getAstroPayload['Lat'] = astroDataWebhook["latitude"];
        // getAstroPayload['Lon'] = astroDataWebhook["longitude"];
        // getAstroPayload['Tz'] = astroDataWebhook["timeZone"];
        finalPayload.value = {
          "Dob": getAstroPayload['Dob'],
          "Tob": getAstroPayload['Tob'],
          "Tz": getAstroPayload['Tz'],
          "Lat": getAstroPayload['Lat'],
          "Lon": getAstroPayload['Lon'],
          "Gen": getAstroPayload['gender'],
          "Lang": getAstroPayload['Lang'],
          // "Gen": data.gender,
        };
        // switch (selected_cardData["id"]) {
        //   case 1:
        //   case 2:
        //     finalPayload.value = {
        //       "cardId": selected_cardData["id"],
        //       "Date": getAstroPayload['Date'],
        //       "Week": getAstroPayload['Week'],
        //       "zodiac": getAstroPayload['zodiac'],
        //       "show_same": getAstroPayload['show_same'],
        //       "split": getAstroPayload['split'],
        //       "type": getAstroPayload['type'],
        //       "Lang": getAstroPayload['Lang'],
        //       "service": getAstroPayload['service'],
        //     };
        //     break;
        //   case 3:
        //     finalPayload.value = {
        //       "cardId": selected_cardData["id"],
        //       "Date": getAstroPayload['Date'],
        //       "Lang": getAstroPayload['Lang'],
        //       "service": getAstroPayload['service'],
        //       "show_same": getAstroPayload['show_same'],
        //     };
        //     break;
        //   case 4:
        //   case 5:
        //     finalPayload.value = {
        //       "cardId": selected_cardData["id"],
        //       "Date": getAstroPayload['Date'],
        //       "zodiac": getAstroPayload['zodiac'],
        //       "show_same": getAstroPayload['show_same'],
        //       "split": getAstroPayload['split'],
        //       "type": getAstroPayload['type'],
        //       "Lang": getAstroPayload['Lang'],
        //       "service": getAstroPayload['service'],
        //     };
        //     break;
        //   case 6:
        //     finalPayload.value = {
        //       "cardId": selected_cardData["id"],
        //       "Year": DateTime.now().year,
        //       "Zodiac": getAstroPayload['zodiac'],
        //       "Lang": getAstroPayload['Lang'],
        //       "service": getAstroPayload['service'],
        //     };
        //     break;
        //   case 7:
        //     finalPayload.value = {
        //       "cardId": selected_cardData["id"],
        //       "Dob": getAstroPayload['Dob'],
        //       "Lang": getAstroPayload['Lang'],
        //       "service": getAstroPayload['service'],
        //     };
        //     break;
        //   case 8:
        //     finalPayload.value = {
        //       "cardId": getAstroPayload['cardId'],
        //       "dob": getAstroPayload['Dob'],
        //       "zodiacSign": getAstroPayload['zodiac'],
        //       "year": DateTime.now().year,
        //       "service": getAstroPayload['service'],
        //     };
        //     break;
        //   case 9:
        //     ////
        //     //    getAstroPayload['Lang'] = astroDataWebhook["language"];
        //     // getAstroPayload['cardId'] = selected_cardData["id"];
        //     // getAstroPayload['type'] = selected_cardData["Type"];
        //     // // getAstroPayload['zodiac'] = astroDataWebhook["zodiac"];
        //     // getAstroPayload['show_same'] = true;
        //     // getAstroPayload['split'] = true;
        //     // getAstroPayload['service'] = selected_cardData["title"];
        //     // getAstroPayload['Date'] = astroDataWebhook["localDate"];
        //     // getAstroPayload['Dob'] = astroDataWebhook["dateOfBirth"];
        //     /////
        //     finalPayload.value = {
        //       "cardId": selected_cardData["id"],
        //       "Date": getAstroPayload['Date'],
        //       "Nakshtra": getAstroPayload['zodiac'],
        //       "show_same": getAstroPayload['show_same'],
        //       "Lang": getAstroPayload['Lang'],
        //       "service": getAstroPayload['service'],
        //     };
        //     break;
        //   default:
        //     return;
        // }
        //      var requestData = {
        //   ...user,
        //   ...partner,
        //   "cardId": cardData[index]["id"],
        //   "title": cardData[index]["title"],
        //   "userGender": user["Gen"] == "male",
        // };
//    var   mapDD = {
//     finalPayload.value,
//   partnerDatas.value,
//  "cardId":  selected_cardData["id"],
//       "title":  getAstroPayload['service'],
//       "userGender":
//       getAstroPayload['gender'] == "male"
//       ? true
//       : false

//    }
        var mapDD = {
          ...finalPayload.value, // Spread operator to merge the map
          ...partnerDatas.value, // Merge another map
          "cardId": selected_cardData["id"],
          "title": getAstroPayload['service'],
          "userGender": getAstroPayload['gender'] == "male" ? true : false,
        };
        postAstroData(mapDD);

//  Title: selectedCardTitle,//  "localDate"
//       Type: selectedCardType,
//   if (entry.value == zodiacValue) {
//     String zodiacKey = entry.key; // Get the Zodiac name
        //  for (var i = 0; i < zodiacSigns.length; i++) {
        //   if (i.key == astroDataWebhook["zodiac"]) {

        //   }
        //         // calculatePickupDistance(orders[i]["pickup"]["coordinates"][1],
        //         //     orders[i]["pickup"]["coordinates"][0]);
        //         // orders[i]['pickUpdistance'] = distanceInKilometers.value;
        //         // print(orders[i]);

        //       }
        //  astroDataWebhook["language"];

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
      astroDataLoading(false);
    }
  }

  // start
// var zodiacSigns = {
//   "Aries": 1,
//   "Taurus": 2,
//   "Gemini": 3,
//   "Cancer": 4,
//   "Leo": 5,
//   "Virgo": 6,
//   "Libra": 7,
//   "Scorpio": 8,
//   "Sagittarius": 9,
//   "Capricorn": 10,
//   "Aquarius": 11,
//   "Pisces": 12,
// };

// int zodiacValue = astroDataWebhook["zodiac"]; // Get the zodiac number

// for (var entry in zodiacSigns.entries) {
//   if (entry.value == zodiacValue) {
//     String zodiacKey = entry.key; // Get the Zodiac name
//     print("Zodiac Sign: $zodiacKey");
//     break; // Exit loop once found
//   }
// }

  // end

  //
  //
  var selected_cardData = {}.obs;
  var cardData = [
    {
      "id": 1,
      "title": "North Match",
      "icon": "assets/images/north_match.png",
      "isLongTerm": false
    },
    {
      "id": 2,
      "title": "North Match with Astro Details",
      "icon": "assets/images/north_match_with.png",
      "isLongTerm": false
    },
    {
      "id": 1,
      "title": "South Match",
      "icon": "assets/images/south_match.png",
      "isLongTerm": false
    },
    {
      "id": 2,
      "title": "South Match with Astro Details",
      "icon": "assets/images/south_match_with.png",
      "isLongTerm": false
    },
    {
      "id": 3,
      "title": "Dashakoot",
      "icon": "assets/images/dashkoot.png",
      "isLongTerm": false
    },
    {
      "id": 4,
      "title": "Dashakoot with Astro Details",
      "icon": "assets/images/dashkoot_with.png",
      "isLongTerm": false
    },
    {
      "id": 5,
      "title": "Aggregate Match",
      "icon": "assets/images/aggregate_matching.png",
      "isLongTerm": false
    },
    {
      "id": 6,
      "title": "Rajju Vedha Details",
      "icon": "assets/images/raju_veda.png",
      "isLongTerm": false
    },
    {
      "id": 7,
      "title": "Papasamaya Match",
      "icon": "assets/images/papasamaya_match.png",
      "isLongTerm": false
    },
    {
      "id": 8,
      "title": "Nakshatra Match",
      "icon": "assets/images/nakashatra_match.png",
      "isLongTerm": false
    },
    {
      "id": 9,
      "title": "Western Match",
      "icon": "assets/images/western_match.png",
      "isLongTerm": false
    },
    // {
    //   "id": 1,
    //   "title": "Weekly-Sun",
    //   "icon": "assets/images/weekly_sun.png",
    //   "Type": "Big",
    //   "isLongTerm": false
    // },
    // {
    //   "id": 2,
    //   "title": "Weekly-Moon",
    //   "icon": "assets/images/weel;y_moon.png",
    //   "Type": "Big",
    //   "isLongTerm": false
    // },
    // {
    //   "id": 3,
    //   "title": "Day-Number",
    //   "icon": "assets/images/daily_number.png",
    //   "isLongTerm": false
    // },
    // {
    //   "id": 4,
    //   "title": "Daily-Moon",
    //   "icon": "assets/images/daily_moon.png",
    //   "Type": "small",
    //   "isLongTerm": false
    // },
    // {
    //   "id": 5,
    //   "title": "Daily-Sun",
    //   "icon": "assets/images/daily_sun.png",
    //   "Type": "small",
    //   "isLongTerm": false
    // },
    // {
    //   "id": 6,
    //   "title": "Yearly",
    //   "icon": "assets/images/weekly_sun.png",
    //   "isLongTerm": true
    // },
    // {
    //   "id": 7,
    //   "title": "Biorhythm",
    //   "icon": "assets/images/bio_rythm.png",
    //   "isLongTerm": true
    // },
    // {
    //   "id": 8,
    //   "title": "Numerology",
    //   "icon": "assets/images/daily_number.png",
    //   "isLongTerm": true
    // },
    // {
    //   "id": 9,
    //   "title": "Daily-Nakshatra",
    //   "icon": "assets/images/daily_nakshatra.png",
    //   "isLongTerm": false
    // },
  ];

  var zodiacSigns = {
    "Aries": 1,
    "Taurus": 2,
    "Gemini": 3,
    "Cancer": 4,
    "Leo": 5,
    "Virgo": 6,
    "Libra": 7,
    "Scorpio": 8,
    "Sagittarius": 9,
    "Capricorn": 10,
    "Aquarius": 11,
    "Pisces": 12,
  };

  var formattedDate = DateFormat("dd/MM/yyyy").format(DateTime.now()).obs;

  // int getWeekOfMonth(DateTime date) {
  //   DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
  //   int pastDaysOfMonth = date.difference(firstDayOfMonth).inDays;
  //   return ((pastDaysOfMonth + firstDayOfMonth.weekday) / 7).ceil();
  // }

  var weekOfTheMonth = 1.obs;
  var user = {}.obs;
  var responseData = {}.obs;
  var isLongTerm = false.obs;
  var showModal = false.obs;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    weekOfTheMonth.value = getWeekOfMonth(DateTime.now());
    user.value = {
      "Date": formattedDate.value,
      "Zodiac": null,
      "show_same": true,
      "split": true,
      "Lang": null,
      "Week": weekOfTheMonth.value,
      "Year": DateTime.now().year,
      "Dob": null,
    };
  }

  void handleCardClick(int index) {
    loading.value = true;
    showModal.value = true;
    var selectedCard = cardData[index];
    isLongTerm.value = true;
    // isLongTerm.value = selectedCard["isLongTerm"];

    // user.update((val) {
    //   val?["Date"] = formattedDate.value;
    //   val?["Week"] = weekOfTheMonth.value;
    //   val?["Title"] = selectedCard["title"];
    //   val?["Type"] = selectedCard["Type"] ?? "";
    // });

    Map<String, dynamic> requestData = {
      "cardId": selectedCard["id"],
      "Date": user["Date"],
      "Week": user["Week"],
      "zodiac": user["Zodiac"],
      "show_same": user["show_same"],
      "split": user["split"],
      "type": user["Type"],
      "Lang": user["Lang"],
      "service": user["Title"],
    };

    responseData.value = requestData;
    loading.value = false;
  }

  //
  var isLoading = false.obs;
  var predictions = [].obs;

  Future<void> fetchPredictions(String query) async {
    if (query.isEmpty) {
      predictions.clear();
      return;
    }

    try {
      isLoading(true);

      final response = await http.get(
        Uri.parse('https://your-api.com/predictions?q=$query'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer YOUR_ACCESS_TOKEN', // Optional: Add if needed
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        predictions.assignAll(data['predictions'] ?? []);
      } else {
        Get.snackbar("Error", "Failed to load predictions");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading(false);
    }
  }
}
