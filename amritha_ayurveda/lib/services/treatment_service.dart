import 'package:amritha_ayurveda/core/api_end_points.dart';
import 'package:amritha_ayurveda/model/patient_model/patient.dart';
import 'package:amritha_ayurveda/provider/register_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TreatmentService {
  final String baseUrl = ApiEndPoints.commonWebUrl;

  static Future<List<Patient>> fetchTreatments(
      String token, RegisterProvider registerProvider) async {
    const url = '${ApiEndPoints.commonWebUrl}TreatmentList';
    final response = await http.get(
      Uri.parse(url),
      // headers: {'Authorization': 'Bearer $token'},
      headers: {'Authorization': 'Bearer ${ApiEndPoints.token}'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['treatments'];

      final data = jsonList.map((json) => Patient.fromJson(json)).toList();
      registerProvider
          .setTreatments(data.map((treatment) => treatment.name!).toList());

      print(data);
      return data;
    } else {
      throw Exception('Failed to load patients');
    }
  }
}
