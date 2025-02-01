import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';
import 'package:intl/intl.dart';

class AddUserDetails extends StatefulWidget {
  const AddUserDetails({super.key});

  @override
  State<AddUserDetails> createState() => _AddUserDetailsState();
}

class _AddUserDetailsState extends State<AddUserDetails> {
  String? selectedValue;
  String? selectedGenderValue;
  var selectDate = "Select Date".obs;
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  final List<String> CompanyList = ['male', 'female', 'others'];
  AuthController authcontroller = Get.put(AuthController());
  String? selectedUserValue;
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
          margin:
              EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                // controller: authcontroller.regrnameInController,
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
                //   controller: authcontroller.regrEmailSignInController,
                enabled: true,
                keyboardType: TextInputType.phone,
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
                keyboardType: TextInputType.phone,
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
                hintText: DateFormat.yMMMd().format(selectedDate) ==
                        DateFormat.yMMMd().format(DateTime.now())
                    ? "Select Date & Time"
                    : DateFormat('dd/MM/yyyy hh:mm a').format(selectedDate),
                ontap: () async {
                  // Step 1: Show Date Picker
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(1924, 8),
                    lastDate: DateTime(2025, 8),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary:
                                Kform_border_twg, // Primary color for date picker
                            onSurface:
                                Colors.black, // Text color for unselected items
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    // Step 2: Show Time Picker
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(selectedDate),
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
                      // Step 3: Combine Date and Time
                      setState(() {
                        selectedDate = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                        choosenDate = selectedDate; // Store the selected date
                        selectDate.value = DateFormat('MM/dd/yyyy hh:mm a')
                            .format(selectedDate);
                      });
                    }
                  }
                },
                enabled: true,
                readOnly: true,
                labelColor: KText,
                onChanged: (value) {
                  setState(() {});
                },
                obscureText: false,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                fontSize: kFourteenFont,
                // prefix: Image.asset(
                //   "assets/images/black_clock.png",
                //   height: 10.h,
                //   width: 10.w,
                // ),
                fontWeight: FontWeight.w500,
                hintColor: DateFormat.yMMMd().format(selectedDate) ==
                        DateFormat.yMMMd().format(DateTime.now())
                    ? KTextgery.withOpacity(0.5)
                    : KdarkText,
                maxLines: 1,
                label: "Date of birth",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Schedule';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
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
                    margin: EdgeInsets.only(top: 10.h),
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
                      items: CompanyList.map((item) => DropdownMenuItem<String>(
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
              CustomFormFields(
                ontap: () {},
                enabled: true,
                labelColor: KText,
                obscureText: false,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                fontSize: kFourteenFont,
                fontWeight: FontWeight.w500,
                hintText: "enter village",
                maxLines: 1,
                readOnly: false,
                label: "Village",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter village';
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
                labelColor: KText,
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
              CustomFormFields(
                ontap: () {},
                enabled: true,
                labelColor: KText,
                obscureText: false,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                fontSize: kFourteenFont,
                fontWeight: FontWeight.w500,
                hintText: "enter state",
                maxLines: 1,
                readOnly: false,
                label: "State",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter state';
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
                labelColor: KText,
                obscureText: false,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                fontSize: kFourteenFont,
                fontWeight: FontWeight.w500,
                hintText: "enter country",
                maxLines: 1,
                readOnly: false,
                label: "Country",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter country';
                  }
                  return null;
                },
              ),
              CustomButton(
                  margin: EdgeInsets.only(top: 36.h),
                  borderRadius: BorderRadius.circular(8.r),
                  Color: Kform_border_twg,
                  textColor: Kwhite,
                  height: 40,
                  width: double.infinity,
                  label: "Save",
                  fontSize: kSixteenFont,
                  fontWeight: kFW700,
                  isLoading: false,
                  onTap: () {
                    Get.toNamed(kNavigation);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
