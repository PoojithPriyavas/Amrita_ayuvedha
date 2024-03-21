import 'package:amritha_ayurveda/provider/login_provider.dart';
import 'package:amritha_ayurveda/services/branch_service.dart';
import 'package:amritha_ayurveda/services/treatment_service.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController whatappNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController discountAmountController =
      TextEditingController();
  final TextEditingController advanceAmountController = TextEditingController();
  final TextEditingController balanceAmountController = TextEditingController();

  String? selectedLocation;

  String? selectedbranch;

  List<String> _branchList = [];
  List<String> get branchList => _branchList;

  List<String> _treatmentList = [];
  List<String> get treatmentList => _treatmentList;

  locationSelected(String locationValue) {
    selectedLocation = locationValue;
    notifyListeners();
  }

  branchSelected(String branchValue) {
    selectedbranch = branchValue;
    notifyListeners();
  }

  registerNow(SignInProvider signInProvider) async {
    await BranchService.fetchBranches(signInProvider.token, this);
    await TreatmentService.fetchTreatments(signInProvider.token, this);
    notifyListeners();
  }

  setBranches(List<String> newList) {
    _branchList = newList;
    notifyListeners();
    print("branches are $branchList  ");
  }

  setTreatments(List<String> newList) {
    _treatmentList = newList;
    notifyListeners();
    print("treatments are $treatmentList ");
  }
}
