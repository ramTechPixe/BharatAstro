import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';
import 'package:intl/intl.dart';

class Partner_form extends StatefulWidget {
  const Partner_form({super.key});

  @override
  State<Partner_form> createState() => _Partner_formState();
}

class _Partner_formState extends State<Partner_form> {
  AuthController authcontroller = Get.put(AuthController());
  MatchingController matchController = Get.put(MatchingController());
  final _formKey = GlobalKey<FormState>();
  String? selectedOption;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  String? selectedUserValueLanguage;
  var selectedArea = ''.obs;

  //  String? selectedUserValueLanguage;
  final List<String> CompanyList = ['male', 'female', 'others'];
  String? selectedUserValue;
  @override
  void initState() {
    super.initState();
  }

  //new code
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  ValueNotifier<String> selectedDateText = ValueNotifier<String>("Select Date");
  ValueNotifier<String> selectedTimeText = ValueNotifier<String>("Select Time");

  String? selectedValue;
  String? selectedGenderValue;
  String? selectedValue_language;
  String? selectedGenderValue_language;
  var selectDate = "Select Date".obs;
  DateTime choosenDate = DateTime.now();
  final List<String> LanguageList = [
    "english",
    // "assamese",
    // "bengali",
    // "bodo",
    // "dogri",
    // "gujarati",
    // "hindi",
    // "kannada",
    // "kashmiri",
    // "konkani",
    // "maithili",
    // "malayalam",
    // "manipuri",
    // "marathi",
    // "nepali",
    // "odia",
    // "punjabi",
    // "sanskrit",
    // "santali",
    // "sindhi",
    // "tamil",
    // "telugu",
    // "urdu",
    // "tulu",
    // "kodava",
    // "lepcha",
    // "bhili",
    // "garo",
    // "khasi",
    // "mizo",
    // "ho",
    // "ladakhi",
    // "kurukh",
    // "mundari",
    // "gondi",
    // "angika",
    // "bishnupriya manipuri",
    // "sourashtra"
  ];

  //['telugu', 'hindi', 'english'];
  //////////image
  bool showimagenullMessage = false;

  String base64Image = "";

  final List<String> fileType = ['image', 'video'];

  ///

  String description = "";
  int? totalAmount;
  String? str;

  @override
  void dispose() {
    super.dispose();
  }

  /////
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
              "Partner Details",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  top: 16.h,
                  //top: MediaQuery.of(context).size.height / 4,
                  left: 16.w,
                  right: 16.w,
                  bottom: 16.w),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    // autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                          //  height: MediaQuery.of(context).size.height / 3.5,
                        ),
                        Text(matchController.selected_cardData["title"],
                            //"Gem Details",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.dmSerifDisplay(
                                fontSize: 21.sp,
                                fontWeight: kFW400,
                                color: Kbluetheme)),
                        SizedBox(
                          height: 10.h,
                        ),

                        CustomFormFields(
                          ontap: () {
                            //  Get.toNamed(kSearchPlaces); // kForgotPassword
                          },
                          controller: authcontroller.matchNameController,
                          enabled: true,
                          labelColor: KText,
                          obscureText: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          fontSize: kFourteenFont,
                          fontWeight: FontWeight.w500,
                          hintText: "full name",
                          // "Enter ${utilityController.selected_cardData["key"]}",
                          maxLines: 1,
                          readOnly: false,
                          label: "Full Name",
                          //"${utilityController.selected_cardData["key"]}",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
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
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Kform_border_twg, width: 1),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Kform_border_twg, width: 1),
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
                              height: 15.h,
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
                                    DateFormat('yyyy-MM-dd')
                                        .format(selectedDate);
                              });
                              setState(() {});
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
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please select a date';
                          //   }
                          //   return null;
                          // },
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
                                selectedTimeText.value =
                                    DateFormat('hh:mm a').format(
                                  DateTime(2025, 1, 1, selectedTime.hour,
                                      selectedTime.minute),
                                );
                              });
                              setState(() {});
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
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please select a time';
                          //   }
                          //   return null;
                          // },
                        ),
                        SizedBox(
                          height: 15.h,
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
                                          color: kblack.withOpacity(0.6),
                                          width: 0.5),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kblack.withOpacity(0.6),
                                          width: 0.5),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kblack.withOpacity(0.6),
                                          width: 0.5),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Kform_border_twg, width: 1),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Kform_border_twg, width: 1),
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
                                      selectedUserValueLanguage =
                                          value.toString();
                                      // menuscontroller.influencerGender.value =
                                      //     value.toString();
                                      setState(() {});
                                    });
                                  },
                                  onSaved: (value) {
                                    selectedUserValueLanguage =
                                        value.toString();
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomFormFields(
                          ontap: () {},
                          enabled: true,
                          keyboardType: TextInputType.number,
                          controller: authcontroller.matchPincodeController,
                          labelColor: KText,
                          obscureText: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          fontSize: kFourteenFont,
                          fontWeight: FontWeight.w500,
                          hintText: "enter pincode",
                          maxLines: 1,
                          readOnly: false,
                          label: "Pin Code",
                          onChanged: (value) {
                            if (value.length == 6) {
                              matchController.userfetchVillages(value);
                            }
                            // matchController.userfetchVillages(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter pin code';
                            }
                            return null;
                          },
                        ),

                        Obx(() {
                          if (matchController.vilages.isEmpty) {
                            return SizedBox(); // Don't show dropdown when list is empty
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                "Village",
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
                                          color: kblack.withOpacity(0.6),
                                          width: 0.5),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kblack.withOpacity(0.6),
                                          width: 0.5),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kblack.withOpacity(0.6),
                                          width: 0.5),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Kform_border_twg, width: 1),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Kform_border_twg, width: 1),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 8),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  hint: Text(
                                    'Select Village',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: KTextgery.withOpacity(0.5),
                                    ),
                                  ),
                                  items: matchController.vilages.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item["area"],
                                      child: Text(
                                        item["area"],
                                        style:
                                            GoogleFonts.poppins(fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select an village';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      matchController.selectd_village.value =
                                          value!;
                                    });

                                    // Find the selected village's full data
                                    var selectedVillage =
                                        matchController.vilages.firstWhere(
                                      (village) => village["area"] == value,
                                      orElse: () => {},
                                    );

                                    // Print the selected village's full map data
                                    print(
                                        "Selected Village Data: $selectedVillage");
                                    var payload = {
                                      "lat": selectedVillage["lat"],
                                      "lng": selectedVillage["lng"],
                                    };
                                    matchController.userfetchTimezone(payload);
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      matchController.selectd_village.value =
                                          value!;
                                      print(
                                          "Selected Area: ${matchController.selectd_village.value}");
                                    });
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),

                        //////////////
                        Obx(
                          () => matchController.postastroDataLoading == true
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
                                  label: "Submit",
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW700,
                                  isLoading: false,
                                  onTap: () {
                                    //           "firstName":
                                    //     dashController.addUserFnameController.text,
                                    // "lastName":
                                    //     dashController.addUserLnameController.text,
                                    // "mobileNumber":
                                    //     dashController.addUserMobileController.text,
                                    // "dateOfBirth":
                                    // "timeOfBirth":
                                    // "pincode":
                                    //     dashController.addUserPincodeController.text,
                                    // "location":
                                    //     dashController.addUserLocationController.text,
                                    // "style": dashController.addUserStyleController.text,
                                    // "language": selectedUserValueLanguage,
                                    // "gender": selectedUserValue,
                                    var payload = {
                                      "partnerName": authcontroller
                                          .matchNameController.text
                                          .trim(),
                                      "partnerGender": selectedUserValue,
                                      "pincode": authcontroller
                                          .matchPincodeController.text
                                          .trim(),
                                      "partnerDateOfBirth":
                                          selectedDateText.value,
                                      "partnerTimeOfBirth":
                                          selectedTimeText.value,
                                      "partnerLanguage": "en",
                                      "partnerSelectArea":
                                          matchController.selectd_village.value,
                                      "partnerLatitude":
                                          "${matchController.timezoneData["lat"]}",
                                      "partnerLongitude":
                                          "${matchController.timezoneData["lon"]}",
                                      "partnerTimezone":
                                          "${matchController.timezoneData["tz_id"]}",
                                      // "category":
                                      //     "${utilityController.selected_cardData["title"]}",
                                      // "key":
                                      //     "${utilityController.selected_cardData["key"]}",
                                      // "value": authcontroller
                                      //     .utilityValueController.text,
// if (key === ) {
//           acc[] = value;
//         } else if(key === ){
//           acc[] = value;
//         } else if(key === ){
//           acc[] = value;
//         } else if(key === ){
//           acc[""] = value;
//         } else {
//           acc[key] = value;
//         }
                                    };
                                    // "partnerDateOfBirth":
                                    //       selectedDateText.value,
                                    //   "partnerTimeOfBirth":
                                    //       selectedTimeText.value,

                                    if (selectedDateText.value ==
                                            "Select Date" ||
                                        selectedTimeText.value ==
                                            "Select Time") {
                                      Fluttertoast.showToast(
                                        msg: "please fill all filds",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: KDarkPink_twg,
                                        textColor: Kwhite,
                                        fontSize: 16.0,
                                      );
                                    } else {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          matchController.partnerDatas.value =
                                              payload;
                                        });
                                        matchController.getAstroData();
                                        // matchController.postAstroData(payload);
                                      }
                                    }

                                    // Get.toNamed(kNavigation);
                                  }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
