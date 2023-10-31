class Facility {
  final int id;
  final int districtId;
  final int ownerId;
  final String facilityCode;
  final String facilityName;

  Facility({
    required this.id,
    required this.districtId,
    required this.ownerId,
    required this.facilityCode,
    required this.facilityName,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json['id'],
      districtId: json['district_id'],
      ownerId: json['owner_id'],
      facilityCode: json['facility_code'],
      facilityName: json['facility_name'] ?? 'N/A',
    );
  }
}
