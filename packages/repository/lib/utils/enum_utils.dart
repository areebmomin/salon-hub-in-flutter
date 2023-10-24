import 'package:flutter/foundation.dart';

T enumFromString<T>(List<T> values, String value, {required T defaultValue}) {
  return values.firstWhere(
        (e) => describeEnum(e as dynamic).toLowerCase() == value.toLowerCase(),
    orElse: () => defaultValue,
  );
}
