import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class Utility_form extends StatefulWidget {
  const Utility_form({super.key});

  @override
  State<Utility_form> createState() => _Utility_formState();
}

class _Utility_formState extends State<Utility_form> {
  AuthController authcontroller = Get.put(AuthController());
  UtiltyController utilityController = Get.put(UtiltyController());
  final _formKey = GlobalKey<FormState>();
  String? selectedOption;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;

  @override
  void initState() {
    super.initState();
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
              "",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  top: 16.h,
                  //top: MediaQuery.of(context).size.height / 4,
                  left: 16.w,
                  right: 16.w,
                  bottom: 16.w),

              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(
                      "assets/images/astro_bg.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                  color: Kwhite),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    // autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3.5,
                        ),
                        Text(utilityController.selected_cardData["title"],
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
                          controller: authcontroller.utilityValueController,
                          enabled: true,
                          labelColor: KText,
                          obscureText: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          fontSize: kFourteenFont,
                          fontWeight: FontWeight.w500,
                          hintText:
                              "Enter ${utilityController.selected_cardData["key"]}",
                          maxLines: 1,
                          readOnly: false,
                          label:
                              "${utilityController.selected_cardData["key"]}",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        //////////////
                        Obx(
                          () => utilityController.postastroDataLoading == true
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
                                    var payload = {
//                                       Gem
// :
// "hjgj"
                                      "cardId": utilityController
                                          .selected_cardData["id"],
                                      "language": "en"
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
                                    if (utilityController
                                            .selected_cardData["title"] ==
                                        "Radical Number Details")
                                      payload['Radical_number'] = authcontroller
                                          .utilityValueController.text
                                          .trim();
                                    if (utilityController
                                            .selected_cardData["title"] ==
                                        "Gem Details")
                                      payload['Gem'] = authcontroller
                                          .utilityValueController.text
                                          .trim();
                                    if (utilityController
                                            .selected_cardData["title"] ==
                                        "Geo Search")
                                      payload['City'] = authcontroller
                                          .utilityValueController.text
                                          .trim();
                                    if (utilityController
                                            .selected_cardData["title"] ==
                                        "Nakshatra Vastu Details")
                                      payload['Nakshatra'] = authcontroller
                                          .utilityValueController.text
                                          .trim();

                                    if (_formKey.currentState!.validate()) {
                                      utilityController.postAstroData(payload);
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
