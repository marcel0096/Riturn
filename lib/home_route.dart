import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'profile_dialog.dart';
import 'qr_code_provider.dart';

class HomeRoute extends StatelessWidget {
  //HomeRoute({Key? key}) : super(key: key);

  //final List<QRCodeData> generatedQRCodes;

  // hardcoded for now, will change in the future based on login
  final String username = 'Test User';
  final String email = 'test@user.com';

  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variable for screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Provider of the QR codes
    QRCodeProvider qrCodeProvider =
        Provider.of<QRCodeProvider>(context, listen: false);

    return Scaffold(
      // set background color for home screen
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      // add title bar
      appBar: AppBar(
        title: const Text('RITURN'),
        backgroundColor: const Color.fromARGB(255, 78, 109, 87),
        actions: [
          GestureDetector(
            onTap: () {
              // Show profile dialog
              ProfileDialog.show(context, qrCodeProvider);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.menu_rounded,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 1 / 7 * screenHeight,
                width: screenWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // Text and icons
                    children: [
                      showReturnButton(context),
                      showRideButton(context),
                      showFAQButton(context),
                    ],
                  ),
                ),
              ),
            ),

            // This is the "How to use RITURN" header
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: screenWidth,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 137, 155, 142),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'How to use RITURN?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // This is the explanation part
            explainRide(context),
            explainReturn(context),

            // Logo at the bottom
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image(
                image: AssetImage('assets/logo_no_background.png'),
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showFAQButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(children: [
        // Text
        const Text('FAQ',
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
        // Icon with surrounding
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            height: 80,
            width: 80,
            decoration: const ShapeDecoration(
              color: Color.fromARGB(255, 65, 81, 95),
              shape: CircleBorder(),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.question_mark),
                iconSize: 50,
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/faq');
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget showRideButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(children: [
        // Text
        const Text('Ride',
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
        // Icon with surrounding
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            height: 80,
            width: 80,
            decoration: const ShapeDecoration(
              color: Color.fromARGB(255, 87, 129, 99),
              shape: CircleBorder(),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.directions_bus),
                iconSize: 50,
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/ride');
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget showReturnButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          // Text
          const Text('Return',
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          // Icon with surrounding
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              height: 80,
              width: 80,
              decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 87, 129, 99),
                shape: CircleBorder(),
              ),
              child: Center(
                child: IconButton(
                  icon: Image.asset(
                    'assets/parcel.png',
                    width: 60,
                    height: 60,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/return');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget explainRide(BuildContext context) {
    // Variable for screen width
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    // This is the whole explanation part
    return Column(
      // columns for 1. text and 2. text
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Column(
          // column inside 1. (text and icons)
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column(
                // column for two text lines
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '1. Find a trip in your interest',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text('Even possible for customized pick-up!'),
                ],
              ),
            ),
          ],
        ),
        // column for icons 1.
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Step 1
                Column(
                  children: [
                    // Icon with surrounding
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 89, 88, 88),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.directions_bus,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Text
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        width: screenWidth / 4 - 10,
                        child: const Text(
                          'Step 1 - Start with bus icon',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Step 2
                Column(
                  children: [
                    // Icon with surrounding
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 89, 88, 88),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Text
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        width: screenWidth / 4 - 10,
                        child: const Text(
                          'Step 2 - Search trips',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Step optional
                Column(
                  children: [
                    // Icon with surrounding
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 89, 88, 88),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.near_me_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Text
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        width: screenWidth / 4 - 10,
                        child: const Text(
                          '(Optional) Customized',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Step 3
                Column(
                  children: [
                    // Icon with surrounding
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 89, 88, 88),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.location_on,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Text
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        width: screenWidth / 4 - 10,
                        child: const Text(
                          'Step 3 - Go to pick-up spot',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // column for 2. text
        const Column(
          // column inside 2.
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Column(
                // column for two text lines
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '2. Return your parcels during bus trips',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text('With every RITURN bus trips you can find!'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget explainReturn(BuildContext context) {
    // Variable for screen width
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    // column for icons 2.
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Step 1
            Column(
              children: [
                // Icon with surrounding
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 89, 88, 88),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.local_shipping,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Text
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    width: screenWidth / 4 - 10,
                    child: const Text(
                      'Step 1 - Start with the parcel icon',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Step 2
            Column(
              children: [
                // Icon with surrounding
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 89, 88, 88),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_box_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Text
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    width: screenWidth / 4 - 10,
                    child: const Text(
                      'Step 2 - Select the size of your parcel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Step 3
            Column(
              children: [
                // Icon with surrounding
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 89, 88, 88),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.qr_code_2_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Text
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    width: screenWidth / 4 - 10,
                    child: const Text(
                      'Step 3 - Generate your QR code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Step 4
            Column(
              children: [
                // Icon with surrounding
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 89, 88, 88),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.qr_code_scanner_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Text
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    width: screenWidth / 4 - 10,
                    child: const Text(
                      'Step 4 - Scan your QR code in the bus',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
