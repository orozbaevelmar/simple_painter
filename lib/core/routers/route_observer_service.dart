// import 'package:flutter/material.dart';
// import 'package:jashyl_bonus_flutter/main.dart';

// const _tag = 'route_observer_service';

// /// Service for monitoring navigator routes
// class RouteObserverService extends RouteObserver {
//   final Set<AppRouteObserver> _listeners = {};

//   /// [RouteObserverService] constructor
//   RouteObserverService();

//   /// Dispose [RouteObserverService]
//   void dispose() {
//     _listeners.clear();
//   }

//   @override
//   void didPush(Route route, Route? previousRoute) {
//     super.didPush(route, previousRoute);
//     final oldName = previousRoute?.settings.name;
//     final newName = route.settings.name;
//     logger.d('$_tag, Push from $oldName to $newName');
//     for (final listener in _listeners) {
//       listener.didPush(route, previousRoute);
//     }
//   }

//   @override
//   void didPop(Route route, Route? previousRoute) {
//     super.didPop(route, previousRoute);
//     final oldName = route.settings.name;
//     final newName = previousRoute?.settings.name;
//     logger.d('$_tag, Pop from $oldName to $newName');
//     final listeners = List.of(_listeners);
//     for (final listener in listeners) {
//       listener.didPop(route, previousRoute);
//     }
//   }

//   @override
//   void didStartUserGesture(Route route, Route? previousRoute) {
//     super.didStartUserGesture(route, previousRoute);
//     final listeners = List.of(_listeners);
//     for (final listener in listeners) {
//       listener.didStartUserGesture(route, previousRoute);
//     }
//   }

//   /// Add new listener
//   void register(AppRouteObserver listener) {
//     _listeners.add(listener);
//   }

//   /// Remove exists listener
//   void unregister(AppRouteObserver listener) {
//     _listeners.remove(listener);
//   }
// }

// /// Route listener
// abstract class AppRouteObserver {
//   /// Calls when receive new push
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}

//   /// Calls when receive new pop
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}

//   /// Calls when receive user gesture
//   void didStartUserGesture(
//     Route<dynamic> route,
//     Route<dynamic>? previousRoute,
//   ) {}
// }
