// To parse this JSON data, do
//
//     final gaEunit = gaEunitFromJson(jsonString);

import 'dart:convert';

List<GaEunit> gaEunitFromJson(String str) => List<GaEunit>.from(json.decode(str).map((x) => GaEunit.fromJson(x)));

String gaEunitToJson(List<GaEunit> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GaEunit {
    GaEunit({
        this.gaeCode,
        this.unit,
        this.qty,
        this.rate,
        this.fee,
        this.targetPercentage,
        this.type,
        this.datePurchased,
        this.status,
    });

    String? gaeCode;
    String? unit;
    String? qty;
    String? rate;
    String? fee;
    String? targetPercentage;
    String? type;
    DateTime? datePurchased;
    String? status;

    factory GaEunit.fromJson(Map<String, dynamic> json) => GaEunit(
        gaeCode: json["gae_code"],
        unit: json["unit"],
        qty: json["qty"],
        rate: json["rate"],
        fee: json["fee"],
        targetPercentage: json["target_percentage"],
        type: json["type"],
        datePurchased: DateTime.parse(json["date_purchased"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "gae_code": gaeCode,
        "unit": unit,
        "qty": qty,
        "rate": rate,
        "fee": fee,
        "target_percentage": targetPercentage,
        "type": type,
        "date_purchased": datePurchased!.toIso8601String(),
        "status": status,
    };
}
