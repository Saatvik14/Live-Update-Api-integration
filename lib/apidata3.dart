import 'dart:convert';

ApiFindByPinData apiFindByPinDataFromJson(String str) =>
    ApiFindByPinData.fromJson(json.decode(str));

class ApiFindByPinData {
  ApiFindByPinData({
    this.sessions,
  });

  List<Session> sessions;

  factory ApiFindByPinData.fromJson(Map<String, dynamic> json) =>
      ApiFindByPinData(
        sessions: List<Session>.from(
            json["sessions"].map((x) => Session.fromJson(x))),
      );
}

class Session {
  Session({
    this.centerId,
    this.name,
    this.address,
    this.stateName,
    this.districtName,
    this.blockName,
    this.pincode,
    this.from,
    this.to,
    this.lat,
    this.long,
    this.feeType,
    this.sessionId,
    this.date,
    this.availableCapacity,
    this.availableCapacityDose1,
    this.availableCapacityDose2,
    this.fee,
    this.minAgeLimit,
    this.vaccine,
    this.slots,
  });

  int centerId;
  String name;
  String address;
  String stateName;
  String districtName;
  String blockName;
  int pincode;
  String from;
  String to;
  double lat;
  double long;
  String feeType;
  String sessionId;
  String date;
  int availableCapacity;
  int availableCapacityDose1;
  int availableCapacityDose2;
  String fee;
  int minAgeLimit;
  String vaccine;
  List<String> slots;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        centerId: json["center_id"],
        name: json["name"],
        address: json["address"],
        stateName: json["state_name"],
        districtName: json["district_name"],
        blockName: json["block_name"],
        pincode: json["pincode"],
        from: json["from"],
        to: json["to"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        feeType: json["fee_type"],
        sessionId: json["session_id"],
        date: json["date"],
        availableCapacity: json["available_capacity"],
        availableCapacityDose1: json["available_capacity_dose1"],
        availableCapacityDose2: json["available_capacity_dose2"],
        fee: json["fee"],
        minAgeLimit: json["min_age_limit"],
        vaccine: json["vaccine"],
        slots: List<String>.from(json["slots"].map((x) => x)),
      );
}
