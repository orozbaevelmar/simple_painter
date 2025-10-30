import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    if let controller = window?.rootViewController as? FlutterViewController {
      let channel = FlutterMethodChannel(name: "com.example/native_share", binaryMessenger: controller.binaryMessenger)
      channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        if call.method == "shareFile",
           let args = call.arguments as? [String: Any],
           let path = args["path"] as? String {
          let text = args["text"] as? String ?? ""
          self.shareFile(path: path, text: text, controller: controller)
          result(nil)
        } else {
          result(FlutterMethodNotImplemented)
        }
      }
    } else {
      print("Warning: rootViewController is nil at didFinishLaunching.")
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func shareFile(path: String, text: String, controller: UIViewController) {
    let url = URL(fileURLWithPath: path)
    var items: [Any] = [url]
    if !text.isEmpty { items.append(text) }
    let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
    if let pop = activityVC.popoverPresentationController {
      pop.sourceView = controller.view
      pop.sourceRect = CGRect(x: controller.view.bounds.midX, y: controller.view.bounds.midY, width: 0, height: 0)
      pop.permittedArrowDirections = []
    }
    controller.present(activityVC, animated: true, completion: nil)
  }
}
