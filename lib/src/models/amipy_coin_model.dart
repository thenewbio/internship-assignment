// To parse this JSON data, do
//
//     final AmipyModel = AmipyModelFromJson(jsonString);

import 'dart:convert';

AmipyModel? amipyModelFromJson(String str) =>
    AmipyModel.fromJson(json.decode(str));

String amipyModelToJson(AmipyModel? data) => json.encode(data!.toJson());

class AmipyModel {
  AmipyModel({
    this.stream,
    this.data,
  });

  String? stream;
  List<Datum?>? data;

  factory AmipyModel.fromJson(Map<String, dynamic> json) => AmipyModel(
        stream: json["stream"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stream": stream,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class Datum {
  Datum({
    this.t,
    this.s,
    this.datumP,
    this.p,
    this.c,
    this.b,
    this.a,
    this.datumPu,
    this.pu,
    this.cu,
    this.bu,
    this.au,
    this.o,
    this.h,
    this.l,
  });

  T? t;
  String? s;
  String? datumP;
  String? p;
  String? c;
  String? b;
  String? a;
  String? datumPu;
  String? pu;
  String? cu;
  String? bu;
  String? au;
  String? o;
  String? h;
  String? l;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        t: tValues.map[json["T"]],
        s: json["s"],
        datumP: json["p"],
        p: json["P"],
        c: json["c"],
        b: json["b"],
        a: json["a"],
        datumPu: json["pu"],
        pu: json["Pu"],
        cu: json["cu"],
        bu: json["bu"],
        au: json["au"],
        o: json["o"],
        h: json["h"],
        l: json["l"],
      );

  Map<String, dynamic> toJson() => {
        "T": tValues.reverse![t],
        "s": s,
        "p": datumP,
        "P": p,
        "c": c,
        "b": b,
        "a": a,
        "pu": datumPu,
        "Pu": pu,
        "cu": cu,
        "bu": bu,
        "au": au,
        "o": o,
        "h": h,
        "l": l,
      };
}

enum T { FP_TCKR }

final tValues = EnumValues({"fpTckr": T.FP_TCKR});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
