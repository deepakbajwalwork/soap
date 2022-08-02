// To parse this JSON data, do
//
//     final plansModel = plansModelFromJson(jsonString);

import 'dart:convert';

PlansModel plansModelFromJson(String str) =>
    PlansModel.fromJson(json.decode(str));

// String plansModelToJson(PlansModel data) => json.encode(data.toJson());

class PlansModel {
  PlansModel({
    this.success,
    this.errors,
    this.data,
  });

  bool? success;
  List<dynamic>? errors;
  List<Datum>? data;

  factory PlansModel.fromJson(Map<String, dynamic> json) => PlansModel(
        // success: json["success"],
        // errors: List<dynamic>.from(json["errors"].map((x) => x)),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "success": success,
  //       // "errors": List<dynamic>.from(errors.map((x) => x)),
  //       "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //     };
}

class Datum {
  Datum({
    this.id,
    this.uId,
    this.userId,
    this.name,
    this.startDate,
    this.letter,
    this.savingCycleId,
    this.envelope,
    this.savingFrequencyId,
    this.startingAmount,
    this.topupAmount,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.uploadFiles,
  });

  String? id;
  String? uId;
  String? userId;
  String? name;
  DateTime? startDate;
  String? letter;
  String? savingCycleId;
  String? envelope;
  String? savingFrequencyId;
  String? startingAmount;
  String? topupAmount;
  DateTime? duration;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? uploadFiles;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? "" : json["id"].toString(),
        uId: json["u_id"] == null ? "" : json["u_id"].toString(),
        userId: json["user_id"] == null ? "" : json["user_id"].toString(),
        name: json["name"] == null ? "" : json["name"].toString(),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        letter: json["letter"] == null ? "" : json["letter"].toString(),
        savingCycleId: json["saving_cycle_id"] == null
            ? ""
            : json["saving_cycle_id"].toString(),
        envelope: json["envelope"] == null ? "" : json["envelope"].toString(),
        savingFrequencyId: json["saving_frequency_id"] == null
            ? ''
            : json["saving_frequency_id"].toString(),
        startingAmount: json["starting_amount"] == null
            ? ""
            : json["starting_amount"].toString(),
        topupAmount:
            json["topup_amount"] == null ? "" : json["topup_amount"].toString(),
        duration:
            json["duration"] == null ? null : DateTime.parse(json["duration"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        uploadFiles: json["upload_files"] == null
            ? null
            : List<dynamic>.from(json["upload_files"].map((x) => x)),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "u_id": uId,
  //       "user_id": userId,
  //       "name": name,
  //       "start_date":
  //           "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
  //       "letter": letter,
  //       "saving_cycle_id": savingCycleId,
  //       "envelope": envelope,
  //       "saving_frequency_id": savingFrequencyId,
  //       "starting_amount": startingAmount,
  //       "topup_amount": topupAmount,
  //       "duration":
  //           "${duration.year.toString().padLeft(4, '0')}-${duration.month.toString().padLeft(2, '0')}-${duration.day.toString().padLeft(2, '0')}",
  //       "created_at": createdAt.toIso8601String(),
  //       "updated_at": updatedAt.toIso8601String(),
  //       "upload_files": List<dynamic>.from(uploadFiles.map((x) => x)),
  //     };
}
