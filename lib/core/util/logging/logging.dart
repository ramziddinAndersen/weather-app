import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (data) {
      debugPrint('${data.level.name} ${data.time} ${data.message} ');
    },
  );
}
