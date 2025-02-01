import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class PurchaseCard extends StatefulWidget {
  const PurchaseCard({super.key});

  @override
  State<PurchaseCard> createState() => _PurchaseCardState();
}

class _PurchaseCardState extends State<PurchaseCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //elevation: 3,
          backgroundColor: kAstroBgblue,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Kwhite,
              size: 23.sp,
            ),
          ),
          title: Text(
            "Astro Card",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      backgroundColor: kAstroBgblue,
      body: Container(
        margin:
            EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 200.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    "assets/images/Card Image.png",
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 200.w,
              child: Text("GET YOUR DAILY HOROSCOPES WITH JUST A TAP",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.dmSerifDisplay(
                      height: 1.8,
                      fontSize: kEighteenFont,
                      fontWeight: kFW400,
                      color: Kwhite)),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: kAstro_yellow, width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 12,
                          backgroundColor: kAstro_yellow,
                          child: Icon(
                            Icons.done,
                            color: Kwhite,
                            size: 18.sp,
                          )),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text("Premium Card",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: kEighteenFont,
                              fontWeight: kFW400,
                              color: Kwhite)),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 12,
                          backgroundColor: kAstro_yellow,
                          child: Icon(
                            Icons.done,
                            color: Kwhite,
                            size: 18.sp,
                          )),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text("NFC",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: kEighteenFont,
                              fontWeight: kFW400,
                              color: Kwhite)),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 12,
                          backgroundColor: kAstro_yellow,
                          child: Icon(
                            Icons.done,
                            color: Kwhite,
                            size: 18.sp,
                          )),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text("Great Design",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: kEighteenFont,
                              fontWeight: kFW400,
                              color: Kwhite)),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 12,
                          backgroundColor: kAstro_yellow,
                          child: Icon(
                            Icons.done,
                            color: Kwhite,
                            size: 18.sp,
                          )),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text("Lifetime validity",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: kEighteenFont,
                              fontWeight: kFW400,
                              color: Kwhite)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          margin: EdgeInsets.only(top: 20.h),
                          borderRadius: BorderRadius.circular(8.r),
                          Color: kAstro_yellow,
                          textColor: KdarkText,
                          height: 32,
                          width: 150.w,
                          label: "Purchase",
                          fontSize: kFourteenFont,
                          fontWeight: kFW500,
                          isLoading: false,
                          onTap: () {
                            Get.toNamed(kCardPricing);
                            // Get.toNamed(kShippingAddress);
                          }),
                      CustomButtonOutlined(
                          margin: EdgeInsets.only(top: 20.h),
                          borderRadius: BorderRadius.circular(8.r),
                          borderColor: Kwhite,
                          textColor: Kwhite,
                          height: 32,
                          width: 150.w,
                          label: "Back",
                          fontSize: kFourteenFont,
                          fontWeight: kFW500,
                          isLoading: false,
                          onTap: () {
                            Get.back();
                          })
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
