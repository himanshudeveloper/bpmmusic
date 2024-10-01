import Flutter
import UIKit
import Firebase
import AVFoundation
import flutter_background_service_ios // add this

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

   let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
 

    SwiftFlutterBackgroundServicePlugin.taskIdentifier = "your.custom.task.identifier"


     FirebaseApp.configure() //add this before the code below
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func applicationDidFinishLaunching(_ application: UIApplication) {
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
    } catch {
        print("Failed to set up AVAudioSession")
    }
    super.applicationDidFinishLaunching(application)
}
}
