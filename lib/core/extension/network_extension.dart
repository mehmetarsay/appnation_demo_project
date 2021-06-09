import 'package:appnation_demo_project/core/constants/enums/network_service_enum.dart';

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.URL:
        return 'r/flutterdev/top.json?count=20';

    }
  }
}
