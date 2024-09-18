// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromMap(jsonString);

// import 'dart:convert';

// YesNoModel yesNoModelFromMap(String str) => YesNoModel.fromMap(json.decode(str));

// String yesNoModelToMap(YesNoModel data) => json.encode(data.toMap());

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No', 
      fromWho: FromWho.hers,
      url: image
    );
}




// class YesNoModel {
//   String answer;
//   bool forced;
//   String image;

//   YesNoModel({
//     required this.answer,
//     required this.forced,
//     required this.image
//   });

//   factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => 
//   YesNoModel(
//     answer: json['answer'], 
//     forced: json['forced'],
//     image: json['image']
//   );

// }