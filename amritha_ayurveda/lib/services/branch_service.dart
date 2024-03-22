import 'package:amritha_ayurveda/core/api_end_points.dart';
import 'package:amritha_ayurveda/model/patient_model/patient.dart';
import 'package:amritha_ayurveda/provider/register_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BranchService {
  final String baseUrl = ApiEndPoints.commonWebUrl;

  static Future<List<Patient>> fetchBranches(
      String token, RegisterProvider registerProvider) async {
    const url = '${ApiEndPoints.commonWebUrl}BranchList';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> branchList = jsonResponse['branches'];
      final data = branchList.map((json) => Patient.fromJson(json)).toList();
      // print("data is $data");
      registerProvider.setBranches(data.map((branch) => branch.name!).toList());
      registerProvider
          .setBranchesId(data.map((branch) => branch.id!.toString()).toList());

      return data;
    } else {
      throw Exception('Failed to load patients');
    }
  }
}
