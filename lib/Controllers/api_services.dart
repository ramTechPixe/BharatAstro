import 'dart:io';
import 'dart:convert';
import 'dart:io';

import 'package:bharatastro/untils/export_file.dart';
import 'package:dio/io.dart';

// import 'package:dio/dio.dart' hide Response, FormData, MultipartFile;
import 'package:dio/dio.dart';
import 'package:bharatastro/untils/user_simple_preferences.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class ApiService extends GetxService {
//  http://192.168.1.197:5000

//   'http://192.168.1.29:9094/api/auth/login?email=raja123%40gmail.com&password=raja123' \
  String baseUrl = "https://api.bharatastrosage.com/"; // main
  // String baseUrl = "http://192.168.1.19:9094/";

// http://192.168.1.28:9094/swagger-ui/index.html
  String dummybaseUrl = "https://thewisguystech.com/";
  // String dummybaseUrl = "https://twgpost.in/";
  String dummybaseUrl2 = "https://apis.thewisguystech.com/";

  //https://twgpost.in/twiter-api-save-data-api/
  //  String baseUrl = "https://dev.thewisguystech.com/";  //old
  String live_baseUrl = "https://thewisguystech.com/uploads/twg-api/";
//  String baseUrl = "http://192.168.1.197:5000/"; // main
  // main
  // https://uat-hub.perfios.com/api/kyc/v3/dl
  // https://uat-hub.perfios.com/api/kyc/v2/rc
// https://uat-hub.perfios.com/api/kyc/v3/pan-profile-detailed
  final errorDict = {
    "data": [
      {"error": "Please check your internet connection."}
    ],
    "status": "error"
  };
  ////////////TWG APIS SERVICES
  ///Live apis

  //PostRequestCoupons

// Postrequest Ship Address
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

  // Future<dynamic> postRequestShipAddressFormData({
  //   required String endpoint,
  //   required Map payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Dio dio = Dio();
  //   Uri url = Uri.parse(baseUrl + endpoint);

  //   try {
  //     // Set Headers
  //     var headers = {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer ${UserSimplePreferences.getToken()}",
  //       ...?customHeaders,
  //     };

  //     // Send Request
  //     var response = await dio.post(
  //       "${url}",
  //       data: jsonEncode(payload),
  //       options: Options(headers: headers),
  //     );

  //     // Handle Response
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     } else {
  //       return {"message": "Error: ${response.statusMessage}"};
  //     }
  //   } on DioException catch (e) {
  //     debugPrint("Dio Error: $e");
  //     if (e.response != null) {
  //       return e.response?.data;
  //     }
  //     return {"message": "Something went wrong!"};
  //   }
  // }
//NBB
  Future<dynamic> postreportRequest({
    required String endpoint,
    Map<String, String>? customHeaders,
    required Map<dynamic, dynamic> payload,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      var header = {
        "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
      };
      var response = await http.post(url, body: payload, headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 ||
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

//

  // Future postRequestShipAddressFormData({
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);

  //   try {
  //     var headers = {
  //       "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
  //     };

  //     var request = http.MultipartRequest('POST', url);

  //     request.headers.addAll(headers);
  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     }
  //   } on DioError catch (e) {
  //     debugPrint("$e");
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }
  //Sign Up
  Future postRequestSignUpFormData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      // var header = {
      //   "Authorization": '${UserSimplePreferences.getToken()}',
      //   //  "accept": 'application/json'
      // };
//       :ram
// :ram123@gmail.com
// :Ram@12345
// :Ram@12345
// "auth/save?userName=${}&email=${}&password=${}&confirmPassword=${}"
      var request = http.MultipartRequest('POST', url)
        ..fields['userName'] = payload['name']
        ..fields['email'] = payload['email']
        ..fields['password'] = payload['password']
        ..fields['confirmPassword'] = payload['cpassword'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // Login v2
  Future postRequestSignInV2FormData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      // var header = {
      //   "Authorization": '${UserSimplePreferences.getToken()}',
      //   //  "accept": 'application/json'
      // };
//       :ram
// :ram123@gmail.com
// :Ram@12345
// :Ram@12345
      var request = http.MultipartRequest('POST', url)
        ..fields['email'] = payload['user_email']
        // "auth/login?email=${payload['user_email']}&password=${payload['user_password']}",
        ..fields['password'] = payload['user_password'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // delship
  Future postRequestDelSHipFormData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    var headers = {
      'accept': '*/*',
      // 'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
    };

    var request = http.Request('DELETE', Uri.parse(baseUrl + endpoint)
        // Uri.parse(
        //   'https://api.bharatastrosage.com/api/auth/deleteShipmentOrder?shiprocketOrderId=$shiprocketOrderId',
        // ),
        );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return {"message": "Shipment deleted successfully"};
    } else {
      print(response.reasonPhrase);
    }

    // Uri url = Uri.parse(baseUrl + endpoint);

    // try {
    //   var header = {
    //     "Content-Type": "multipart/form-data",
    //     // "Authorization": 'Bearer ${UserSimplePreferences.getToken()}',
    //     "accept": '*/*',
    //   };

    //   var request = http.MultipartRequest('DELETE', url)

    //     ..headers.addAll(header);

    //   var streamedResponse = await request.send();
    //   var response = await http.Response.fromStream(streamedResponse);

    //   if (response.statusCode == 200 || response.statusCode == 201) {
    //     return response.body;
    //   }
    // } on DioError catch (e) {
    //   debugPrint("$e");
    //   if (e.response?.statusCode == 404) {
    //     return e.response?.data;
    //   } else if (e.response?.statusCode == 401) {
    //     return e.response?.data;
    //   } else if (e.response?.statusCode == 400) {
    //     return e.response?.data;
    //   } else {
    //     return {"message": "Something went wrong!"};
    //   }
    // }
  }

  Future postRequestSavepaymentFormData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    var headers = {
      'accept': '*/*',
      'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
    };

    var request = http.Request('POST', Uri.parse(baseUrl + endpoint)
        // Uri.parse(
        //   'https://api.bharatastrosage.com/api/auth/deleteShipmentOrder?shiprocketOrderId=$shiprocketOrderId',
        // ),
        );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      print(response.reasonPhrase);
    }

    // mobile or web

    ///

    // Uri url = Uri.parse(baseUrl + endpoint);

    // try {
    //   var header = {
    //     "Content-Type": "multipart/form-data",
    //     // "Authorization": 'Bearer ${UserSimplePreferences.getToken()}',
    //     "accept": '*/*',
    //   };

    //   var request = http.MultipartRequest('DELETE', url)

    //     ..headers.addAll(header);

    //   var streamedResponse = await request.send();
    //   var response = await http.Response.fromStream(streamedResponse);

    //   if (response.statusCode == 200 || response.statusCode == 201) {
    //     return response.body;
    //   }
    // } on DioError catch (e) {
    //   debugPrint("$e");
    //   if (e.response?.statusCode == 404) {
    //     return e.response?.data;
    //   } else if (e.response?.statusCode == 401) {
    //     return e.response?.data;
    //   } else if (e.response?.statusCode == 400) {
    //     return e.response?.data;
    //   } else {
    //     return {"message": "Something went wrong!"};
    //   }
    // }
  }

  //
  Future<dynamic> editAstroRequest({
    required String endpoint,
    required Map payload,
    File? image, // Optional image file
  }) async {
    var headers = {
      'accept': '*/*',
      'Authorization': 'Bearer ${UserSimplePreferences.getToken()}',
    };

    Uri url = Uri.parse(baseUrl + endpoint);
    var request = http.MultipartRequest('PUT', url);
    request.headers.addAll(headers);

    // Attach form data (excluding image)
    payload.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    // Attach image file if provided
    if (image != null && await image.exists()) {
      request.files.add(await http.MultipartFile.fromPath(
        'uploadImage', // Make sure this matches API's expected field name
        image.path,
        contentType:
            MediaType('image', 'png'), // Adjust based on your file type
      ));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    //   required String endpoint,
    //   required Map payload,
    //   File? image,
    //   Map<String, String>? customHeaders,
    // }) async {
    //   var headers = {
    //     'accept': '*/*',
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
    //   };

    //   Uri url = Uri.parse(baseUrl + endpoint);

    //   //  var request = http.Request('PUT', url);
    //   var request = http.MultipartRequest('PUT', url);

    //   request.headers.addAll(headers);
    //   if (image != null && image.existsSync()) {
    //     request.files.add(await http.MultipartFile.fromPath(
    //       'uploadImage',
    //       image.path,
    //       contentType: MediaType('image', 'png'),
    //     ));
    //   }

    //   http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body; // Return parsed JSON response
    } else if (response.statusCode == 401 &&
        jsonDecode(response.body) == "Token is expired") {
      Get.toNamed(kSignIns);
      //return jsonDecode(response.body); // Return parsed JSON response
    } else {
      print("Error: ${response.reasonPhrase}");
      return {"message": "Something went wrong!"};
    }
  }

// v2 chnageAstrorequest
  Future changeAstroRequestv2({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      // var header = {
      //   "Authorization": '${UserSimplePreferences.getToken()}',
      //   //  "accept": 'application/json'
      // };
      var headers = {
        'accept': '*/*',
        'Authorization': 'Bearer ${UserSimplePreferences.getToken()}',
      };

      var request = http.MultipartRequest('POST', url)
        ..fields['oldPassword'] = payload["oldPassword"]
        // "auth/login?email=${payload['user_email']}&password=${payload['user_password']}",
        ..fields['password'] = payload["password"]
        ..fields['confirmPassword'] = payload["confirmPassword"];
      request.headers.addAll(headers);
//  "api/auth/changePassword/${userDetails["userProfileId"]}?oldPassword=${}&password=${}&confirmPassword=${}");
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //
  Future savepaymobile({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      // var header = {
      //   "Authorization": '${UserSimplePreferences.getToken()}',
      //   //  "accept": 'application/json'
      // };
      var headers = {
        'accept': '*/*',
        'Authorization': 'Bearer ${UserSimplePreferences.getToken()}',
      };
//  "paymentAmount=${}&planTypeId=${}&planType=${}&validity=${payload["validity"]}",
      var request = http.MultipartRequest('POST', url)
        ..fields["paymentAmount"] = payload["paymentAmount"]
        //
        ..fields['planTypeId'] = payload["planTypeId"]
        ..fields['planType'] = payload["planType"]
        ..fields['validity'] = payload["validity"];
      request.headers.addAll(headers);
//  "api/auth/changePassword/${userDetails["userProfileId"]}?oldPassword=${}&password=${}&confirmPassword=${}");
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

//
  Future<dynamic> changeAstroRequest({
    required String endpoint,
    required Map payload,
  }) async {
    var headers = {
      'accept': '*/*',
      'Authorization': 'Bearer ${UserSimplePreferences.getToken()}',
    };

    //

    Uri url = Uri.parse(baseUrl + endpoint);
// --form '="SRN_ram1234"' \
// --form '="SRN_RAM12"' \
// --form '="SRN_RAM12"'
    var request = http.MultipartRequest('POST', url)
      ..fields['oldPassword'] = payload['user_email']
      // "auth/login?email=${payload['user_email']}&password=${payload['user_password']}",
      ..fields['password'] = payload['user_password']
      ..fields['confirmPassword'] = payload['user_password'];

    // Add headers
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = await response.stream.bytesToString();
      return responseData;
    } else if (response.statusCode == 401 &&
        response.stream.bytesToString() == "Token is expired") {
      Get.toNamed(kSignIns);
      //return jsonDecode(response.body); // Return parsed JSON response
    } else {
      print(response.reasonPhrase);
      return {"message": "Something went wrong!"};
    }
  }

//
  /////

  // new forgotpassword
  Future postRequestForgotpasswordFormData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      // var header = {
      //   "Authorization": '${UserSimplePreferences.getToken()}',
      //   //  "accept": 'application/json'
      // };
//       :ram
// :ram123@gmail.com
// :Ram@12345
// :Ram@12345
      var request = http.MultipartRequest('POST', url);
      // ..fields['userName'] = payload['user_email']
      // ..fields['email'] = payload['user_password']
      // ..fields['password'] = payload['user_email']
      // ..fields['confirmPassword'] = payload['user_password'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //// Post ScheduleList
  Future postRequestScheduleData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['user_id'] = payload['user_id'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // v2 razottools

  //
  //// Post ScheduleList
  Future postRequestScheduleDataAccounts({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(dummybaseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['user_id'] = payload['user_id'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }
/////////////////////////////////////////////////////

// curl --location 'https://apis.thewisguystech.com/create-comments' \
// --form 'user_id="80"' \
// --form 'service_type="auto_reply_negitive_comments_delete"' \
// --form 'account_link="https://www.instagram.com/bharatsports11/"' \
// --form 'email="saiteja@gmail.com"' \
// --form 'mobile="8686180840"' \
// --form 'demo_schedule="2024-10-23T10:30"' \
// --form 'name="sai"' \
// --form 'company_name="sai"'
////////////////////////////////
  /// menus

  // create Digital influencer
  Future postRequestCreateDigitalInfluence({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(dummybaseUrl2 + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['gender'] = payload['gender']
        ..fields['age'] = payload['age']
        ..fields['country'] = payload['country']
        ..fields['looks'] = payload['looks']
        ..fields['dress'] = payload['dress']
        ..fields['background'] = payload['background'];
      // ..fields['user_id'] = payload['user_id']
      // ..fields['service_type'] = payload['service_type']
      // ..fields['account_link'] = payload['account_link']
      // ..fields['email'] = payload['email']
      // ..fields['mobile'] = payload['mobile']
      // ..fields['demo_schedule'] = payload['demo_schedule']
      // ..fields['name'] = payload['name']
      // ..fields['company_name'] = payload['company_name'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // save digital

// logo

// create music
// logo

//// fb2Crm

////////////////

// pose

  // Future postRequestPose({
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(dummybaseUrl2 + endpoint);

  //   try {
  //     var request = http.MultipartRequest('POST', url)
  //       ..fields['user_id'] = payload['user_id']
  //       ..fields['influencer_id'] = payload['influencer_id']
  //       ..fields['pose_image'] = payload['pose_image'];
  //     // ..fields['user_id'] = payload['user_id']
  //     // ..fields['musictype'] = payload['musictype']
  //     // ..fields['instrument'] = payload['instrument'];
  //     // ..fields['gender'] = payload['gender']
  //     // ..fields['age'] = payload['age']
  //     // ..fields['country'] = payload['country']
  //     // ..fields['looks'] = payload['looks']
  //     // ..fields['dress'] = payload['dress']
  //     // ..fields['background'] = payload['background'];

  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     }
  //   } on DioError catch (e) {
  //     debugPrint("$e");
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }

  // hash tags

///////
  ///
  // save logo

  Future postRequestrazorPayid({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
//  'post_id': '146',
//       'meta_key': '_sap_fb_post_type',
    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['sap_plan'] = payload['sap_plan'];
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

//// auto message v2

  //

  //////////////////////////////////////////////////////save payment
  Future postRequestsavePayment({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    ////////////////////////////////////////////////////////////////

    ////////////////
    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['additionalData[form-submitted]'] =
            payload['additionalData[form-submitted]'] ?? ''
        ..fields['additionalData[sap_firstname]'] =
            payload['additionalData[sap_firstname]'] ?? ''
        ..fields['additionalData[sap_lastname]'] =
            payload['additionalData[sap_lastname]'] ?? ''
        ..fields['additionalData[sap_email]'] =
            payload['additionalData[sap_email]'] ?? ''
        ..fields['additionalData[sap_password]'] =
            payload['additionalData[sap_password]'] ?? ''
        ..fields['additionalData[sap_repassword]'] =
            payload['additionalData[sap_repassword]'] ?? ''
        ..fields['additionalData[sap_role]'] =
            payload['additionalData[sap_role]'] ?? ''
        ..fields['additionalData[sap_plan]'] =
            payload['additionalData[sap_plan]'] ?? ''
        ..fields['additionalData[gateway_type]'] =
            payload['additionalData[gateway_type]'] ?? ''
        ..fields['razorpay_payment_id'] = payload['razorpay_payment_id'] ?? ''
        ..fields['subscription_id'] = payload['subscription_id'] ?? ''
        ..fields['plan_price'] = payload['plan_price'] ?? ''
        ..fields['apply_coupon'] = payload['apply_coupon'] ?? '';

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ///

  //  pinterest

  //
  // ..fields['sap_pinterest_options[proxy_url]'] =
  //       payload['sap_pinterest_options[proxy_url]']
  //   ..fields['sap_pinterest_options[proxy_username]'] =
  //       payload['sap_pinterest_options[proxy_username]']
  //   ..fields['sap_pinterest_options[proxy_password]'] =
  //       payload['sap_pinterest_options[proxy_password]']
  //   ..fields['sap_pinterest_options[pin_auth_options]'] =
  //       payload['sap_pinterest_options[pin_auth_options]']
  //   ..fields['sap_pinterest_options[pinterest_keys][0][app_id]'] =
  //       payload['sap_pinterest_options[pinterest_keys][0][app_id]']
  //   ..fields['sap_pinterest_options[pinterest_keys][0][app_secret]'] =
  //       payload['sap_pinterest_options[pinterest_keys][0][app_secret]']
  //   ..fields['sap_pinterest_options[pin_image]'] =
  //       payload['sap_pinterest_options[pin_image]']
  //   ..fields['sap_pinterest_options[pin_type_shortner_opt]'] =
  //       payload['sap_pinterest_options[pin_type_shortner_opt]']
  //   ..fields['sap_pinterest_options[pin_bitly_access_token]'] =
  //       payload['sap_pinterest_options[pin_bitly_access_token]']
  //   ..fields['sap_pinterest_options[pin_shortest_api_token]'] =
  //       payload['sap_pinterest_options[pin_shortest_api_token]']
  //   ..fields['limit_pinterest_count'] = payload['limit_pinterest_count']
  //   ..fields['created_pinterest_count'] = payload['created_pinterest_count']
  //   ..fields['sap-pinterest-cookie'] = payload['sap-pinterest-cookie']
  //   ..fields['sap_pinterest_submit'] = payload['sap_pinterest_submit']
  //   ..fields['user_id'] = payload['user_id'];

  //

  // youtube save

/////
  // post view
  Future postRequestPostViewData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['log_id'] = payload['log_id'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // multipost By ID
  // multipost pagenation
  Future postRequestMultipostv2ID({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['post_id'] = payload['post_id'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //
  // multipost pagenation
  Future postRequestMultipostv2({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['user_id'] = payload['user_id'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // multipost pagenation
  Future postRequestMultipostPagenation({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['user_id'] = payload['user_id']
        ..fields['page'] = payload['page']
        ..fields['limit'] = payload['limit'];
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // post view
  Future postRequestScheduleViewData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['post_id'] = payload['post_id'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ///
  ///
  Future postRequestDeleteLogData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['log_id'] = payload['log_id'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  /// multilogs delete // first
  // Future postRequestMultiIDDeleteLogData({
  //   required String endpoint,
  //   required List<dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);

  //   try {
  //     var request = http.MultipartRequest('POST', url);

  //     for (var i = 0; i < payload.length; i++) {
  //       request.fields['id[]'] = payload[i].toString();
  //     }

  //     if (customHeaders != null) {
  //       request.headers.addAll(customHeaders);
  //     }

  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     } else {
  //       return {
  //         "message": "Request failed with status: ${response.statusCode}"
  //       };
  //     }
  //   } catch (e) {
  //     debugPrint("$e");
  //     return {"message": "Something went wrong!"};
  //   }
  // }
  Future postRequestMultiIDDeleteLogData({
    required String endpoint,
    required List payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url);

      for (var id in payload) {
        request.fields.addAll({'id[]': id.toString()});
      }

      if (customHeaders != null) {
        request.headers.addAll(customHeaders);
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return {
          "message": "Request failed with status: ${response.statusCode}"
        };
      }
    } catch (e) {
      debugPrint("$e");
      return {"message": "Something went wrong!"};
    }
  }

// multi delete Posts // first
  // Future postRequestMultiIDDeleteMultiPosts({
  //   required String endpoint,
  //   required List<dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);

  //   try {
  //     var request = http.MultipartRequest('POST', url);

  //     for (var i = 0; i < payload.length; i++) {
  //       request.fields['post_id[]'] = payload[i].toString();
  //     }

  //     if (customHeaders != null) {
  //       request.headers.addAll(customHeaders);
  //     }

  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     } else {
  //       return {
  //         "message": "Request failed with status: ${response.statusCode}"
  //       };
  //     }
  //   } catch (e) {
  //     debugPrint("$e");
  //     return {"message": "Something went wrong!"};
  //   }
  // }
  // second
  // Future postRequestMultiIDDeleteMultiPosts({
  //   required String endpoint,
  //   required List payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);

  //   try {
  //     var request = http.MultipartRequest('POST', url);

  //     for (String id in payload) {
  //       request.fields.addAll({'post_id[]': id});
  //       // request.fields['post_id[]'] = id;
  //     }
  //     print(request.fields);
  //     if (customHeaders != null) {
  //       request.headers.addAll(customHeaders);
  //     }

  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     } else {
  //       return {
  //         "message": "Request failed with status: ${response.statusCode}"
  //       };
  //     }
  //   } catch (e) {
  //     debugPrint("$e");
  //     return {"message": "Something went wrong!"};
  //   }
  // }
  // third
  Future postRequestMultiIDDeleteMultiPosts({
    required String endpoint,
    required List<String> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url);

      // Add each item to 'post_id[]' dynamically
      for (String id in payload) {
        request.fields.addAll({'post_id[]': id});
      }

      print("Fields to be sent: ${request.fields}"); // Debug: Verify the fields

      // Add custom headers if provided
      if (customHeaders != null) {
        request.headers.addAll(customHeaders);
      }

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return {
          "message": "Request failed with status: ${response.statusCode}"
        };
      }
    } catch (e) {
      debugPrint("Error: $e");
      return {"message": "Something went wrong!"};
    }
  }
  // fourth dio

// edit profile
  Future postRequestEditProfileFormData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['sap_user_id'] = payload['sap_user_id']
        ..fields['sap_user_fname'] = payload['sap_user_fname']
        ..fields['sap_user_lname'] = payload['sap_user_lname']
        ..fields['sap_user_email'] = payload['sap_user_email'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //Password
  Future postRequestEditProfilePasswordFormData({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('POST', url)
        ..fields['sap_user_id'] = payload['sap_user_id']
        ..fields['sap_user_fname'] = payload['sap_user_fname']
        ..fields['sap_user_lname'] = payload['sap_user_lname']
        ..fields['sap_user_email'] = payload['sap_user_email']
        ..fields['sap_user_password'] = payload['sap_user_password'];

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //
  Future<dynamic> getRequest({
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      var header = {
        "Authorization": '${UserSimplePreferences.getToken()}',
        //  "accept": 'application/json'
      };
      var response = await http.get(url, headers: header);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // for villages
  Future<dynamic> vilagegetRequest({
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(endpoint);
    try {
      var header = {
        "X-RapidAPI-Host":
            "india-pincode-with-latitude-and-longitude.p.rapidapi.com",
        "X-RapidAPI-Key": "92dd61a3abmsh30aff286f1de18bp19ce46jsnd13651517f4e",
        //  "X-RapidAPI-Key": "YOUR_API_KEY",
      };
      // {
      //   "Authorization": '${UserSimplePreferences.getToken()}',
      //   //  "accept": 'application/json'
      // };
      var response = await http.get(url, headers: header);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // weather api
  //
  //         "X-RapidAPI-Key": "92dd61a3abmsh30aff286f1de18bp19ce46jsnd13651517f4e",

  Future<dynamic> weatherRequest({
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(endpoint);
    try {
      var header = {
        "X-RapidAPI-Host": "weatherapi-com.p.rapidapi.com",
        "X-RapidAPI-Key": "92dd61a3abmsh30aff286f1de18bp19ce46jsnd13651517f4e",
        //  "X-RapidAPI-Key": "YOUR_API_KEY",
      };
      // {
      //   "Authorization": '${UserSimplePreferences.getToken()}',
      //   //  "accept": 'application/json'
      // };
      var response = await http.get(url, headers: header);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //

  //////////////////////////////////////////////////////////
  Future putRequest({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response = await dio.put("$url", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  String imagebaseUrl = "http://43.205.34.80:8001/";
  Future putProfileRequest({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      var header = {
        "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
      };
      var response = await http.put(url, headers: header, body: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  /////////////
  Future patchRequestEditProfile({
    required File profilePic,
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    //   //   'first_name': payload['firstName'],
    //   //   'last_name': payload['lastName'],
    try {
      var request = http.MultipartRequest('PATCH', url)
        ..headers['Authorization'] =
            'Bearer ${UserSimplePreferences.getToken()}';

      request.files.add(await http.MultipartFile.fromPath(
        'profilePic',
        profilePic.path,
        contentType: MediaType('image', 'png'),
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
      // else {
      //   print('Failed to update profile: ${response.reasonPhrase}');
      //   print('Response body: ${response.body}');
      // }
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return response.body;
      // }
      // var header = {
      //   "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
      // };
      // var response = await http.patch(url, headers: header, body: payload);
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return response.body;
      // }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

// Upload Resume
  Future patchRequestUploadResume({
    required File profilePic,
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    //   //   'first_name': payload['firstName'],
    //   //   'last_name': payload['lastName'],
    try {
      var request = http.MultipartRequest('PATCH', url)
        ..headers['Authorization'] =
            'Bearer ${UserSimplePreferences.getToken()}';

      request.files.add(await http.MultipartFile.fromPath(
        'resume',
        profilePic.path,
        contentType: MediaType('image', 'png'),
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
      // else {
      //   print('Failed to update profile: ${response.reasonPhrase}');
      //   print('Response body: ${response.body}');
      // }
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return response.body;
      // }
      // var header = {
      //   "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
      // };
      // var response = await http.patch(url, headers: header, body: payload);
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return response.body;
      // }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

// Upload Resume
  Future patchRequestUploadLetters({
    required File profilePic,
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    //   //   'first_name': payload['firstName'],
    //   //   'last_name': payload['lastName'],
    try {
      var request = http.MultipartRequest('PATCH', url)
        ..headers['Authorization'] =
            'Bearer ${UserSimplePreferences.getToken()}';

      request.files.add(await http.MultipartFile.fromPath(
        'experienceLetter',
        profilePic.path,
        contentType: MediaType('image', 'png'),
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
      // else {
      //   print('Failed to update profile: ${response.reasonPhrase}');
      //   print('Response body: ${response.body}');
      // }
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return response.body;
      // }
      // var header = {
      //   "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
      // };
      // var response = await http.patch(url, headers: header, body: payload);
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return response.body;
      // }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

// (File license, File pan, File adhar,
//       File authenticationImage, File rc)
  /////////////////////////////Upload DOcs Captain

  //////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////

  ///////////////////User Upload DOcs

  //////////////////////////////////////CaptainDutyAPi///////////////////////////

  ////////////////////////////////////////////////////////////////////////////////

  //////////

///////////////////////
//{
  // "dropLangitude": "17.413973667114202",
//  "dropLongitude": "78.37360815684931",
  // "pickupLangitude": "17.419151642685726",
  // "pickupLongitude": "78.3889548353466",
//  "pickupAddress": "Raidurg",
  // "dropAddress": "Sutherland",
  // "price": "250",
  // "orderPlaceTime": "08:09 AM",
  // "orderPlaceDate": "04-07-2024",
  // "vehicleType": "bike"
//}
///////////////////
  // UserBookRide with Image
  ////////////////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////////////////////////
  // Future postRequestUserBookFormData({
  //   required File image,
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);
  //   //   //   'first_name': payload['firstName'],
  //   //   //   'last_name': payload['lastName'],
  //   try {
  //     var request = http.MultipartRequest('POST', url)

  //       ..fields['dropLangitude'] = payload['dropLangitude']
  //       ..fields['dropLongitude'] = payload['dropLongitude']
  //       ..fields['pickupLangitude'] = payload['pickupLangitude']
  //       ..fields['pickupLongitude'] = payload['pickupLongitude']
  //       ..fields['pickupAddress'] = payload['pickupAddress']
  //       ..fields['dropAddress'] = payload['dropAddress']
  //       ..fields['price'] = payload['price']
  //       ..fields['orderPlaceTime'] = payload['orderPlaceTime']
  //       ..fields['orderPlaceDate'] = payload['orderPlaceDate']
  //       ..fields['vehicleType'] = payload['vehicleType'];

  //     request.files.add(await http.MultipartFile.fromPath(
  //       'userAuthenticationImage',
  //       image.path,
  //       contentType: MediaType('image', 'png'), // or other image type
  //     ));

  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     }
  //     // else {
  //     //   print('Failed to update profile: ${response.reasonPhrase}');
  //     //   print('Response body: ${response.body}');
  //     // }
  //     // if (response.statusCode == 200 || response.statusCode == 201) {
  //     //   return response.body;
  //     // }
  //     // var header = {
  //     //   "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
  //     // };
  //     // var response = await http.patch(url, headers: header, body: payload);
  //     // if (response.statusCode == 200 || response.statusCode == 201) {
  //     //   return response.body;
  //     // }
  //   } on DioError catch (e) {
  //     debugPrint("$e");
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }

  //

  //////////
  //  var request = http.MultipartRequest('PATCH', url)
  //     ..headers['Authorization'] = 'Bearer $authToken'
  //     ..fields['first_name'] = firstName
  //     ..fields['last_name'] = lastName;

  //   // Add the profile picture file
  //   if (profilePic != null) {
  //     request.files.add(await http.MultipartFile.fromPath(
  //       'profile_pic',
  //       profilePic.path,
  //       contentType: MediaType('image', 'jpeg'), // or other image type
  //     ));
  //   }

  //   // Send the request
  //   var response = await request.send();
  ////////

  Future postRequest({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      Dio dio = Dio();
      // "Content-Type": "application/json",
      //     Authorization: `Bearer ${token}`,
      dio.options.headers["content-type"] = 'application/json';
      //  'accept': '*/*',
      dio.options.headers["accept"] = '*/*';
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response = await dio.post("$url", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //
  Future<dynamic> postRequestAstroForm({
    required String endpoint,
    required Map payload,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      var request = http.MultipartRequest('POST', url);

      //   "Content-Type":
      //   Authorization: `Bearer ${token}`,
      // },
      request.headers["content-type"] = "application/json";
      request.headers["accept"] = '*/*';
      request.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      // Dynamically add fields
      //  request.fields['category'] = payload['category'] ?? "";
      request.fields[payload['key']] = payload['value'] ?? "";

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return {"message": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      debugPrint("Error: $e");
      return {"message": "Something went wrong!"};
    }
  }

  //
  // Future postRequestAstroForm({
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);
  //   try {
  //     Dio dioInstance = Dio();

  //     dioInstance.options.headers["content-type"] = 'multipart/form-data';
  //     dioInstance.options.headers["accept"] = '*/*';
  //     dioInstance.options.headers["Authorization"] =
  //         'Bearer ${UserSimplePreferences.getToken()}';

  //     // Create FormData object using dio.FormData
  //     dio.FormData formData = dio.FormData.fromMap({
  //       '${payload['key']}': payload['name'].toString(),
  //       // 'email': payload['email'].toString(),
  //       ...payload
  //           .map((key, value) => MapEntry(key.toString(), value.toString())),
  //     });

  //     var response = await dioInstance.post("$url", data: formData);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     }
  //   } on dio.DioException catch (e) {
  //     debugPrint("$e");
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }

//   Future postRequestAstroForm({
//   required String endpoint,
//   required Map<dynamic, dynamic> payload,
//   Map<String, String>? customHeaders,
// }) async {
//   Uri url = Uri.parse(baseUrl + endpoint);
//   try {
//     Dio dio = Dio();

//     dio.options.headers["content-type"] = 'multipart/form-data';
//     dio.options.headers["accept"] = '*/*';
//     dio.options.headers["Authorization"] =
//         'Bearer ${UserSimplePreferences.getToken()}';

//     // Create FormData object
//     FormData formData = FormData()
//       ..fields.add(MapEntry('name', payload['name'].toString()))
//       ..fields.add(MapEntry('email', payload['email'].toString()));

//     // Add remaining dynamic fields (excluding name & email)
//     payload.forEach((key, value) {
//       if (key != 'name' && key != 'email') {
//         formData.fields.add(MapEntry(key.toString(), value.toString()));
//       }
//     });

//     var response = await dio.post("$url", data: formData);

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return response.data;
//     }
//   } on DioError catch (e) {
//     debugPrint("$e");
//     if (e.response?.statusCode == 404) {
//       return e.response?.data;
//     } else if (e.response?.statusCode == 401) {
//       return e.response?.data;
//     } else if (e.response?.statusCode == 400) {
//       return e.response?.data;
//     } else {
//       return {"message": "Something went wrong!"};
//     }
//   }
// }

  // Postno Token

//   import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

  // Future<Map<String, dynamic>> postRequestNotoken({
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(
  //       "http://womenrapido.nuhvin.com/auth/send-otp/"); // Replace with your baseUrl + endpoint if needed

  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //   };

  //   if (customHeaders != null) {
  //     headers.addAll(customHeaders);
  //   }

  //   try {
  //     var response = await http.post(
  //       url,
  //       headers: headers,
  //       body: json.encode(payload),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return json.decode(response.body);
  //     } else {
  //       return handleError(response);
  //     }
  //   } catch (e) {
  //     debugPrint("$e");
  //     return {"message": "Something went wrong!"};
  //   }
  // }

  // Map<String, dynamic> handleError(http.Response response) {
  //   if (response.statusCode == 404 ||
  //       response.statusCode == 401 ||
  //       response.statusCode == 400) {
  //     return json.decode(response.body);
  //   } else {
  //     return {"message": "Something went wrong!"};
  //   }
  // }

  /////////////////////Verify Docs

  //PostToken
  // Future postRequestTokenVerifyDocs({
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(VerificationUrl + endpoint);
  //   try {
  //     Dio dio = Dio();
  //     dio.options.headers["content-type"] = 'application/json';
  //     dio.options.headers["accept"] = 'application/json';
  //     dio.options.headers["x-auth-key"] = "q4Ewu5OELeimuoiS";

  //     var response = await dio.post("$url",
  //         //  "https://blood-server-us7o.onrender.com/auth/registor/donor",
  //         data: payload);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     debugPrint("$e");
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }

  // Post patch

  // Future patchRequestEditProfile({
  //   required File profilePic,
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);
  //   try {

  //   //   Dio dio = Dio();

  //   //   dio.options.headers["content-type"] = 'application/json';
  //   //   dio.options.headers["accept"] = 'application/json';
  //   //   String fileName = profilePic.path.split('/').last;

  //   // FormData formData = FormData.fromMap({
  //   //   "profile_image": await MultipartFile.fromFile(
  //   //     file.path,
  //   //     filename: fileName,
  //   //   ),
  //   // });
  //   // //   FormData formData = FormData.fromMap({
  //   //   'first_name': payload['firstName'],
  //   //   'last_name': payload['lastName'],
  //   //   'image': await MultipartFile.fromBytes(
  //   //     'image', // Field name
  //   //     profilePic.readAsBytes(),
  //   //     filename: fileName, // Specify the filename
  //   //     contentType: MediaType('image', 'jpg'), // Set the content type
  //   //   ),
  //   // });
  //     // FormData formData = FormData();
  //     // formData.fields
  //     //   ..add(MapEntry('first_name', payload["firstName"]))
  //     //   ..add(MapEntry('last_name', payload["lastName"]));
  //     // formData.files.add(MapEntry(
  //     //   'image',
  //     //   await MultipartFile.fromFile(profilePic.path, filename: fileName),
  //     // )
  //     // );

  //    // var response = await dio.patch("$url", data: payload);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     debugPrint("$e");
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }
  // ///////////////////

  //     FormData formData = FormData();
  //     formData.fields
  //       ..add(MapEntry('first_name', firstName))
  //       ..add(MapEntry('last_name', lastName));
  //     formData.files.add(MapEntry(
  //       'profile_pic',
  //       await MultipartFile.fromFile(profilePic.path, filename: fileName),
  //     ));

  //     Response response = await _dio.patch('/users/$userId', data: formData);

  //

  Future patchRequest({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      Dio dio = Dio();
      dio.options.headers["content-type"] = 'application/json';
      dio.options.headers["accept"] = 'application/json';
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response = await dio.patch("$url", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  Future deleteRequest({
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      Dio dio = Dio();
      dio.options.headers["content-type"] = 'application/json';
      dio.options.headers["accept"] = 'application/json';
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response = await dio.delete("$url");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response.data;
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

//////////////////////////
  // Future<dynamic> postAuthRequestSavelogo2Raw({
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(dummybaseUrl2 + endpoint);
  //   Map<String, String> headers = {'Content-Type': 'application/json'};
  //   try {
  //     var response = await http.post(url, body: payload, headers: headers);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     } else if (response.statusCode == 404) {
  //       return response.body;
  //     } else if (response.statusCode == 401) {
  //       return response.body;
  //     } else if (response.statusCode == 400) {
  //       return response.body;
  //     } else if (response.statusCode == 500) {
  //       return response.body;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   } on DioError catch (e) {
  //     debugPrint("$e");
  //     return {"message": "$e"};
  //   }
  // }
  //

  //

// Get Token
/////////////////////////////////////////////////////////////////////////////////

  // GetNoToken
  Future<dynamic> getRequestNoToken({
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      var header = {
        "Authorization": 'Bearer ${UserSimplePreferences.getToken()}',
        "accept": '*/*',
      };

      var response = await http.get(url, headers: header);

      // var response = await http.get(url);
      // var response = await http.get(url, headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // DeletID
  // Future<dynamic> deleterequestForID({
  //   required String endpoint,
  //   Map<String, String>? customHeaders,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);
  //   try {
  //     var header = {
  //       //"Authorization": 'Bearer ${UserSimplePreferences.getToken()}',
  //       "accept": '*/*',
  //     };

  //     var response = await http.delete(url, headers: header);

  //     // var response = await http.get(url);
  //     // var response = await http.get(url, headers: header);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     }
  //   } on DioError catch (e) {
  //     debugPrint("$e");
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }
  //
  Future<dynamic> deleteRequestForID({
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      var header = {
        "Authorization": 'Bearer ${UserSimplePreferences.getToken()}',
        "accept": '*/*',
      };

      var response = await http.delete(url, headers: header);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Since your backend returns a String, return response.body directly
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      } else if (response.statusCode == 404) {
        return "Razorpay Order ID not found. Deletion failed.";
      } else {
        return "Something went wrong!";
      }
    } catch (e) {
      debugPrint("Error: $e");
      return "Something went wrong!";
    }
  }

  // verify payment
  Future postReportRequestVerifypayment({
    required String endpoint,
    required Map payload,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      Dio dio = Dio();
      dio.options.headers["content-type"] = 'application/json';
      // dio.options.headers["accept"] = 'application/json';
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response = await dio.post(
        "$url",
        data: jsonEncode(payload), // Add the payload here
      );
      // var response = await dio.post("$url",);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.data) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }
  //   Future<dynamic> postReportRequestVerifypayment({
  //   required String endpoint,
  //   Map<String, String>? customHeaders,
  //   required Map payloadd,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);

  //   try {
  //     var headers = {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer ${UserSimplePreferences.getToken()}',
  //       ...?customHeaders,
  //     };

  //     var request = http.Request('POST', url);
  //     request.headers.addAll(headers);
  //     request.body =  payloadd;

  //     http.StreamedResponse response = await request.send();
  //     final responseBody = await response.stream.bytesToString();

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return jsonDecode(responseBody);
  //     } else {
  //       return {"message": "Error: ${response.reasonPhrase}"};
  //     }
  //   } on http.ClientException catch (e) {
  //     debugPrint("HTTP Error: $e");
  //     return {"message": "Something went wrong!"};
  //   }
  // }
//
  Future<dynamic> postReportRequestzz({
    required String endpoint,
    Map<String, String>? customHeaders,
    required Map payload,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${UserSimplePreferences.getToken()}',
        ...?customHeaders,
      };

      var request = http.Request('POST', url);
      request.headers.addAll(headers);
      request.body = jsonEncode(payload);

      http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(responseBody);
      } else if (response.statusCode == 401 &&
          jsonDecode(responseBody) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      } else {
        return {"message": "Error: ${response.reasonPhrase}"};
      }
    } on http.ClientException catch (e) {
      debugPrint("HTTP Error: $e");
      return {"message": "Something went wrong!"};
    }
  }

  Future<dynamic> postreportRequestz({
    required String endpoint,
    Map<String, String>? customHeaders,
    required Map<dynamic, dynamic> payload,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      var header = {
        'Content-Type': 'application/json',
        "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
      };
      var response = await http.post(url, body: payload, headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //
  Future postIssuesRequest({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
    File? image,
  }) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    try {
      var request = http.MultipartRequest('PUT', url)
        ..headers.addAll({
          'Content-Type': 'application/json',
          "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
        })
        ..fields['firstName'] = payload['firstName'] ?? ""
        ..fields['lastName'] = payload['lastName'] ?? ""
        ..fields['mobileNumber'] = payload['mobileNumber'] ?? ""
        ..fields['dateOfBirth'] = payload['dateOfBirth'] ?? ""
        ..fields['timeOfBirth'] = payload['timeOfBirth'] ?? ""
        ..fields['pincode'] = payload['pincode'] ?? ""
        ..fields['location'] = payload['location'] ?? ""
        ..fields['style'] = payload['style'] ?? ""
        ..fields['language'] = payload['language'] ?? ""
        ..fields['gender'] = payload['gender'] ?? "";

      if (image != null && image.existsSync()) {
        request.files.add(await http.MultipartFile.fromPath(
          'uploadImage',
          image.path,
          contentType: MediaType('image', 'png'),
        ));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401 &&
          jsonDecode(response.body) == "Token is expired") {
        Get.toNamed(kSignIns);
        //return jsonDecode(response.body); // Return parsed JSON response
      }
    } on DioError catch (e) {
      debugPrint("$e");
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // Future postIssuesRequest({
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  //   Map<String, String>? customHeaders,
  //   File? image,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);

  //   try {
  //     var request = http.MultipartRequest('PUT', url)
  //       ..fields['firstName'] = payload['firstName'] ?? ""
  //       ..fields['lastName'] = payload['lastName'] ?? ""
  //       ..fields['mobileNumber'] = payload['mobileNumber'] ?? ""
  //       ..fields['dateOfBirth'] = payload['dateOfBirth'] ?? ""
  //       ..fields['timeOfBirth'] = payload['timeOfBirth'] ?? ""
  //       ..fields['pincode'] = payload['pincode'] ?? ""
  //       ..fields['location'] = payload['location'] ?? ""
  //       ..fields['style'] = payload['style'] ?? ""
  //       ..fields['language'] = payload['language'] ?? ""
  //       ..fields['gender'] = payload['gender'] ?? "";
  //     // ..fields['state'] = payload['state'] ?? ""
  //     // ..fields['issue_type'] = payload['issue_type'] ?? "";

  //     if (image != null && image.existsSync()) {
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'uploadImage',
  //         image.path,
  //         contentType: MediaType('image', 'png'),
  //       ));
  //     }

  //     // Add video if not null
  //     // if (video != null && video.existsSync()) {
  //     //   request.files.add(await http.MultipartFile.fromPath(
  //     //     'attachment', // Field name expected by the API
  //     //     video.path,
  //     //     contentType:
  //     //         MediaType('video', 'mp4'), // Specify the content type for video
  //     //   ));
  //     // }

  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     }
  //   } on DioError catch (e) {
  //     debugPrint("$e");
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }
  //

  static updateProfilePhoto(File file) {}

  Future<dynamic> postReportRequest(
      {required String endpoint,
      required Map<dynamic, dynamic> payload,
      Map<String, String>? customHeaders,
      File? problem,
      File? salefe}) async {
    Uri url = Uri.parse(baseUrl + endpoint);
    try {
      var headers = {
        "Authorization": 'Bearer ${UserSimplePreferences.getToken()}'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + endpoint));
      request.fields.addAll({
        'full_name': payload["full_name"],
        'email': payload["email"],
        'mobile_no': payload["mobile_no"],
        'pincode': payload["pincode"],
        'city': payload["city"],
        'state': payload["state"],
        'address': payload["address"],
        'report': payload["report"],
      });
      if (problem != null) {
        request.files.add(
            await http.MultipartFile.fromPath('report_image', problem.path));
      }
      if (salefe != null) {
        request.files.add(
            await http.MultipartFile.fromPath('reporter_selfie', salefe.path));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return {"status": "Updated"};
      } else {
        return ({"message": response.reasonPhrase});
      }
    } on DioError catch (e) {
      return {"message": "$e"};
    }
  }

  //
  // Future<dynamic> postToolRazorpay({
  //   required String endpoint,
  //   required Map<dynamic, dynamic> payload,
  // }) async {
  //   Uri url = Uri.parse(baseUrl + endpoint);
  //   try {
  //     var request =
  //         http.MultipartRequest('POST', Uri.parse(baseUrl + endpoint));
  //     request.fields.addAll(
  //         {'tool_id': payload["tool_id"], 'user_id': payload["user_id"]});

  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response;
  //       // return {"status": "Updated"};
  //     } else {
  //       return ({"message": response.reasonPhrase});
  //     }
  //   } on DioError catch (e) {
  //     return {"message": "$e"};
  //   }
  // }
}
