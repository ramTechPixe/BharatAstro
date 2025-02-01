import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({super.key});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kbg_theme_two,
        appBar: AppBar(
            backgroundColor: KbluethemeThick,
            automaticallyImplyLeading: false,
            titleSpacing: 20.w,
            // leading: InkWell(
            //   onTap: () {
            //     Get.back();
            //   },
            //   child: Icon(
            //     Icons.arrow_back_ios,
            //     color: Kwhite,
            //     size: 22.sp,
            //   ),
            // ),
            title: Text(
              "Orders",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                // reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(kOrderView);
                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
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
                                Text("OrderId:#738289511",
                                    style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                        fontWeight: kFW400,
                                        color: kblack)),
                                Text("Date: 2025-01-23 14:48",
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
                            Text("Item:",
                                style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    fontWeight: kFW400,
                                    color: kblack)),
                            SizedBox(
                              height: 8.h,
                            ),
                            Image.asset(
                              "assets/images/Card Image.png",
                              fit: BoxFit.contain,
                              height: 200.h,
                            ),
                          ],
                        )),
                  );
                }),
          ),
        ));
  }
}
