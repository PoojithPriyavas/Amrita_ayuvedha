import 'patient.dart';

class Model {
  bool? status;
  String? message;
  List<Patient>? patient;

  Model({this.status, this.message, this.patient});

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        patient: (json['patient'] as List<dynamic>?)
            ?.map((e) => Patient.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'patient': patient?.map((e) => e.toJson()).toList(),
      };
}
