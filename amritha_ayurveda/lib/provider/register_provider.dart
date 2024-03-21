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
  String? selectedTreatment;

  int _treatments = 0;
  int get treatments => _treatments;

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

  List<int> counters = List<int>.filled(3, 0);

  List _treatmentPurchased = [];
  List get treatmentPurchased => _treatmentPurchased;

  int getCount(int index) {
    return counters[index];
  }

  void decrementCounter(int index) {
    if (counters[index] == 0) {
      return;
    }
    counters[index]--;
    notifyListeners();
  }

  void incrementCounter(int index) {
    counters[index]++;
    notifyListeners();
  }

  treatmentSelected(String treatmentValue) {
    selectedTreatment = treatmentValue;
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
    print("branches are $branchList");
  }

  setTreatments(List<String> newList) {
    _treatmentList = newList;
    notifyListeners();
    print("treatments are $treatmentList ");
  }

  void saveTreatmentDetail() {
    _treatments = 1;
    if (selectedTreatment != null) {
      _treatmentPurchased.add(selectedTreatment!);

      notifyListeners();
    }
    notifyListeners();
  }

  void saveTreatmentDetails() {
    _treatments = 1;
    if (selectedTreatment != null) {
      Map<String, dynamic> treatmentDetails = {
        'treatment': selectedTreatment,
        'maleQuantity': counters[0],
        'femaleQuantity': counters[1],
      };

      _treatmentPurchased.add(treatmentDetails);

      notifyListeners();
      print("treatemnt purchased is $treatmentPurchased");
    }
  }

  void removeTreatmentDetails(int index) {
    if (index >= 0 && index < _treatmentPurchased.length) {
      _treatmentPurchased.removeAt(index);
      notifyListeners();
    }
  }

  void modifyTreatmentDetails(int index, Map<String, dynamic> newDetails) {
    if (index >= 0 && index < _treatmentPurchased.length) {
      _treatmentPurchased[index] = newDetails;
      notifyListeners();
    }
  }
}
