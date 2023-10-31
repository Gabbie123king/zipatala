class Facility {
  int id;
  String facilityCode;
  String facilityName;
  int districtId;
  String owner;

  Facility({
    required this.id,
    required this.facilityCode,
    required this.facilityName,
    required this.districtId,
    required this.owner,
  });

  factory Facility.fromMap(Map<String, dynamic> json) => Facility(
    id: json['id'],
    facilityCode: json['facility_code'],
    facilityName: json['facility_name'],
    districtId: json['district_id'],
    owner: json['owner'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'facility_code': facilityCode,
    'facility_name': facilityName,
    'district_id': districtId,
    'owner': owner,
  };
}

class District {
  int id;
  String districtName;

  District({
    required this.id,
    required this.districtName,
  });

  factory District.fromMap(Map<String, dynamic> json) => District(
    id: json['id'],
    districtName: json['district_name'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'district_name': districtName,
  };
}
class Owner {
  int id;
  String ownerName;

  Owner({
    required this.id,
    required this.ownerName,
  });

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
    id: json['id'],
    ownerName: json['owner_name'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'owner_name': ownerName,
  };
}
