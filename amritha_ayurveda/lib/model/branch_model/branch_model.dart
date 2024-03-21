import 'branch.dart';

class BranchModel {
  bool? status;
  String? message;
  List<Branch>? branches;

  BranchModel({this.status, this.message, this.branches});

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        branches: (json['branches'] as List<dynamic>?)
            ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'branches': branches?.map((e) => e.toJson()).toList(),
      };
}
