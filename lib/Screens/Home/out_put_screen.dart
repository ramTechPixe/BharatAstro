import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class AstroOutput extends StatefulWidget {
  const AstroOutput({super.key});

  @override
  State<AstroOutput> createState() => _AstroOutputState();
}

class _AstroOutputState extends State<AstroOutput> {
  var astroData = Get.arguments;
  // DashboardController dashController = Get.put(DashboardController());
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
              "Astro Data",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/test_night.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(13),
                child: Text(astroData,
                    style: GoogleFonts.poppins(
                        fontSize: kFourteenFont,
                        fontWeight: kFW500,
                        color: Kwhite)),
              ),
            ),
          ],
        ));
  }
}
