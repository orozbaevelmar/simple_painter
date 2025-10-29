import 'dart:convert';
import 'dart:developer';

//Map<String, dynamic> toJson5() => {'name': 1, 'age': 2};

// String printBeautiful1(Map<String, dynamic> Function() toJson) =>
//     const JsonEncoder.withIndent('  ').convert(toJson());

// String printBeautiful(Map<String, dynamic> Function() toJson) =>
//     const JsonEncoder.withIndent('  ').convert(toJson());

String _printBeautiful(Object? o) =>
    const JsonEncoder.withIndent('  ').convert(o);

// void printBeautiful(Object? o) {
//   print(
//       '======Print Beautiful Start======= \n ${_printBeautiful(o)} \n ======Print Beautiful End=======');
// }

void logBeautiful(Object? o) {
  log('======Log Beautiful Start======= \n ${_printBeautiful(o)} \n ======Log Beautiful End=======');
}
