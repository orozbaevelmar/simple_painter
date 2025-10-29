// import 'package:flutter/cupertino.dart';
// import 'package:jashyl_bonus_flutter/app/data/authentication/models/token_model.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/authentication/screens/authentication_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/authentication/screens/cities/screens/choose_city_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/authentication/screens/chose_language/screens/choose_language_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/authentication/screens/forgot_password/screens/forgot_password_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/authentication/screens/login_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/authentication/screens/password_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/authentication/screens/registration_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/authentication/screens/verification_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/bonus/screens/exchange_bonuses_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/bottom_nav_bar/screens/bottom_nav_bar_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/history/screens/history_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/bonus/screens/bonuses_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/home/screens/home_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/notifications/screens/notifications_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/map/screens/map_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/qr/screens/qr_scanner_service.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/qr/screens/qr_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/qr/screens/result.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/qr/screens/thank_you.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/settings/screens/about_detail_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/settings/screens/about_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/settings/screens/account_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/settings/screens/my_coupons_screens.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/settings/screens/rating_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/settings/screens/settings_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/settings/screens/support_screen.dart';
// import 'package:jashyl_bonus_flutter/app/presentation/splash/splash_loading_screen.dart';
// import 'package:jashyl_bonus_flutter/core/enums/fetch_status.dart';

// class AppRouters {
//   static Map<String, WidgetBuilder> get routes =>
//       {SplashLoadingScreen.routeName: (_) => const SplashLoadingScreen(status: FetchStatus.loading)};

//   static Route<dynamic>? onGenerateRoute(RouteSettings settings, TokenModel? token) {
//     Widget page;

//     if (settings.name == SplashLoadingScreen.routeName) {
//       page = token != null ? BottomNavBarScreen() : const AuthenticationScreen();
//     } else {
//       switch (settings.name) {
//         case AuthenticationScreen.routeName:
//           page = const AuthenticationScreen();
//           break;
//         case BottomNavBarScreen.routeName:
//           page = BottomNavBarScreen();
//           break;
//         case HomeScreen.routeName:
//           page = const HomeScreen();
//           break;
//         case MapScreen.routeName:
//           page = const MapScreen();
//           break;
//         case QrScreen.routeName:
//           page = const QrScreen();
//           break;
//         case HistoryScreen.routeName:
//           page = const HistoryScreen();
//           break;
//         case SettingsScreen.routeName:
//           page = const SettingsScreen();
//           break;
//         case RegistrationScreen.routeName:
//           page = const RegistrationScreen();
//           break;
//         case LoginScreen.routeName:
//           page = const LoginScreen();
//           break;
//         case VerificationScreen.routeName:
//           page = const VerificationScreen();
//           break;
//         case ForgotPasswordScreen.routeName:
//           page = const ForgotPasswordScreen();
//           break;
//         case PasswordScreen.routeName:
//           page = const PasswordScreen();
//           break;
//         case ChooseCityScreen.routeName:
//           page = const ChooseCityScreen();
//           break;
//         case ChooseLanguageScreen.routeName:
//           page = const ChooseLanguageScreen();
//           break;
//         case AccountScreen.routeName:
//           page = const AccountScreen();
//           break;
//         case RatingScreen.routeName:
//           page = const RatingScreen();
//           break;
//         case AboutScreen.routeName:
//           page = const AboutScreen();
//           break;
//         case AboutDetailScreen.routeName:
//           page = const AboutDetailScreen();
//           break;
//         case SupportScreen.routeName:
//           page = const SupportScreen();
//         case NotificationsScreen.routeName:
//           page = const NotificationsScreen();
//           break;
//         case BonusesScreen.routeName:
//           page = const BonusesScreen();
//           break;
//         case ExchangeBonusesScreen.routeName:
//           page = const ExchangeBonusesScreen();
//           break;
//         case ScannerScreen.routeName:
//           page = const ScannerScreen();
//           break;
//         case Result.routeName:
//           page = const Result();
//           break;
//         case ThankYou.routeName:
//           page = const ThankYou();
//           break;
//         case MyCouponsScreens.routeName:
//           page = const MyCouponsScreens();
//           break;
//         default:
//           return null;
//       }
//     }
//     return CupertinoPageRoute<dynamic>(settings: settings, builder: (_) => page);
//   }
// }
