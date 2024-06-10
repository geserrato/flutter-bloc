part of 'geolocation_cubit.dart';

class GeolocationState extends Equatable {
  final (double lat, double long) location;
  final bool serviceEnable;
  final bool permissionGranted;

  const GeolocationState({
    this.location = const (0, 0),
    this.serviceEnable = false,
    this.permissionGranted = false,
  });

  GeolocationState copyWith(
          {(double lat, double long)? location,
          bool? serviceEnable,
          bool? permissionGranted}) =>
      GeolocationState(
          location: location ?? this.location,
          serviceEnable: serviceEnable ?? this.serviceEnable,
          permissionGranted: permissionGranted ?? this.permissionGranted);

  @override
  List<Object> get props => [location, serviceEnable, permissionGranted];
}
