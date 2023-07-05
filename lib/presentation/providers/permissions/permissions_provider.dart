import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

//----------------------- Provider -----------------------------

final permissionsProvider =
    StateNotifierProvider<PermissionsNotifier, PermissionsState>((ref) {
  return PermissionsNotifier();
});

//----------------------- Notifier -----------------------------
class PermissionsNotifier extends StateNotifier<PermissionsState> {
  PermissionsNotifier() : super(PermissionsState()) {
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissionsArray[0],
      sensors: permissionsArray[1],
      location: permissionsArray[2],
      locationAlways: permissionsArray[3],
      locationWhenInUse: permissionsArray[4],
    );
  }

  openSettingsScreen() {
    openAppSettings();
  }

  void _checkPermissionState(PermissionStatus status) {
    if (status == PermissionStatus.permanentlyDenied) {
      openSettingsScreen();
    }
  }

  requestCameraAccess() async {
    final status = await Permission.camera.request();
    state = state.copyWith(camera: status);
    _checkPermissionState(status);
  }

  requestLocationAccess() async {
    final status = await Permission.location.request();
    state = state.copyWith(location: status);
    _checkPermissionState(status);
  }

  requestSensorsAccess() async {
    final status = await Permission.sensors.request();
    state = state.copyWith(sensors: status);
    _checkPermissionState(status);
  }
}

//----------------------- Class -----------------------------

class PermissionsState {
  final PermissionStatus camera;
  final PermissionStatus sensors;
  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionsState({
    this.camera = PermissionStatus.denied,
    this.sensors = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationAlways = PermissionStatus.denied,
    this.locationWhenInUse = PermissionStatus.denied,
  });

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  get locationGranted {
    return location == PermissionStatus.granted;
  }

  get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  PermissionsState copyWith({
    PermissionStatus? camera,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) =>
      PermissionsState(
        camera: camera ?? this.camera,
        sensors: sensors ?? this.sensors,
        location: location ?? this.location,
        locationAlways: locationAlways ?? this.locationAlways,
        locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
      );
}
