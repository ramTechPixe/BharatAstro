import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({super.key});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  DashboardController dashController = Get.put(DashboardController());
  @override
  void initState() {
    if (dashController.userDetails["planType"] != null &&
        dashController.userDetails != null) {
      if (dashController.userDetails["planType"] == "Web") {
        dashController.userOrdersHistoryWeb();
      } else {
        dashController.userOrdersHistory();
      }
    }

    //
    // TODO: implement initState
    super.initState();
  }

  Future<void> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    ///////////////////////////////////////////////////////
    if (dashController.userDetails["planType"] != null &&
        dashController.userDetails != null) {
      if (dashController.userDetails["planType"] == "Web") {
        dashController.userOrdersHistoryWeb();
      } else {
        dashController.userOrdersHistory();
      }
    }
    ///////////////////////////
  }

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
        body: RefreshIndicator(
            onRefresh: refreshData,
            displacement: 100.h,
            child: SingleChildScrollView(
                physics:
                    AlwaysScrollableScrollPhysics(), // Enables scrolling even when content is small
                child: Obx(
                  () => Container(
                    margin: EdgeInsets.all(16),
                    child: dashController.ordersLoading == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: kAstroBgblue,
                            ),
                          )
                        : dashController.ordersList.isEmpty ||
                                dashController.ordersList == null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 200.h,
                                    ),
                                    Image.asset(
                                      "assets/images/no_order.png",
                                      height: 200.h,
                                      width: 200.w,
                                      fit: BoxFit.cover,
                                      // height: double.infinity,
                                      // width: double.infinity,
                                    ),
                                    //   c:\Users\risha\Downloads\no_order.png
                                    Text(
                                      "No Orders",
                                      style: GoogleFonts.poppins(
                                          fontSize: kSixteenFont,
                                          color: KdarkText,
                                          fontWeight: kFW500),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                // reverse: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: dashController.ordersList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        dashController.orderDetails.value =
                                            dashController.ordersList[index];
                                        print("object");
                                      });
                                      Get.toNamed(kOrderView);
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(bottom: 10.h),
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
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    dashController.ordersList[
                                                                    index]
                                                                ["order_id"] ==
                                                            null
                                                        ? "OrderId: "
                                                        : "OrderId:${dashController.ordersList[index]["order_id"]}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 11.sp,
                                                        fontWeight: kFW400,
                                                        color: kblack)),
                                                Text(
                                                    dashController.ordersList[
                                                                    index]
                                                                ["orderDate"] ==
                                                            null
                                                        ? "Date: "
                                                        : "Date: ${dashController.ordersList[index]["orderDate"]}",
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
                                            Text(
                                                dashController.ordersList[index]
                                                            ["planType"] ==
                                                        null
                                                    ? "Plan Type: "
                                                    : "Plan Type: ${dashController.ordersList[index]["planType"]}",
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
                ))));
  }
}
