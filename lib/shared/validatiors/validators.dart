String? validateEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, заполните';
  }
  return null; // Indicates valid input
}

String? validateNumberCanBeEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, заполните';
  }

  if (double.tryParse(value) == null) {
    return 'Требуется численное значение';
  }

  return null; // Indicates valid input
}

String? validateNumberCanNotBeEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, заполните';
  }
  if (double.tryParse(value) == null) {
    return 'Требуется численное значение';
  }

  return null; // Indicates valid input
}

String? validateDropDown<T>(
  T? value, {
  String message = 'Пожалуйста, выберите значение',
}) {
  return value == null ? message : null;
}

String? validateDate(value) {
  // 15/01/2024
  if (value == null || value.isEmpty) {
    return 'Введите дату';
  }

  // Check format via regex
  final regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  if (!regex.hasMatch(value)) {
    return 'Формат:\nдд/мм/гггг';
  }

  // Try to parse
  try {
    final parts = value.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    final date = DateTime(year, month, day);

    // Check correctness (e.g., 31/02/2020 must fail)
    if (date.day != day || date.month != month || date.year != year) {
      return 'Некорректная дата';
    }
  } catch (_) {
    return 'Некорректная дата';
  }

  return null; // valid
}

String? validateUrl(String? value) {
  if (value == null || value.isEmpty) {
    return 'Введите URL';
  }
  if (!value.startsWith('https://')) {
    return 'Введите правильный URL';
  }
  return null; // Indicates valid input
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, введите ваше имя';
  }
  return null; // Indicates valid input
}

String? validateCompanyName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, введите название компании';
  }
  return null; // Indicates valid input
}

String? validateChooseType(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, выберите тип';
  }
  return null; // Indicates valid input
}

String? validateLastname(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, введите вашу фамилию';
  }
  return null; // Indicates valid input
}

String? validatePinCode(String? value) {
  if (value == null || value.length < 4) {
    return 'Введите 4-значный код';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, введите ваш email';
  }

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegex.hasMatch(value)) {
    return 'Пожалуйста, введите действительный email';
  }

  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, введите номер телефона';
  }

  // Проверка на то, что строка содержит только цифры
  final digitsOnlyRegex = RegExp(r'^\d+$');
  if (!digitsOnlyRegex.hasMatch(value.replaceAll('+', ''))) {
    return 'Номер телефона должен содержать только цифры';
  }

  // Регулярное выражение для проверки кыргызских номеров без начальной цифры 0
  final phoneRegex = RegExp(r'^\+996[1-9]\d{8}$');
  if (!phoneRegex.hasMatch(value)) {
    return 'Номер телефона должен начинаться с +996, за которым следует 9 цифр, первая из которых не 0';
  }

  return null;
}

String? validateExperience(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, введите сколько лет вы работали';
  }
  // Add more checks for valid phone number format (length, digits only, etc.) as needed
  return null;
}

String? validatePrice(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, введите вашу цену за визит';
  }
  // Add more checks for valid phone number format (length, digits only, etc.) as needed
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, введите пароль';
  }
  if (value.length < 8) {
    return 'Пароль должен быть не менее 8 символов';
  }
  return null;
}

String? validatePasswordConfirmation({
  String? repeatedPassword,
  String? password,
}) {
  // Obtain the value from the 'password' field for comparison
  if (repeatedPassword == null || repeatedPassword.isEmpty) {
    return 'Пожалуйста, подтвердите ваш пароль';
  }
  if (repeatedPassword != password) {
    return 'Пароли не совпадают';
  }
  return null;
}

// String? validateGender(Gender? value) {
//   if (value == null || value == Gender.notChosen) {
//     return 'Пожалуйста, выберите пол';
//   }

//   return null;
// }

// String? validateFiles(XFile? value) {
//   if (value == null) {
//     return 'requiredDocument';
//   }

//   return null;
// }

// String? validateMedicalRegistration(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Пожалуйста, введите ваш регистрационный номер';
//   }
//   // Add more checks for valid phone number format (length, digits only, etc.) as needed
//   return null;
// }

// String? validateWorkPlace(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Пожалуйста, введите ваше место работы';
//   }
//   // Add more checks for valid phone number format (length, digits only, etc.) as needed
//   return null;
// }
