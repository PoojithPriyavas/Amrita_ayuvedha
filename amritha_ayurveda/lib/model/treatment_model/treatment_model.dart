import 'treatment.dart';

class TreatmentModel {
  bool? status;
  String? message;
  List<Treatment>? treatments;

  TreatmentModel({this.status, this.message, this.treatments});

  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      treatments: (json['treatments'] as List<dynamic>?)
          ?.map((e) => Treatment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'treatments': treatments?.map((e) => e.toJson()).toList(),
      };
}
