// import 'dart:async';
// import 'package:flutter/material.dart';

// class ConnectivityService {
//   final _connectivity = Connectivity();
//   final _connectivitySubject = BehaviorSubject<ConnectivityResult>();

//   ConnectivityService() {
//     // Проверяем подключение при старте
//     _checkInitialConnectivity();
//     // Подписываемся на изменения сети
//     _connectivity.onConnectivityChanged.listen((results) {
//       final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
//       _connectivitySubject.add(result);
//     });
//   }

//   // Функция проверки начального состояния сети
//   Future<void> _checkInitialConnectivity() async {
//     final results = await _connectivity.checkConnectivity();
//     final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
//     _connectivitySubject.add(result);
//   }

//   // Stream для подписки
//   Stream<ConnectivityResult> get connectivityStream => _connectivitySubject.stream;

//   // Метод для проверки соединения
//   Future<bool> hasInternetConnection() async {
//     final result = await _connectivity.checkConnectivity();
//     return result.isNotEmpty && result.first != ConnectivityResult.none;
//   }

//   void dispose() {
//     _connectivitySubject.close();
//   }
// }

// // Глобальный сервис, чтобы он работал везде
// final connectivityService = ConnectivityService();

// class ConnectivityWrapper extends StatelessWidget {
//   final Widget child;

//   const ConnectivityWrapper({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<ConnectivityResult>(
//       stream: connectivityService.connectivityStream,
//       builder: (context, snapshot) {
//         final connectivityResult = snapshot.data ?? ConnectivityResult.none;

//         if (connectivityResult == ConnectivityResult.none) {
//           return NoInternetScreen();
//         }

//         return child;
//       },
//     );
//   }
// }

// class NoInternetScreen extends StatelessWidget {
//   const NoInternetScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(42),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Assets.images.noInternet.image(),
//               const SizedBox(height: 16),
//               const Text(
//                 'Подключитесь к интернету',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontFamily: 'Nunito',
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const SizedBox(
//                 width: 268,
//                 child: Text(
//                   'Возникла ошибка, пожалуйста, попробуйте снова',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0x99262626),
//                     fontSize: 14,
//                     fontFamily: 'Nunito',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () async {
//                   bool hasInternet = await connectivityService.hasInternetConnection();
//                   if (!hasInternet) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Нет подключения к интернету. Попробуйте снова.'),
//                         duration: Duration(seconds: 2),
//                       ),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xffA3D80D),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: Text(
//                   'Обновить',
//                   style: AppTextStyles.confirmationButtonText.copyWith(fontSize: 17),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
