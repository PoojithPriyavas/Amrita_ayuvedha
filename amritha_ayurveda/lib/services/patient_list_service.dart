import 'package:amritha_ayurveda/core/api_end_points.dart';
import 'package:amritha_ayurveda/model/patient_model/patient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientService {
  final String baseUrl = ApiEndPoints.commonWebUrl;

  static Future<List<Patient>> fetchPatients(String token) async {
    const url = '${ApiEndPoints.commonWebUrl}PatientList';
    final response = await http.get(
      Uri.parse(url),
      // headers: {'Authorization': 'Bearer $token'},
      headers: {'Authorization': 'Bearer ${token}'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['patient'];
      print("asdfsf");
      print("${response.body}");

      final data = jsonList.map((json) => Patient.fromJson(json)).toList();
      print("data is $data");

      return data;
    } else {
      throw Exception('Failed to load patients');
    }
  }
}
