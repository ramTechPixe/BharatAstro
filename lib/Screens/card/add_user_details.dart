import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';
import 'package:intl/intl.dart';

class AddUserDetails extends StatefulWidget {
  const AddUserDetails({super.key});

  @override
  State<AddUserDetails> createState() => _AddUserDetailsState();
}

class _AddUserDetailsState extends State<AddUserDetails> {
  DashboardController dashController = Get.put(DashboardController());
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  ValueNotifier<String> selectedDateText = ValueNotifier<String>("Select Date");
  ValueNotifier<String> selectedTimeText = ValueNotifier<String>("Select Time");

  String? selectedValue;
  String? selectedGenderValue;
  String? selectedValue_language;
  String? selectedGenderValue_language;
  var selectDate = "Select Date".obs;
  final List<String> LanguageList = [
    "english",
    "assamese",
    "bengali",
    "bodo",
    "dogri",
    "gujarati",
    "hindi",
    "kannada",
    "kashmiri",
    "konkani",
    "maithili",
    "malayalam",
    "manipuri",
    "marathi",
    "nepali",
    "odia",
    "punjabi",
    "sanskrit",
    "santali",
    "sindhi",
    "tamil",
    "telugu",
    "urdu",
    "tulu",
    "kodava",
    "lepcha",
    "bhili",
    "garo",
    "khasi",
    "mizo",
    "ho",
    "ladakhi",
    "kurukh",
    "mundari",
    "gondi",
    "angika",
    "bishnupriya manipuri",
    "sourashtra"
  ];

  //['telugu', 'hindi', 'english'];
  //////////image
  bool showimagenullMessage = false;
  String? selectedUserValue;
  String base64Image = "";
  File? selectedImage;
  final List<String> fileType = ['image', 'video'];

  ///

  String description = "";
  int? totalAmount;
  String? str;
  File? selectedVideo;

  @override
  void dispose() {
    super.dispose();
  }

  /////
  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        //  dashboardcontroller.setSelectedImage(selectedImage);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        dashController.updateSelectedImage(selectedImage!);
        // profilecontroller.editProfilePicture(selectedImage!); //
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
    }
  }

  @override
  void initState() {
    setState(() {
      //                             :
//

// pincode:
// location:
// style:south
// language:telugu
// gender:male

      dashController.addUserFnameController.text = "ram";

      dashController.addUserLnameController.text = "nayak";

      dashController.addUserMobileController.text = "6281682528";

      dashController.addUserPincodeController.text = "500072";

      dashController.addUserLocationController.text = "hyderabad";
      dashController.addUserStyleController.text = "south";
    });
    super.initState();
  }
  //////

  DateTime choosenDate = DateTime.now();
  final List<String> CompanyList = ['male', 'female', 'others'];
  AuthController authcontroller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  String? selectedUserValueLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: KbluethemeThick,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Kwhite,
              size: 22.sp,
            ),
          ),
          title: Text(
            "Add Personal Details ",
            style: GoogleFonts.dmSerifDisplay(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
          )),
      backgroundColor: Kbg_theme_two,
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(
                top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      selectedImage != null
                          ? Stack(
                              children: [
                                ClipOval(
                                  child: Image.file(
                                    selectedImage!,
                                    //   width: dou.w,
                                    height: 140.h,
                                    width: 140.w,
                                    //   fit: BoxFit.cover,
                                    fit: BoxFit.cover,
                                    // height: 100.h,
                                    // width: 100.w,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                                // Container(
                                //   width: double.infinity,
                                //   // padding: EdgeInsets.all(12),
                                //   margin: EdgeInsets.only(bottom: 10),
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //         color: Klight_grey_twg, width: 1),
                                //     color: Kwhite,
                                //     borderRadius: BorderRadius.only(
                                //         topLeft: Radius.circular(5),
                                //         topRight: Radius.circular(5),
                                //         bottomLeft: Radius.circular(5),
                                //         bottomRight: Radius.circular(5)),
                                //   ),
                                //   child: Image.file(
                                //     selectedImage!,
                                //     //   width: dou.w,
                                //     height: 140.h,
                                //     //   fit: BoxFit.cover,
                                //     fit: BoxFit.cover,
                                //     // height: 100.h,
                                //     // width: 100.w,
                                //     // fit: BoxFit.cover,
                                //   ),
                                // ),
                              ],
                            )
                          : Text(
                              "No image selected",
                              style: TextStyle(color: KdarkText),
                            ),
                      SizedBox(
                        height: 20.h,
                      ),
                      selectedImage == null
                          ? CustomButton(
                              // margin: EdgeInsets.only(top: 36.h),
                              borderRadius: BorderRadius.circular(5.r),
                              Color: kAstroBgblue,
                              textColor: Kwhite,
                              height: 45,
                              width: double.infinity,
                              label: "Browse image",
                              fontSize: kSixteenFont,
                              fontWeight: kFW600,
                              isLoading: false,
                              onTap: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                    ),
                                    backgroundColor: Kbackground,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Kbackground,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          height: 100.h,
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  chooseImage("Gallery");
                                                  Navigator.pop(context);
                                                },
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.image_outlined,
                                                      color: kAstroBgblue,
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text('Gallery',
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .robotoCondensed(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    kFW700,
                                                                color:
                                                                    KdarkText)),
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  chooseImage("camera");
                                                  Navigator.pop(context);
                                                },
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.camera_alt_outlined,
                                                      color: kAstroBgblue,
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text('camera',
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .robotoCondensed(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    kFW700,
                                                                color:
                                                                    KdarkText)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              })
                          : Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // selectedImage == null
                                //     ? SizedBox()
                                //     :
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedImage = null;
                                    });
                                    dashController.updateSelectedImage(null);
                                    //  updateSelectedImage
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 110,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Klight_grey_twg, width: 1),
                                      color: Kwhite,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          size: 24.sp,
                                          color: kAstroBgblue,
                                        ),
                                        // Image.asset(
                                        //   "assets/images/delete.png",
                                        //   height: 24,
                                        //   width: 24,
                                        // ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          "Delete",
                                          style: GoogleFonts.robotoCondensed(
                                              color: Klight_grey_twg,
                                              fontSize: kSixteenFont,
                                              fontWeight: kFW600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomButton(
                                    // margin: EdgeInsets.only(top: 36.h),
                                    borderRadius: BorderRadius.circular(5.r),
                                    Color: kAstroBgblue,
                                    textColor: Kwhite,
                                    height: 45,
                                    width: 155.w,
                                    label: "Browse ",
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW600,
                                    isLoading: false,
                                    onTap: () {
                                      showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                          ),
                                          backgroundColor: Kbackground,
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Kbackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20))),
                                                height: 100.h,
                                                padding:
                                                    EdgeInsets.only(top: 20.h),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        chooseImage("Gallery");
                                                        Navigator.pop(context);
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .image_outlined,
                                                            color: Kblue_twg,
                                                          ),
                                                          SizedBox(
                                                            height: 5.h,
                                                          ),
                                                          Text('Gallery',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .robotoCondensed(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          kFW700,
                                                                      color:
                                                                          KdarkText)),
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        chooseImage("camera");
                                                        Navigator.pop(context);
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .camera_alt_outlined,
                                                            color: Kblue_twg,
                                                          ),
                                                          SizedBox(
                                                            height: 5.h,
                                                          ),
                                                          Text('camera',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .robotoCondensed(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          kFW700,
                                                                      color:
                                                                          KdarkText)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }),
                              ],
                            ),
                      SizedBox(
                        height: 35.h,
                      ),
                    ],
                  ),

                  ///video
                  Text("Enter your Details",
                      style: GoogleFonts.poppins(
                          fontSize: kEighteenFont,
                          fontWeight: kFW400,
                          color: KdarkText)),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomFormFields(
                    ontap: () {
                      //  Get.toNamed(kSearchPlaces); // kForgotPassword
                    },
                    controller: dashController.addUserFnameController,
                    enabled: true,
                    labelColor: KText,
                    obscureText: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    fontSize: kFourteenFont,
                    fontWeight: FontWeight.w500,
                    hintText: "Enter first name",
                    maxLines: 1,
                    label: "First name",
                    readOnly: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomFormFields(
                    ontap: () {
                      //  Get.toNamed(kSearchPlaces); // kForgotPassword
                    },
                    controller: dashController.addUserLnameController,
                    //   controller: authcontroller.regrEmailSignInController,
                    enabled: true,
                    // keyboardType: TextInputType.phone,
                    labelColor: KText,
                    obscureText: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    fontSize: kFourteenFont,
                    fontWeight: FontWeight.w500,
                    hintText: "enter last name",
                    maxLines: 1,
                    readOnly: false,
                    label: "last name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomFormFields(
                    ontap: () {
                      //  Get.toNamed(kSearchPlaces); // kForgotPassword
                    },
                    controller: dashController.addUserMobileController,
                    //   controller: authcontroller.regrEmailSignInController,
                    enabled: true,
                    keyboardType: TextInputType.phone,
                    labelColor: KText,
                    obscureText: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    fontSize: kFourteenFont,
                    fontWeight: FontWeight.w500,
                    hintText: "mobile Number",
                    maxLines: 1,
                    readOnly: false,
                    label: "Mobile",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter last mobile naumer';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomFormFields(
                    ontap: () {},
                    enabled: true,
                    controller: dashController.addUserLocationController,
                    labelColor: KText,
                    obscureText: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    fontSize: kFourteenFont,
                    fontWeight: FontWeight.w500,
                    hintText: "enter address",
                    maxLines: 1,
                    readOnly: false,
                    label: "Address",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomFormFields(
                    ontap: () {},
                    enabled: true,
                    keyboardType: TextInputType.number,
                    controller: dashController.addUserPincodeController,
                    labelColor: KText,
                    obscureText: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    fontSize: kFourteenFont,
                    fontWeight: FontWeight.w500,
                    hintText: "enter pincode",
                    maxLines: 1,
                    readOnly: false,
                    label: "Pin Code",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter pin code';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomFormFields(
                    hintText: selectedDateText.value,
                    obscureText: false,
                    ontap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(1924, 8),
                        lastDate: DateTime(2025, 8),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Colors.blue, // Primary color
                                onSurface: Colors.black, // Text color
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                          selectedDateText.value =
                              DateFormat('yyyy-MM-dd').format(selectedDate);
                        });
                      }
                    },
                    enabled: true,
                    readOnly: true,
                    labelColor: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    hintColor: Colors.grey.withOpacity(0.5),
                    maxLines: 1,
                    label: "Date of Birth",
                    validator: (value) {},
                  ),

                  const SizedBox(height: 16), // Space between fields

                  CustomFormFields(
                    hintText: selectedTimeText.value,
                    obscureText: false,
                    ontap: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              timePickerTheme: const TimePickerThemeData(
                                dialBackgroundColor: Colors.white,
                                hourMinuteTextColor: Colors.black,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime;
                          selectedTimeText.value = DateFormat('hh:mm a').format(
                            DateTime(2025, 1, 1, selectedTime.hour,
                                selectedTime.minute),
                          );
                        });
                      }
                    },
                    enabled: true,
                    readOnly: true,
                    labelColor: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    hintColor: Colors.grey.withOpacity(0.5),
                    maxLines: 1,
                    label: "Time of Birth",
                    validator: (value) {},
                  ),
                  // CustomFormFields(
                  //   hintText: selectDate.value,
                  //   ontap: () async {
                  //     // Step 1: Show Date Picker
                  //     final DateTime? pickedDate = await showDatePicker(
                  //       context: context,
                  //       initialDate: selectedDate,
                  //       firstDate: DateTime(1924, 8),
                  //       lastDate: DateTime(2025, 8),
                  //       builder: (context, child) {
                  //         return Theme(
                  //           data: Theme.of(context).copyWith(
                  //             colorScheme: const ColorScheme.light(
                  //               primary:
                  //                   Colors.blue, // Primary color for date picker
                  //               onSurface:
                  //                   Colors.black, // Text color for unselected items
                  //             ),
                  //           ),
                  //           child: child!,
                  //         );
                  //       },
                  //     );

                  //     if (pickedDate != null) {
                  //       // Step 2: Show Time Picker
                  //       final TimeOfDay? pickedTime = await showTimePicker(
                  //         context: context,
                  //         initialTime: TimeOfDay.fromDateTime(selectedDate),
                  //         builder: (context, child) {
                  //           return Theme(
                  //             data: Theme.of(context).copyWith(
                  //               timePickerTheme: const TimePickerThemeData(
                  //                 dialBackgroundColor: Colors.white,
                  //                 hourMinuteTextColor: Colors.black,
                  //               ),
                  //             ),
                  //             child: child!,
                  //           );
                  //         },
                  //       );

                  //       if (pickedTime != null) {
                  //         // Step 3: Combine Date and Time
                  //         setState(() {
                  //           selectedDate = DateTime(
                  //             pickedDate.year,
                  //             pickedDate.month,
                  //             pickedDate.day,
                  //             pickedTime.hour,
                  //             pickedTime.minute,
                  //           );

                  //           // Store the selected date in "yyyy-MM-dd" format
                  //           selectDate.value =
                  //               DateFormat('yyyy-MM-dd').format(selectedDate);
                  //         });
                  //       }
                  //     }
                  //   },
                  //   enabled: true,
                  //   readOnly: true,
                  //   labelColor: Colors.black,
                  //   onChanged: (value) {
                  //     setState(() {});
                  //   },
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w500,
                  //   hintColor: Colors.grey.withOpacity(0.5),
                  //   maxLines: 1,
                  //   label: "Date of Birth",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please select a date';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // CustomFormFields(
                  //   hintText: DateFormat.yMMMd().format(selectedDate) ==
                  //           DateFormat.yMMMd().format(DateTime.now())
                  //       ? "Select Date & Time"
                  //       : DateFormat('dd/MM/yyyy hh:mm a').format(selectedDate),
                  //   ontap: () async {
                  //     // Step 1: Show Date Picker
                  //     final DateTime? pickedDate = await showDatePicker(
                  //       context: context,
                  //       initialDate: selectedDate,
                  //       firstDate: DateTime(1924, 8),
                  //       lastDate: DateTime(2025, 8),
                  //       builder: (context, child) {
                  //         return Theme(
                  //           data: Theme.of(context).copyWith(
                  //             colorScheme: const ColorScheme.light(
                  //               primary:
                  //                   Kform_border_twg, // Primary color for date picker
                  //               onSurface:
                  //                   Colors.black, // Text color for unselected items
                  //             ),
                  //           ),
                  //           child: child!,
                  //         );
                  //       },
                  //     );

                  //     if (pickedDate != null) {
                  //       // Step 2: Show Time Picker
                  //       final TimeOfDay? pickedTime = await showTimePicker(
                  //         context: context,
                  //         initialTime: TimeOfDay.fromDateTime(selectedDate),
                  //         builder: (context, child) {
                  //           return Theme(
                  //             data: Theme.of(context).copyWith(
                  //               timePickerTheme: const TimePickerThemeData(
                  //                 dialBackgroundColor: Colors.white,
                  //                 hourMinuteTextColor: Colors.black,
                  //               ),
                  //             ),
                  //             child: child!,
                  //           );
                  //         },
                  //       );

                  //       if (pickedTime != null) {
                  //         // Step 3: Combine Date and Time
                  //         setState(() {
                  //           selectedDate = DateTime(
                  //             pickedDate.year,
                  //             pickedDate.month,
                  //             pickedDate.day,
                  //             pickedTime.hour,
                  //             pickedTime.minute,
                  //           );
                  //           choosenDate = selectedDate; // Store the selected date
                  //           selectDate.value = DateFormat('MM/dd/yyyy hh:mm a')
                  //               .format(selectedDate);
                  //         });
                  //       }
                  //     }
                  //   },
                  //   enabled: true,
                  //   readOnly: true,
                  //   labelColor: KText,
                  //   onChanged: (value) {
                  //     setState(() {});
                  //   },
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   // prefix: Image.asset(
                  //   //   "assets/images/black_clock.png",
                  //   //   height: 10.h,
                  //   //   width: 10.w,
                  //   // ),
                  //   fontWeight: FontWeight.w500,
                  //   hintColor: DateFormat.yMMMd().format(selectedDate) ==
                  //           DateFormat.yMMMd().format(DateTime.now())
                  //       ? KTextgery.withOpacity(0.5)
                  //       : KdarkText,
                  //   maxLines: 1,
                  //   label: "Date of birth",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please Schedule';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Language",
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kSixteenFont,
                            fontWeight: kFW400),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Kbg_theme_two,
                            boxShadow: [
                              BoxShadow(
                                color: kblack.withOpacity(0.2),
                                blurRadius: 2.r,
                                offset: Offset(1, 1),
                                spreadRadius: 1.r,
                              )
                            ]),
                        child: DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kblack.withOpacity(0.6), width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kblack.withOpacity(0.6), width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kblack.withOpacity(0.6), width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Kform_border_twg, width: 1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Kform_border_twg, width: 1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          hint: Text(
                            'Select Langauge',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: KTextgery.withOpacity(0.5),
                            ),
                          ),
                          items: LanguageList.map(
                              (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )).toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Language';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedUserValueLanguage = value.toString();
                              // menuscontroller.influencerGender.value =
                              //     value.toString();
                              setState(() {});
                            });
                          },
                          onSaved: (value) {
                            selectedUserValueLanguage = value.toString();
                            print(selectedUserValueLanguage);

                            setState(() {});
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: kblack.withOpacity(0.6),
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),

                      // Text(
                      //   "Your Digital influencer",
                      //   style: GoogleFonts.poppins(
                      //       color: Kform_border_twg,
                      //       fontSize: kTwentyFont,
                      //       fontWeight: kFW500),
                      // ),
                      // menuscontroller
                      //             .createDigitalData["response_body"] ==
                      //         null
                      //     ? SizedBox()
                      //     :
                      //     Column(
                      //         children: [
                      //           Container(
                      //             height: 200.h,
                      //             margin: EdgeInsets.only(
                      //                 top: 10.h, bottom: 15.h),
                      //             padding: EdgeInsets.all(8),
                      //             // alignment: Alignment.center,
                      //             decoration: BoxDecoration(
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                   color: kblack.withOpacity(0.3),
                      //                   blurRadius: 1.r,
                      //                   offset: Offset(1, 1),
                      //                   spreadRadius: 1.r,
                      //                 )
                      //               ],
                      //               color: Kwhite,
                      //               borderRadius:
                      //                   BorderRadius.circular(4.r),
                      //             ),
                      //             child: ClipRRect(
                      //               borderRadius:
                      //                   BorderRadius.circular(8),
                      //               child:
                      //                   // Image.asset(
                      //                   //   "assets/images/ai_lady.png",
                      //                   //   height: 200.h,
                      //                   //   fit: BoxFit.fill,
                      //                   //   width: double.infinity,
                      //                   // ),
                      //                   CachedNetworkImage(
                      //                 imageUrl: menuscontroller
                      //                         .createDigitalData[
                      //                     "response_body"],
                      //                 // multiPostcontroller
                      //                 //         .mutiPostList[
                      //                 //     index]["img"],
                      //                 placeholder: (context, url) =>
                      //                     SizedBox(
                      //                   height: 200.h,
                      //                   width: double.infinity,
                      //                   child: Shimmer.fromColors(
                      //                     baseColor: Colors.black12,
                      //                     highlightColor: Colors.white
                      //                         .withOpacity(0.5),
                      //                     child: Container(
                      //                       decoration: BoxDecoration(
                      //                         color:
                      //                             Kwhite.withOpacity(0.5),
                      //                       ),
                      //                       height: 200.h,
                      //                       width: double.infinity,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 errorWidget:
                      //                     (context, url, error) =>
                      //                         Image.asset(
                      //                   // kBaseImageUrl
                      //                   "assets/images/multipost_image.png",
                      //                   height: 200.h,
                      //                   width: double.infinity,
                      //                   fit: BoxFit.fill,
                      //                   // width: 25.h,
                      //                 ),
                      //                 height: 200.h,
                      //                 width: double.infinity,
                      //                 fit: BoxFit.fill,
                      //               ),
                      //             ),
                      //           ),
                      //           Row(
                      //             children: [
                      //               Obx(
                      //                 () => menuscontroller
                      //                             .savecreateDigitalLoading ==
                      //                         true
                      //                     ? Center(
                      //                         child:
                      //                             CircularProgressIndicator(
                      //                           color: Kform_border_twg,
                      //                         ),
                      //                       )
                      //                     : CustomButton(
                      //                         margin: EdgeInsets.only(
                      //                             top: 36.h),
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                                 8.r),
                      //                         Color: Kform_border_twg,
                      //                         textColor: Kwhite,
                      //                         height: 40,
                      //                         width: 150.w,
                      //                         label: "Save",
                      //                         fontSize: kSixteenFont,
                      //                         fontWeight: kFW700,
                      //                         isLoading: false,
                      //                         onTap: () {
                      //                           var payloaddd = {
                      //                             "age": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "age"],
                      //                             "background":
                      //                                 menuscontroller
                      //                                         .createDigitalPayload[
                      //                                     "background"],
                      //                             "country": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "country"],
                      //                             "dress": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "dress"],
                      //                             "gender": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "gender"],
                      //                             "image_url": menuscontroller
                      //                                     .createDigitalData[
                      //                                 "response_body"],
                      //                             // "https://images.pexels.com/photos/3314294/pexels-photo-3314294.jpeg",
                      //                             "looks": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "looks"],
                      //                             "user_id":
                      //                                 userprofilecontroller
                      //                                         .profileData[
                      //                                     "user_details"]["id"]
                      //                             // "gender": menuscontroller
                      //                             //     .influencerGender.value,
                      //                             // "age": authcontroller
                      //                             //     .textController.text,
                      //                             // "country": menuscontroller
                      //                             //     .digiInfluCountry.text,
                      //                             // "looks": menuscontroller
                      //                             //     .digiInfluLooks.text,
                      //                             // "dress": menuscontroller
                      //                             //     .digiInfluDress.text,
                      //                             // "background": menuscontroller
                      //                             //     .digiInfluBackground.text
                      //                             // "country": "india",
                      //                             // "looks": "orange hair, face white",
                      //                             // "dress": "formal",
                      //                             // "background": "inside office"
                      //                           };

                      //                           // if (_formKey.currentState!.validate()) {
                      //                           //   authcontroller.userSignIn(payload);
                      //                           // }

                      //                           menuscontroller
                      //                               .saveusercreateDigital(
                      //                                   payloaddd);
                      //                           ;

                      //                           // Get.toNamed(kNavigation);
                      //                         }),
                      //               ),

                      //               // regenaret
                      //               Obx(
                      //                 () => menuscontroller
                      //                             .createDigitalLoading ==
                      //                         true
                      //                     ? Center(
                      //                         child:
                      //                             CircularProgressIndicator(
                      //                           color: Kform_border_twg,
                      //                         ),
                      //                       )
                      //                     : CustomButton(
                      //                         margin: EdgeInsets.only(
                      //                             top: 36.h),
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                                 8.r),
                      //                         Color: Kform_border_twg,
                      //                         textColor: Kwhite,
                      //                         height: 40,
                      //                         width: double.infinity,
                      //                         label: "Submit",
                      //                         fontSize: kSixteenFont,
                      //                         fontWeight: kFW700,
                      //                         isLoading: false,
                      //                         onTap: () {
                      //                           menuscontroller
                      //                               .usercreateDigital(
                      //                                   menuscontroller
                      //                                       .createDigitalPayload
                      //                                       .value);
                      //                           // if (_formKey.currentState!.validate()) {
                      //                           //   authcontroller.userSignIn(payload);
                      //                           // }

                      //                           // Get.toNamed(kNavigation);
                      //                         }),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kSixteenFont,
                            fontWeight: kFW400),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Kbg_theme_two,
                            boxShadow: [
                              BoxShadow(
                                color: kblack.withOpacity(0.2),
                                blurRadius: 2.r,
                                offset: Offset(1, 1),
                                spreadRadius: 1.r,
                              )
                            ]),
                        child: DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kblack.withOpacity(0.6), width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kblack.withOpacity(0.6), width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kblack.withOpacity(0.6), width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Kform_border_twg, width: 1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Kform_border_twg, width: 1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          hint: Text(
                            'Select Gender',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: KTextgery.withOpacity(0.5),
                            ),
                          ),
                          items: CompanyList.map(
                              (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )).toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Gender';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedUserValue = value.toString();
                              // menuscontroller.influencerGender.value =
                              //     value.toString();
                              setState(() {});
                            });
                          },
                          onSaved: (value) {
                            selectedUserValue = value.toString();
                            print(selectedUserValue);

                            setState(() {});
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: kblack.withOpacity(0.6),
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      // Text(
                      //   "Your Digital influencer",
                      //   style: GoogleFonts.poppins(
                      //       color: Kform_border_twg,
                      //       fontSize: kTwentyFont,
                      //       fontWeight: kFW500),
                      // ),
                      // menuscontroller
                      //             .createDigitalData["response_body"] ==
                      //         null
                      //     ? SizedBox()
                      //     :
                      //     Column(
                      //         children: [
                      //           Container(
                      //             height: 200.h,
                      //             margin: EdgeInsets.only(
                      //                 top: 10.h, bottom: 15.h),
                      //             padding: EdgeInsets.all(8),
                      //             // alignment: Alignment.center,
                      //             decoration: BoxDecoration(
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                   color: kblack.withOpacity(0.3),
                      //                   blurRadius: 1.r,
                      //                   offset: Offset(1, 1),
                      //                   spreadRadius: 1.r,
                      //                 )
                      //               ],
                      //               color: Kwhite,
                      //               borderRadius:
                      //                   BorderRadius.circular(4.r),
                      //             ),
                      //             child: ClipRRect(
                      //               borderRadius:
                      //                   BorderRadius.circular(8),
                      //               child:
                      //                   // Image.asset(
                      //                   //   "assets/images/ai_lady.png",
                      //                   //   height: 200.h,
                      //                   //   fit: BoxFit.fill,
                      //                   //   width: double.infinity,
                      //                   // ),
                      //                   CachedNetworkImage(
                      //                 imageUrl: menuscontroller
                      //                         .createDigitalData[
                      //                     "response_body"],
                      //                 // multiPostcontroller
                      //                 //         .mutiPostList[
                      //                 //     index]["img"],
                      //                 placeholder: (context, url) =>
                      //                     SizedBox(
                      //                   height: 200.h,
                      //                   width: double.infinity,
                      //                   child: Shimmer.fromColors(
                      //                     baseColor: Colors.black12,
                      //                     highlightColor: Colors.white
                      //                         .withOpacity(0.5),
                      //                     child: Container(
                      //                       decoration: BoxDecoration(
                      //                         color:
                      //                             Kwhite.withOpacity(0.5),
                      //                       ),
                      //                       height: 200.h,
                      //                       width: double.infinity,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 errorWidget:
                      //                     (context, url, error) =>
                      //                         Image.asset(
                      //                   // kBaseImageUrl
                      //                   "assets/images/multipost_image.png",
                      //                   height: 200.h,
                      //                   width: double.infinity,
                      //                   fit: BoxFit.fill,
                      //                   // width: 25.h,
                      //                 ),
                      //                 height: 200.h,
                      //                 width: double.infinity,
                      //                 fit: BoxFit.fill,
                      //               ),
                      //             ),
                      //           ),
                      //           Row(
                      //             children: [
                      //               Obx(
                      //                 () => menuscontroller
                      //                             .savecreateDigitalLoading ==
                      //                         true
                      //                     ? Center(
                      //                         child:
                      //                             CircularProgressIndicator(
                      //                           color: Kform_border_twg,
                      //                         ),
                      //                       )
                      //                     : CustomButton(
                      //                         margin: EdgeInsets.only(
                      //                             top: 36.h),
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                                 8.r),
                      //                         Color: Kform_border_twg,
                      //                         textColor: Kwhite,
                      //                         height: 40,
                      //                         width: 150.w,
                      //                         label: "Save",
                      //                         fontSize: kSixteenFont,
                      //                         fontWeight: kFW700,
                      //                         isLoading: false,
                      //                         onTap: () {
                      //                           var payloaddd = {
                      //                             "age": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "age"],
                      //                             "background":
                      //                                 menuscontroller
                      //                                         .createDigitalPayload[
                      //                                     "background"],
                      //                             "country": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "country"],
                      //                             "dress": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "dress"],
                      //                             "gender": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "gender"],
                      //                             "image_url": menuscontroller
                      //                                     .createDigitalData[
                      //                                 "response_body"],
                      //                             // "https://images.pexels.com/photos/3314294/pexels-photo-3314294.jpeg",
                      //                             "looks": menuscontroller
                      //                                     .createDigitalPayload[
                      //                                 "looks"],
                      //                             "user_id":
                      //                                 userprofilecontroller
                      //                                         .profileData[
                      //                                     "user_details"]["id"]
                      //                             // "gender": menuscontroller
                      //                             //     .influencerGender.value,
                      //                             // "age": authcontroller
                      //                             //     .textController.text,
                      //                             // "country": menuscontroller
                      //                             //     .digiInfluCountry.text,
                      //                             // "looks": menuscontroller
                      //                             //     .digiInfluLooks.text,
                      //                             // "dress": menuscontroller
                      //                             //     .digiInfluDress.text,
                      //                             // "background": menuscontroller
                      //                             //     .digiInfluBackground.text
                      //                             // "country": "india",
                      //                             // "looks": "orange hair, face white",
                      //                             // "dress": "formal",
                      //                             // "background": "inside office"
                      //                           };

                      //                           // if (_formKey.currentState!.validate()) {
                      //                           //   authcontroller.userSignIn(payload);
                      //                           // }

                      //                           menuscontroller
                      //                               .saveusercreateDigital(
                      //                                   payloaddd);
                      //                           ;

                      //                           // Get.toNamed(kNavigation);
                      //                         }),
                      //               ),

                      //               // regenaret
                      //               Obx(
                      //                 () => menuscontroller
                      //                             .createDigitalLoading ==
                      //                         true
                      //                     ? Center(
                      //                         child:
                      //                             CircularProgressIndicator(
                      //                           color: Kform_border_twg,
                      //                         ),
                      //                       )
                      //                     : CustomButton(
                      //                         margin: EdgeInsets.only(
                      //                             top: 36.h),
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                                 8.r),
                      //                         Color: Kform_border_twg,
                      //                         textColor: Kwhite,
                      //                         height: 40,
                      //                         width: double.infinity,
                      //                         label: "Submit",
                      //                         fontSize: kSixteenFont,
                      //                         fontWeight: kFW700,
                      //                         isLoading: false,
                      //                         onTap: () {
                      //                           menuscontroller
                      //                               .usercreateDigital(
                      //                                   menuscontroller
                      //                                       .createDigitalPayload
                      //                                       .value);
                      //                           // if (_formKey.currentState!.validate()) {
                      //                           //   authcontroller.userSignIn(payload);
                      //                           // }

                      //                           // Get.toNamed(kNavigation);
                      //                         }),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                    ],
                  ),

                  // CustomFormFields(
                  //   ontap: () {},
                  //   enabled: true,
                  //   labelColor: KText,
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   fontWeight: FontWeight.w500,
                  //   hintText: "enter village",
                  //   maxLines: 1,
                  //   readOnly: false,
                  //   label: "Village",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter village';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  CustomFormFields(
                    ontap: () {},
                    enabled: true,
                    labelColor: KText,
                    controller: dashController.addUserStyleController,
                    obscureText: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    fontSize: kFourteenFont,
                    fontWeight: FontWeight.w500,
                    hintText: "enter style",
                    maxLines: 1,
                    readOnly: false,
                    label: "Style",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter style';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // CustomFormFields(
                  //   ontap: () {},
                  //   enabled: true,
                  //   labelColor: KText,
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   fontWeight: FontWeight.w500,
                  //   hintText: "enter state",
                  //   maxLines: 1,
                  //   readOnly: false,
                  //   label: "State",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter state';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // CustomFormFields(
                  //   ontap: () {},
                  //   enabled: true,
                  //   labelColor: KText,
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   fontWeight: FontWeight.w500,
                  //   hintText: "enter country",
                  //   maxLines: 1,
                  //   readOnly: false,
                  //   label: "Country",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter country';
                  //     }
                  //     return null;
                  //   },
                  // ),

                  Obx(
                    () => dashController.userDetailsUpdateLoading == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Kform_border_twg,
                            ),
                          )
                        : CustomButton(
                            margin: EdgeInsets.only(top: 36.h),
                            borderRadius: BorderRadius.circular(8.r),
                            Color: Kform_border_twg,
                            textColor: Kwhite,
                            height: 40,
                            width: double.infinity,
                            label: "Add Details",
                            fontSize: kSixteenFont,
                            fontWeight: kFW700,
                            isLoading: false,
                            onTap: () {
                              ///

                              /////
                              var payload = {
                                // "volunter_id":
                                //     dashboardController.profileData["user_id"] ??
                                //         "",
                                // //
                                // "name": dashboardController.issuename.text,
                                // "mobile_number":
                                //     dashboardController.issuemobile.text,
                                // "subject": dashboardController.issuesubject.text,
                                // "content": dashboardController.issuecontent.text,
                                // "village": dashboardController.issuevillage.text,
                                // "mandal": dashboardController.issuemandal.text,
                                // "constitution":
                                //     dashboardController.issueconstitution.text,
                                // "city": dashboardController.issuecity.text,
                                // Add uaser
//                             :ram
// lastName:nayak
// mobileNumber:6281682528
// dateOfBirth:2025-06-14
// timeOfBirth:09:30 Am
// pincode:500072
// location:hyderabad
// style:south
// language:telugu
// gender:male
//  TextEditingController  = TextEditingController();
//   TextEditingController addUserLnameController = TextEditingController();
//   TextEditingController addUserMobileController = TextEditingController();
//   TextEditingController addUserPincodeController = TextEditingController();
//   TextEditingController addUserLocationController = TextEditingController();
//   TextEditingController addUserStyleController = TextEditingController();
                                //
                                "firstName":
                                    dashController.addUserFnameController.text,
                                "lastName":
                                    dashController.addUserLnameController.text,
                                "mobileNumber":
                                    dashController.addUserMobileController.text,
                                "dateOfBirth": selectedDateText.value,
                                "timeOfBirth": selectedTimeText.value,
                                "pincode": dashController
                                    .addUserPincodeController.text,
                                "location": dashController
                                    .addUserLocationController.text,
                                "style":
                                    dashController.addUserStyleController.text,
                                "language": selectedUserValueLanguage,
                                "gender": selectedUserValue,
                                // 'issue_type': serviceData["type"] ?? ""
                              };

                              //  if (selectedImage != null) {
                              if (_formKey.currentState!.validate()) {
                                dashController.update11User(payload);
                              }
                              setState(() {
                                // dashboardController.imageTitleController.text = "";
                                // dashboardController.videoTitleController.text = "";
                              });
                              setState(() {
                                selectedImage = null;
                              });
                            }
                            // onTap: () {
                            //   var payload = {
                            //     // "shipping_email": "durgaprasadtechpixe@gmail.com",
                            //     // "shipping_customer_name": "Durga Prasad",
                            //     // "shipping_last_name": "Sunkara",
                            //     // "shipping_phone": "7993916648",
                            //     // "shipping_pincode": "534350",
                            //     // "shipping_address": "14-161",
                            //     // "shipping_city": "Kovvuru",
                            //     // "shipping_state": "Telangana",
                            //     // "shipping_country": "India"
                            //     //update
                            //     "shipping_customer_name":
                            //         dashController.shipFirstname.text.trim(),
                            //     "shipping_last_name":
                            //         dashController.shipLastName.text.trim(),
                            //     "shipping_address":
                            //         dashController.shipAddessController.text.trim(),
                            //     "shipping_address_2": dashController
                            //         .shipAddess2Controller.text
                            //         .trim(),
                            //     "shipping_city":
                            //         dashController.shipCityController.text.trim(),
                            //     "shipping_pincode": int.parse(dashController
                            //         .shipPincodeController.text
                            //         .trim()),

                            //     //500072,
                            //     "shipping_country": dashController
                            //         .shipCountryController.text
                            //         .trim(),
                            //     "shipping_state":
                            //         dashController.shipStateController.text.trim(),
                            //     "shipping_email":
                            //         dashController.shipEmailController.text.trim(),
                            //     "shipping_phone":
                            //         dashController.shipMobileController.text.trim(),
                            //   };

                            //   dashController.useCreateOrders(payload);

                            // }
                            ),
                  ),
                  // CustomButton(
                  //     margin: EdgeInsets.only(top: 36.h),
                  //     borderRadius: BorderRadius.circular(8.r),
                  //     Color: Kform_border_twg,
                  //     textColor: Kwhite,
                  //     height: 40,
                  //     width: double.infinity,
                  //     label: "Saves",
                  //     fontSize: kSixteenFont,
                  //     fontWeight: kFW700,
                  //     isLoading: false,
                  //     onTap: () {
                  //       Get.toNamed(kNavigation);
                  //     }),
                ],
              ),
            )),
      ),
    );
  }
}
