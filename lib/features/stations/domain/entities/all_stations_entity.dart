// ignore_for_file: public_member_api_docs, sort_constructors_first
class AllStationsEntity {
  List<CharacterStationsEntity> allStations;
  AllStationsEntity({
    required this.allStations,
  });
}

class CharacterStationsEntity {
  Map<String, StationsNamesEntity> stations;
  CharacterStationsEntity({
    required this.stations,
  });
}

class StationsNamesEntity {
  List<String> names;
  StationsNamesEntity({
    required this.names,
  });
}
