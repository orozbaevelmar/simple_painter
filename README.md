# simple_painter

A new Flutter project.

## Getting Started


ios Podfile
after deleting this:
pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '12.4.0'
in TErminal 
cd ios
rm -rf Pods Podfile.lock
pod repo update
pod install --verbose
cd ..
flutter clean
flutter pub get
flutter run