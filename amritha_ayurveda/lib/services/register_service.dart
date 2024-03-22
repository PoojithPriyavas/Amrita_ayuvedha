import 'package:amritha_ayurveda/provider/login_provider.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  Future<void> postDataToServer(
    SignInProvider signInProvider,
    String name,
    String payment,
    String phone,
    String address,
    String totalAmount,
    String discountAmount,
    String advanceAmount,
    String balanceAmount,
    String date,
    String male,
    String female,
    String branch,
    String treatments,
  ) async {
    var url = Uri.parse('https://flutter-amr.noviindus.in/api/PatientUpdate');
    var token = signInProvider.token;

    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $token';

    request.fields['name'] = name;
    request.fields['excecutive'] = 'Jane Smith';
    request.fields['payment'] = payment;
    request.fields['phone'] = phone;
    request.fields['address'] = address;
    request.fields['total_amount'] = totalAmount;
    request.fields['discount_amount'] = discountAmount;
    request.fields['advance_amount'] = advanceAmount;
    request.fields['balance_amount'] = balanceAmount;
    request.fields['date_nd_time'] = date;
    request.fields['id'] = '';
    request.fields['male'] = male;
    request.fields['female'] = female;
    request.fields['branch'] = branch;
    request.fields['treatments'] = treatments;

    print('Request Body: ${request.fields}');

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("response body ${response.body}");

      if (response.statusCode == 200) {
        print('Data posted successfully');
      } else {
        print('Failed to post data. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
