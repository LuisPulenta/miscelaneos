import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final watchUserLocation = ref.watch(watchLocationProvider);
    final useInitialLocation = ref.watch(userLocationProvider);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('ControlledMapScreen'),
      //   centerTitle: true,
      // ),
      body: useInitialLocation.when(
          data: (data) => _MapAndControls(
                latitude: data.$1,
                longitude: data.$2,
              ),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const Center(
                child: Text('Ubicando usuario...'),
              )),
    );
  }
}

//-------------------------------------------------------------

class _MapAndControls extends ConsumerWidget {
  final double latitude;
  final double longitude;
  const _MapAndControls({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapControllerState = ref.watch(mapControllerProvider);

    return Stack(
      children: [
        _MapView(
          initialLatitude: latitude,
          initialLongitude: longitude,
        ),
        //Regresar a la pantalla anterior
        Positioned(
          top: 40,
          left: 20,
          child: IconButton.filledTonal(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        //Ir a la posición del Usuario
        Positioned(
          bottom: 40,
          left: 20,
          child: IconButton.filledTonal(
              onPressed: () {
                ref.read(mapControllerProvider.notifier).findUser();
                //.gotoLocation(latitude, longitude);
              },
              icon: const Icon(Icons.location_searching)),
        ),
        //Seguir Usuario
        Positioned(
          bottom: 90,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
              ref.watch(mapControllerProvider.notifier).toggleFollowUser();
            },
            icon: Icon(mapControllerState.followUser
                ? Icons.directions_run
                : Icons.accessibility_new_outlined),
          ),
        ),
        //Crear Marcador
        Positioned(
          bottom: 140,
          left: 20,
          child: IconButton.filledTonal(
              onPressed: () {
                ref
                    .read(mapControllerProvider.notifier)
                    .addMarkerCurrentPosition();
              },
              icon: const Icon(Icons.pin_drop)),
        ),
      ],
    );
  }
}

//------------------------------------------------------------

class _MapView extends ConsumerStatefulWidget {
  final double initialLatitude;
  final double initialLongitude;
  const _MapView(
      {required this.initialLatitude, required this.initialLongitude});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<_MapView> {
  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);

    return GoogleMap(
      markers: mapController.markersSet,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLatitude, widget.initialLongitude),
          zoom: 12),
      onMapCreated: (GoogleMapController controller) {
        ref.read(mapControllerProvider.notifier).setMapController(controller);
      },
      onLongPress: (latLng) {
        ref
            .read(mapControllerProvider.notifier)
            .addMarker(latLng.latitude, latLng.longitude, 'Custom Marker');
      },
    );
  }
}
