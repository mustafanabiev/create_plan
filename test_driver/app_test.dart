import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'helpers/helpers.dart';

void main() {
  late FlutterDriver driver;

  group('Create Plan Integration Test', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();

      await driver.waitUntilFirstFrameRasterized();
    });
  });

  test('login-select-lang-view', () async {
    await driver.waitFor(find.byValueKey('login-select-view'));

    await takeScreenshot(driver, 'login-select-view');
    await driver.tap(find.byValueKey('login-button'));
    await Future<void>.delayed(const Duration(seconds: 5));
  });

  tearDownAll(() async {
    await driver.close();
  });
}
