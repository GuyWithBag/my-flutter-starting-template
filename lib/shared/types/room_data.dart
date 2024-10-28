class RoomData {
  final String id;
  final String name;
  final int aqi;
  final int dustConcentration;
  final int temperature;
  final int humidity;

  RoomData(
      {required this.id,
      required this.name,
      required this.aqi,
      required this.dustConcentration,
      required this.temperature,
      required this.humidity});
}
