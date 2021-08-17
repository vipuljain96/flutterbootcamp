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
GMSServices.provideAPIKey("AIzaSyAD2QFT3Rm_1q9IyG_xa9W3e0ZHJGv3_0s")
return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
}
