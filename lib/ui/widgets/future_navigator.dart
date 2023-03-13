import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../logic/models/exceptions.dart';
import 'messenger.dart';

class FutureNavigator {
  /// future - future to run.
  /// initialRoute - the route name from which the function was called.
  ///                This serves as a return to widget incase error occured.
  /// destinationRoute - The route name to navigate to when future is completed.
  /// callback - function to execute when navigated to the destination route.
  static navigate({
    required BuildContext context,
    required Future future,
    required String initialRoute,
    required String destinationRoute,
    void Function()? callback,
  }) async {
    // show loading screen
    Navigator.pushNamed(context, '/loading');

    try {
      // wait for data to be fetched
      await future.then((value) {
        if (callback != null) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            callback();
          });
        }
        Navigator.pushNamed(context, destinationRoute);
      });
    } catch (error) {
      // handle error and show error screen
      Navigator.pushNamed(context, initialRoute);
      // show error message
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        var err = error as UserDataException;
        Messenger.showSnackBar(message: err.errorMessage, context: context);
      });
    }
  }
}
