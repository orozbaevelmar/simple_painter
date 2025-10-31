import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        let shareChannel = FlutterMethodChannel(name: "com.example.app/share_image", binaryMessenger: controller.binaryMessenger)

        shareChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            
            if call.method == "shareImage" {
                if let args = call.arguments as? [String: Any],
                   let path = args["path"] as? String {
                    
                    self?.shareImageNative(path: path, controller: controller)
                    result(nil) 
                } else {
                    result(FlutterError(code: "UNAVAILABLE", message: "Image path not available or invalid arguments.", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        })

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func shareImageNative(path: String, controller: UIViewController) {
        let fileUrl = URL(fileURLWithPath: path)
        
        let activityViewController = UIActivityViewController(activityItems: [fileUrl], applicationActivities: nil)
        
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = controller.view
            popoverController.sourceRect = CGRect(x: controller.view.bounds.width / 2, y: controller.view.bounds.height / 2, width: 0, height: 0)
            popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        }
        
        controller.present(activityViewController, animated: true, completion: nil)
    }
}