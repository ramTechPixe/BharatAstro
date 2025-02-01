import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bharatastro/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DummyController extends GetxController {
  final apiService = Get.put(ApiService());
  var order_map = {}.obs;
}
