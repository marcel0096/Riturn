# RITURN

This is the functional prototype for RITURN, a ride-parcel-pooling service founded during the tech challenge powered by UnternehmerTUM.

The current version of the prototype covers two main functionalities. The first is the possibility for the user to register a return parcel and receive a QR code for it. The second is that the QR codes can be managed and utilized in the users’ personal profiles.

The app was tested using iOS version 17.2. However it is also compatible with lower iOS versions and Android.

## How to run the code

### 1. Option: Run the code in a programming environment with a suitable emulator

1. Set up a programming environment for Flutter as described [here](https://docs.flutter.dev/get-started/install). Make sure to use an iPhone 15 pro simulator for the best user experience.
2. Add your Google Maps API keys (or the ones provided in the technical description document) for iOS (in `ios/Runner/AppDelegate.swift`) and Android (in `android/app/src/Main/AndroidManifest.xml`)
3. Load the required packages by running `flutter pub get`
4. Run the app on the selected Emulator by running `flutter run` 

### 2. Option: Run the app on your iPhone using XCode

1. Open the `Runner.xcworkspace` file in the ios folder of the project.
2. In XCode, select the Runner file and the device connected to the MacBook.
3. Click on the play button in the menu to run the app on the physical device.
4. See [here](https://www.geeksforgeeks.org/how-to-install-flutter-app-on-ios/) for a detailed step-by-step instruction.

## Contact

If you have any questions, feel free to contact me via [this email](marcel.dietl@tum.de).

