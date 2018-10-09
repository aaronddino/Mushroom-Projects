import 'package:flutter_driver/driver_extension.dart';
import 'package:seeatree_4_aed/main.dart' as app;
import 'package:test/test.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you 
  // are interested in testing.
  app.main();
}