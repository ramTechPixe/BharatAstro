import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';
import 'dart:convert';
import 'dart:io';

// class EditProfile extends StatefulWidget {

import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  DashboardController dashController = Get.put(DashboardController());
  String? selectedOption;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  String? selectedUserValueLanguage;
  /////
  String? selectedValue_language;
  String? selectedGenderValue_language;
  var selectDate = "Select Date".obs;
  File? selectedImage;
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
  String base64Image = "";
  bool showimagenullMessage = false;
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

        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        dashController.updateSelectedImage(selectedImage!);

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

  late Uint8List imageBytes;
  @override
  void initState() {
    setState(() {
      dashController.editImageController.text =
          dashController.userDetails["uplaodImage"] ?? "string";
      dashController.editnameController.text =
          dashController.userDetails["userName"] ?? "";
      dashController.editMobileController.text =
          dashController.userDetails["mobileNumber"].toString() ?? "";
      dashController.editLanguageController.text =
          dashController.userDetails["language"] ?? "";
    });
    if (dashController.editImageController.text != "string") {
      setState(() {
        imageBytes = base64Decode(dashController.editImageController.text);
      });
      // Uint8List imageBytes =
      //     base64Decode(dashController.editImageController.text);
    }

    print("object");
    // TODO: implement initState
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kbg_theme_two,
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
              "Edit  Details",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Details",
                        // "Join the journey to unlock the secrets of your stars. Personalize your astrological experience today!",
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: kEighteenFont,
                            fontWeight: kFW400,
                            color: KdarkText)),
                    SizedBox(
                      height: 18.h,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          selectedImage == null
                              ? dashController.editImageController.text ==
                                      "string"
                                  ? Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(300),
                                          child: Image.asset(
                                            "assets/images/no_profile.jpg",
                                            // fit: BoxFit.contain,
                                            height: 100.h,
                                            //  width: 110.w,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    backgroundColor:
                                                        Kbackground,
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Kbackground,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20))),
                                                          height: 100.h,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.h),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  chooseImage(
                                                                      "Gallery");
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Column(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .image_outlined,
                                                                      color:
                                                                          kAstroBgblue,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    Text(
                                                                        'Gallery',
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: GoogleFonts.dmSans(
                                                                            fontSize: 12
                                                                                .sp,
                                                                            fontWeight:
                                                                                kFW700,
                                                                            color:
                                                                                KdarkText)),
                                                                  ],
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  chooseImage(
                                                                      "camera");
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Column(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .camera_alt_outlined,
                                                                      color:
                                                                          kAstroBgblue,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    Text(
                                                                        'camera',
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: GoogleFonts.dmSans(
                                                                            fontSize: 12
                                                                                .sp,
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
                                              },
                                              child: CircleAvatar(
                                                radius: 18.r,
                                                backgroundColor: Kwhite,
                                                child: Icon(Icons.edit,
                                                    color: kAstroBgblue),
                                              ),
                                            ))
                                      ],
                                    )
                                  // Text(
                                  //     "No image selected",
                                  //     style: TextStyle(color: Kwhite),
                                  //   )
                                  : Stack(
                                      children: [
                                        ClipOval(
                                          child: Image.memory(
                                            imageBytes,
                                            height: 125.h,
                                            width: 125.w,
                                            //   fit: BoxFit.cover,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    backgroundColor:
                                                        Kbackground,
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Kbackground,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20))),
                                                          height: 100.h,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.h),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  chooseImage(
                                                                      "Gallery");
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Column(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .image_outlined,
                                                                      color:
                                                                          kAstroBgblue,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    Text(
                                                                        'Gallery',
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: GoogleFonts.dmSans(
                                                                            fontSize: 12
                                                                                .sp,
                                                                            fontWeight:
                                                                                kFW700,
                                                                            color:
                                                                                KdarkText)),
                                                                  ],
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  chooseImage(
                                                                      "camera");
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Column(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .camera_alt_outlined,
                                                                      color:
                                                                          kAstroBgblue,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    Text(
                                                                        'camera',
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: GoogleFonts.dmSans(
                                                                            fontSize: 12
                                                                                .sp,
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
                                              },
                                              child: CircleAvatar(
                                                radius: 18.r,
                                                backgroundColor: Kwhite,
                                                child: Icon(
                                                  Icons.edit,
                                                  color: const Color.fromARGB(
                                                      255, 141, 141, 141),
                                                ),
                                              ),
                                            ))
                                      ],
                                    )
                              : Stack(
                                  children: [
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
                                    Container(
                                      width: 125.w, // Adjust size as needed
                                      height: 125
                                          .h, // Must be equal to width for a perfect circle
                                      decoration: BoxDecoration(
                                        shape: BoxShape
                                            .circle, // Makes it fully circular
                                        color: Kwhite,
                                        border: Border.all(
                                          color: Klight_grey_twg,
                                          width: 1,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.file(
                                          selectedImage!,
                                          //   width: dou.w,
                                          height: 125.h,
                                          //   fit: BoxFit.cover,
                                          fit: BoxFit.cover,
                                          // height: 100.h,
                                          // width: 100.w,
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20)),
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
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20))),
                                                      height: 100.h,
                                                      padding: EdgeInsets.only(
                                                          top: 20.h),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              chooseImage(
                                                                  "Gallery");
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .image_outlined,
                                                                  color:
                                                                      kAstroBgblue,
                                                                ),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                Text('Gallery',
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: GoogleFonts.dmSans(
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontWeight:
                                                                            kFW700,
                                                                        color:
                                                                            KdarkText)),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              chooseImage(
                                                                  "camera");
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .camera_alt_outlined,
                                                                  color:
                                                                      kAstroBgblue,
                                                                ),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                Text('camera',
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: GoogleFonts.dmSans(
                                                                        fontSize: 12
                                                                            .sp,
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
                                          },
                                          child: CircleAvatar(
                                            radius: 18.r,
                                            backgroundColor: Kwhite,
                                            child: Icon(
                                              Icons.edit,
                                              color: kAstroBgblue,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                          SizedBox(
                            height: 20.h,
                          ),
                          // selectedImage == null
                          //     ?
                          //     CustomButton(
                          //         // margin: EdgeInsets.only(top: 36.h),
                          //         borderRadius: BorderRadius.circular(5.r),
                          //         Color: kAstroBgblue,
                          //         textColor: Kwhite,
                          //         height: 45,
                          //         width: double.infinity,
                          //         label: "Browse image",
                          //         fontSize: kSixteenFont,
                          //         fontWeight: kFW600,
                          //         isLoading: false,
                          //         onTap: () {
                          //           showModalBottomSheet(
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.only(
                          //                     topRight: Radius.circular(20),
                          //                     topLeft: Radius.circular(20)),
                          //               ),
                          //               backgroundColor: Kbackground,
                          //               context: context,
                          //               builder: (context) {
                          //                 return Container(
                          //                   child: Container(
                          //                     decoration: BoxDecoration(
                          //                         color: Kbackground,
                          //                         borderRadius: BorderRadius.only(
                          //                             topLeft:
                          //                                 Radius.circular(20),
                          //                             topRight:
                          //                                 Radius.circular(20))),
                          //                     height: 100.h,
                          //                     padding: EdgeInsets.only(top: 20.h),
                          //                     child: Row(
                          //                       crossAxisAlignment:
                          //                           CrossAxisAlignment.center,
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment.spaceAround,
                          //                       children: [
                          //                         GestureDetector(
                          //                           onTap: () {
                          //                             chooseImage("Gallery");
                          //                             Navigator.pop(context);
                          //                           },
                          //                           child: Column(
                          //                             children: [
                          //                               Icon(
                          //                                 Icons.image_outlined,
                          //                                 color: kAstroBgblue,
                          //                               ),
                          //                               SizedBox(
                          //                                 height: 5.h,
                          //                               ),
                          //                               Text('Gallery',
                          //                                   maxLines: 2,
                          //                                   overflow: TextOverflow
                          //                                       .ellipsis,
                          //                                   style: GoogleFonts
                          //                                       .dmSans(
                          //                                           fontSize:
                          //                                               12.sp,
                          //                                           fontWeight:
                          //                                               kFW700,
                          //                                           color:
                          //                                               KdarkText)),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                         GestureDetector(
                          //                           onTap: () {
                          //                             chooseImage("camera");
                          //                             Navigator.pop(context);
                          //                           },
                          //                           child: Column(
                          //                             children: [
                          //                               Icon(
                          //                                 Icons
                          //                                     .camera_alt_outlined,
                          //                                 color: kAstroBgblue,
                          //                               ),
                          //                               SizedBox(
                          //                                 height: 5.h,
                          //                               ),
                          //                               Text('camera',
                          //                                   maxLines: 2,
                          //                                   overflow: TextOverflow
                          //                                       .ellipsis,
                          //                                   style: GoogleFonts
                          //                                       .dmSans(
                          //                                           fontSize:
                          //                                               12.sp,
                          //                                           fontWeight:
                          //                                               kFW700,
                          //                                           color:
                          //                                               KdarkText)),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 );
                          //               });
                          //         })
                          //     : Row(
                          //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           // selectedImage == null
                          //           //     ? SizedBox()
                          //           //     :
                          //           InkWell(
                          //             onTap: () {
                          //               setState(() {
                          //                 selectedImage = null;
                          //               });
                          //               // dashboardController.updateSelectedImage(null);

                          //               setState(() {});
                          //             },
                          //             child: Container(
                          //               height: 45,
                          //               width: 110,
                          //               margin: EdgeInsets.only(right: 10),
                          //               padding: EdgeInsets.all(8),
                          //               decoration: BoxDecoration(
                          //                 border: Border.all(
                          //                     color: Klight_grey_twg, width: 1),
                          //                 color: Kwhite,
                          //                 borderRadius: BorderRadius.only(
                          //                     topLeft: Radius.circular(5),
                          //                     topRight: Radius.circular(5),
                          //                     bottomLeft: Radius.circular(5),
                          //                     bottomRight: Radius.circular(5)),
                          //               ),
                          //               child: Row(
                          //                 children: [
                          //                   Icon(Icons.delete),
                          //                   SizedBox(
                          //                     width: 5.w,
                          //                   ),
                          //                   Text(
                          //                     "Delete",
                          //                     style: GoogleFonts.dmSans(
                          //                         color: Klight_grey_twg,
                          //                         fontSize: kSixteenFont,
                          //                         fontWeight: kFW600),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //           CustomButton(
                          //               // margin: EdgeInsets.only(top: 36.h),
                          //               borderRadius: BorderRadius.circular(5.r),
                          //               Color: kAstroBgblue,
                          //               textColor: Kwhite,
                          //               height: 45,
                          //               width: 155.w,
                          //               label: "Browse image",
                          //               fontSize: kSixteenFont,
                          //               fontWeight: kFW600,
                          //               isLoading: false,
                          //               onTap: () {
                          //                 showModalBottomSheet(
                          //                     shape: RoundedRectangleBorder(
                          //                       borderRadius: BorderRadius.only(
                          //                           topRight: Radius.circular(20),
                          //                           topLeft: Radius.circular(20)),
                          //                     ),
                          //                     backgroundColor: Kbackground,
                          //                     context: context,
                          //                     builder: (context) {
                          //                       return Container(
                          //                         child: Container(
                          //                           decoration: BoxDecoration(
                          //                               color: Kbackground,
                          //                               borderRadius:
                          //                                   BorderRadius.only(
                          //                                       topLeft: Radius
                          //                                           .circular(20),
                          //                                       topRight: Radius
                          //                                           .circular(
                          //                                               20))),
                          //                           height: 100.h,
                          //                           padding: EdgeInsets.only(
                          //                               top: 20.h),
                          //                           child: Row(
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .center,
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .spaceAround,
                          //                             children: [
                          //                               GestureDetector(
                          //                                 onTap: () {
                          //                                   chooseImage(
                          //                                       "Gallery");
                          //                                   Navigator.pop(
                          //                                       context);
                          //                                 },
                          //                                 child: Column(
                          //                                   children: [
                          //                                     Icon(
                          //                                       Icons
                          //                                           .image_outlined,
                          //                                       color: Kblue_twg,
                          //                                     ),
                          //                                     SizedBox(
                          //                                       height: 5.h,
                          //                                     ),
                          //                                     Text('Gallery',
                          //                                         maxLines: 2,
                          //                                         overflow:
                          //                                             TextOverflow
                          //                                                 .ellipsis,
                          //                                         style: GoogleFonts.dmSans(
                          //                                             fontSize:
                          //                                                 12.sp,
                          //                                             fontWeight:
                          //                                                 kFW700,
                          //                                             color:
                          //                                                 KdarkText)),
                          //                                   ],
                          //                                 ),
                          //                               ),
                          //                               GestureDetector(
                          //                                 onTap: () {
                          //                                   chooseImage("camera");
                          //                                   Navigator.pop(
                          //                                       context);
                          //                                 },
                          //                                 child: Column(
                          //                                   children: [
                          //                                     Icon(
                          //                                       Icons
                          //                                           .camera_alt_outlined,
                          //                                       color: Kblue_twg,
                          //                                     ),
                          //                                     SizedBox(
                          //                                       height: 5.h,
                          //                                     ),
                          //                                     Text('camera',
                          //                                         maxLines: 2,
                          //                                         overflow:
                          //                                             TextOverflow
                          //                                                 .ellipsis,
                          //                                         style: GoogleFonts.dmSans(
                          //                                             fontSize:
                          //                                                 12.sp,
                          //                                             fontWeight:
                          //                                                 kFW700,
                          //                                             color:
                          //                                                 KdarkText)),
                          //                                   ],
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       );
                          //                     });
                          //               }),
                          //         ],
                          //       ),
                          // SizedBox(
                          //   height: 35.h,
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomFormFields(
                      ontap: () {
                        //  Get.toNamed(kSearchPlaces); // kForgotPassword
                      },
                      controller: dashController.editnameController,
                      enabled: true,
                      labelColor: KText,
                      obscureText: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      fontSize: kFourteenFont,
                      fontWeight: FontWeight.w500,
                      hintText: "Enter name",
                      maxLines: 1,
                      label: "Full name",
                      readOnly: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    // CustomFormFields(
                    //   ontap: () {
                    //     //  Get.toNamed(kSearchPlaces); // kForgotPassword
                    //   },
                    //   //     controller: authcontroller.regrEmailSignInController,
                    //   enabled: true,
                    //   labelColor: KText,
                    //   obscureText: false,
                    //   contentPadding:
                    //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    //   fontSize: kFourteenFont,
                    //   fontWeight: FontWeight.w500,
                    //   hintText: "Email",
                    //   maxLines: 1,
                    //   readOnly: false,
                    //   label: "Email",
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter Email';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomFormFields(
                      ontap: () {
                        //  Get.toNamed(kSearchPlaces); // kForgotPassword
                      },
                      controller: dashController.editMobileController,
                      enabled: true,
                      labelColor: KText,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      fontSize: kFourteenFont,
                      fontWeight: FontWeight.w500,
                      hintText: "Enter mobile number",
                      maxLines: 1,
                      readOnly: false,
                      label: "Mobile Number",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter mobile number';
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
                                  selectedUserValueLanguage = value.toString();
                                  dashController.editLanguageController.text =
                                      value.toString();
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
                          // CustomFormFields(
                          //   ontap: () {
                          //     //  Get.toNamed(kSearchPlaces); // kForgotPassword
                          //   },
                          //   controller: dashController.editLanguageController,
                          //   enabled: true,
                          //   labelColor: KText,
                          //   obscureText: false,
                          //   contentPadding:
                          //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          //   fontSize: kFourteenFont,
                          //   fontWeight: FontWeight.w500,
                          //   hintText: "Enter languge",
                          //   maxLines: 1,
                          //   readOnly: false,
                          //   label: "Language",
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return 'Please enter language';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          //////////////
                          Obx(
                            () => dashController.editAstroLoading == true
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
                                    label: "Edit Profile",
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW700,
                                    isLoading: false,
                                    onTap: () {
                                      // var payload = {
                                      //   "user_email": authcontroller
                                      //       .UserEmailSignInController.text,
                                      //   "user_password": authcontroller
                                      //       .UserEmailPasswordController.text
                                      // };

                                      var payload = {
                                        // "uploadImage":
                                        //     dashController.editImageController.text,
                                        "userName": dashController
                                            .editnameController.text,
                                        "mobileNumber": dashController
                                            .editMobileController.text,
                                        "language": dashController
                                            .editLanguageController.text
                                      };
                                      // if (_formKey.currentState!.validate()) {
                                      //   authcontroller.userSignIn(payload);
                                      // }

                                      dashController.editAstro(payload);
                                      setState(() {
                                        selectedImage = null;
                                        dashController.editnameController
                                            .clear();
                                        dashController.editMobileController
                                            .clear();
                                        dashController.editLanguageController
                                            .clear();
                                      });
                                      // Get.toNamed(kNavigation);
                                    }),
                          ),
                          // CustomButton(
                          //     margin: EdgeInsets.only(top: 36.h),
                          //     borderRadius: BorderRadius.circular(8.r),
                          //     Color: Kform_border_twg,
                          //     textColor: Kwhite,
                          //     height: 40,
                          //     width: double.infinity,
                          //     label: "Update Details",
                          //     fontSize: kSixteenFont,
                          //     fontWeight: kFW700,
                          //     isLoading: false,
                          //     onTap: () {}),
                        ]),
                  ])),
        ));
  }
}
