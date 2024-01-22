import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Add the Google Maps API key here
    GMSServices.provideAPIKey("Put API key from technical description document here")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
