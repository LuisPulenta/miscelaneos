import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey =
    'com.luisnu.miscelaneos.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey =
    'com.luisnu.miscelaneos.fetch-background-pokemon';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        print('fetchBackgroundTaskKey');
        break;
      case fetchPeriodicBackgroundTaskKey:
        print('fetchPeriodicBackgroundTaskKey');
        break;
      case Workmanager.iOSBackgroundTask:
        print('Workmanager.iOSBackgroundTask');
        break;
    }

    return true;

    // print(
    //     "Native: called background task: $task"); //simpleTask will be emitted here.
    // return Future.value(true);
  });
}
