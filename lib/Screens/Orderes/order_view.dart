import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  DashboardController dashController = Get.put(DashboardController());
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
              "Order Details",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.all(16),
                //  width: 300,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kblack.withOpacity(0.1),
                      blurRadius: 2.r,
                      offset: Offset(0, 1),
                      spreadRadius: 2.r,
                    )
                  ],
                  color: Kwhite,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            dashController.orderDetails["order_id"] == null
                                ? "OrderId: "
                                : "OrderId:${dashController.orderDetails["order_id"]}",
                            //"OrderId:#738289511",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: kFW400,
                                color: kblack)),
                        Text(
                            dashController.orderDetails["orderDate"] == null
                                ? "Date: "
                                : "Date: ${dashController.orderDetails["orderDate"]}",
                            //"Date: 2025-01-23 14:48",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: kFW400,
                                color: kblack)),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text("Plan Type: ",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: kFW400,
                                color: kblack)),
                        Text(
                            dashController.orderDetails["planType"] == null
                                ? ""
                                : " ${dashController.orderDetails["planType"]}",

                            // " Astro Card",
                            style: GoogleFonts.poppins(
                                fontSize: kFourteenFont,
                                fontWeight: kFW500,
                                color: kblack)),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Image.asset(
                      "assets/images/Card Image.png",
                      fit: BoxFit.contain,
                      height: 200.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Delivery Status :",
                        style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            fontWeight: kFW400,
                            color: kblack)),
                    SizedBox(
                      height: 15.h,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: Divider(
                            color: kblack,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: kAstroBgblue,
                              radius: 12,
                            ),
                            CircleAvatar(
                              backgroundColor: Kbg_theme_two,
                              radius: 12,
                            ),
                            CircleAvatar(
                              backgroundColor: Kbg_theme_two,
                              radius: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Processing",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: kFW400,
                                color: kblack)),
                        Text("shipped",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: kFW400,
                                color: kblack)),
                        Text("Delivered",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: kFW400,
                                color: kblack)),
                      ],
                    ),
                  ],
                )),
            Container(

                //  width: 300,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kblack.withOpacity(0.1),
                      blurRadius: 2.r,
                      offset: Offset(0, 1),
                      spreadRadius: 2.r,
                    )
                  ],
                  color: kAstro_yellow,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text("Tracking details sent to your email.",
                        style: GoogleFonts.poppins(
                            fontSize: kFourteenFont,
                            fontWeight: kFW400,
                            color: kblack)),
                  ],
                ))
          ],
        ));
  }
}
