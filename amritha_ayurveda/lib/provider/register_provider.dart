import 'package:amritha_ayurveda/provider/login_provider.dart';
import 'package:amritha_ayurveda/services/branch_service.dart';
import 'package:amritha_ayurveda/services/pdf_serice.dart';
import 'package:amritha_ayurveda/services/register_service.dart';
import 'package:amritha_ayurveda/services/treatment_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Payment { cash, card, upi }

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

  double _height = 0;
  double get height => _height;

  int _treatments = 0;
  int get treatments => _treatments;

  String _selectedFormatedTime = "";
  String get selectedFormatedTime => _selectedFormatedTime;

  List<String> _treatmentId = [];
  List<String> get treatmentId => _treatmentId;

  String _branchId = "";
  String get branchId => _branchId;

  List<String> _treatmentList = [];
  List<String> get treatmentList => _treatmentList;

  List<String> _branchList = [];
  List<String> get branchList => _branchList;

  List<String> _treatmentMainId = [];
  List<String> get treatmentMainId => _treatmentMainId;
  locationSelected(String locationValue) {
    selectedLocation = locationValue;
    notifyListeners();
  }

  List<int> counters = List<int>.filled(3, 0);

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

  treatmentSelected(String treatmentValue, int index) {
    selectedTreatment = treatmentValue;

    if (index >= 0 && index < _treatmentMainId.length) {
      _treatmentId.add(_treatmentMainId[index]);
    } else {}

    notifyListeners();
  }

  branchSelected(String branchValue, int index) {
    selectedbranch = branchValue;

    _branchId = _branchesMainId[index];

    notifyListeners();
  }

  registerNow(SignInProvider signInProvider) async {
    await resetControls();
    await BranchService.fetchBranches(signInProvider.token, this);
    await TreatmentService.fetchTreatments(signInProvider.token, this);
    notifyListeners();
  }

  setBranches(List<String> newList) {
    _branchList = newList;
    notifyListeners();
    print("branches are $branchList");
  }

  List<String> _branchesMainId = [];
  List<String> get branchesMainId => _branchesMainId;

  setBranchesId(List<String> branchesId) {
    _branchesMainId = branchesId;
    notifyListeners();
  }

  setTreatments(List<String> newList) {
    _treatmentList = newList;
    notifyListeners();
    print("treatments are $treatmentList ");
  }

  setTreatentId(List<String> treatmentIdList) {
    _treatmentMainId = treatmentIdList;
    notifyListeners();
    print("treatment id in treatment main id is $treatmentMainId");
  }

  List _treatmentPurchased = [];
  List get treatmentPurchased => _treatmentPurchased;

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  String _selectedFormatedDate = "";
  String get selectedFormatedDate => _selectedFormatedDate;

  TimeOfDay _selectedTime = TimeOfDay.now();
  TimeOfDay get selectedTime => _selectedTime;

  set selectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
    print("selected date is $_selectedDate");
    String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
    print("Formatted date: $formattedDate");
    _selectedFormatedDate = formattedDate;

    notifyListeners();
  }

  set selectedTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();

    int hour = time.hourOfPeriod;
    int minute = time.minute;
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';

    if (hour == 0) {
      hour = 12;
    }

    String hourStr = hour.toString().padLeft(2, '0');
    String minuteStr = minute.toString().padLeft(2, '0');
    print("time selected is $hourStr:$minuteStr $period");
    _selectedFormatedTime = "$hourStr:$minuteStr $period";
  }

  Payment? _selectedPaymentMethod;

  Payment? get selectedPaymentMethod => _selectedPaymentMethod;

  void setSelectedPaymentMethod(Payment payment) {
    _selectedPaymentMethod = payment;
    notifyListeners();
    print("payment methrod i s$selectedPaymentMethod");
  }

  List<String> _mensQuantity = [];
  List<String> get mensQuantity => _mensQuantity;

  List<String> _femaleQuantity = [];
  List<String> get femaleQuantity => _femaleQuantity;

  List<String> _treatmentName = [];
  List<String> get treatmentName => _treatmentName;

  void saveTreatmentDetails() {
    _treatments = 1;
    if (selectedTreatment != null) {
      Map<String, dynamic> treatmentDetails = {
        'treatment': selectedTreatment,
        'maleQuantity': counters[0],
        'femaleQuantity': counters[1],
      };

      _treatmentPurchased.add(treatmentDetails);

      if (treatmentPurchased.length == 1) {
        _height = 100;
      } else if (treatmentPurchased.length == 2) {
        _height = 200;
      } else if (treatmentPurchased.length == 3) {
        _height = 300;
      } else if (treatmentPurchased.length == 4) {
        _height = 400;
      } else {
        _height = 100;
        notifyListeners();
      }
      _mensQuantity = _treatmentPurchased
          .map((treatment) => treatment['maleQuantity'].toString())
          .toList();

      _femaleQuantity = _treatmentPurchased
          .map((treatment) => treatment['femaleQuantity'].toString())
          .toList();

      _treatmentName = _treatmentPurchased
          .map((treatment) => treatment['treatment'].toString())
          .toList();

      print("mens quantity is $mensQuantity");
      print("female quantity is $mensQuantity");
      print("treatment name is $treatmentName");
      notifyListeners();

      print("hieght is $height");

      notifyListeners();
      print("treatemnt purchased is $treatmentPurchased $treatmentId");
    }
  }

  resetControls() {
    nameController.clear();
    addressController.clear();
    whatappNumberController.clear();
    totalAmountController.clear();
    discountAmountController.clear();
    advanceAmountController.clear();
    balanceAmountController.clear();
    _treatments = 0;
    _selectedFormatedTime = "";

    counters = List<int>.filled(3, 0);
    _treatmentMainId = [];
    _mensQuantity = [];
    _femaleQuantity = [];
    _treatmentName = [];

    notifyListeners();
  }

  void removeTreatmentDetails(int index) {
    if (index >= 0 && index < _treatmentPurchased.length) {
      _treatmentPurchased.removeAt(index);
      _mensQuantity.removeAt(index);
      _femaleQuantity.removeAt(index);
      _treatmentName.removeAt(index);
      _treatmentMainId.removeAt(index);
      _treatmentId.removeAt(index);

      notifyListeners();

      if (treatmentPurchased.length == 1) {
        _height = 100;
      } else if (treatmentPurchased.length == 2) {
        _height = 200;
      } else if (treatmentPurchased.length == 3) {
        _height = 300;
      } else if (treatmentPurchased.length == 4) {
        _height = 400;
      } else {
        _height = 100;
        notifyListeners();
      }
      print("treatmentPurchased length is ${treatmentPurchased.length}");
    }
  }

  void modifyTreatmentDetails(int index, Map<String, dynamic> newDetails) {
    if (index >= 0 && index < _treatmentPurchased.length) {
      _treatmentPurchased[index] = newDetails;
      notifyListeners();
    }
  }

  void registerData(
    SignInProvider signInProvider,
  ) async {
    String token = signInProvider.token;

    try {
      final registerService = RegisterService();
      final pdfService = PdfService();
      final formattedDate = "$selectedFormatedDate $selectedFormatedTime";

      final String mensQuanityString = mensQuantity.join(', ');

      final String femaleQuanityString = femaleQuantity.join(', ');

      final String treatmentNewid = treatmentId.join(', ');

      print("mensQuanityString $mensQuantity");
      print("femaleQuanityString $femaleQuantity");

      print("treatmentid $treatmentId");

      final List<String> treatments =
          treatmentPurchased.map((e) => e['treatment'].toString()).toList();

      await registerService.postDataToServer(
        signInProvider,
        nameController.text,
        selectedPaymentMethod.toString().split('.').last,
        whatappNumberController.text,
        addressController.text,
        totalAmountController.text,
        discountAmountController.text,
        advanceAmountController.text,
        balanceAmountController.text,
        formattedDate,
        mensQuanityString,
        femaleQuanityString,
        branchId,
        treatmentNewid,
      );

      final data = await pdfService.generatePdf(
          nameController.text,
          addressController.text,
          whatappNumberController.text,
          selectedFormatedDate,
          selectedFormatedDate,
          selectedFormatedTime,
          treatments,
          mensQuantity,
          femaleQuantity,
          totalAmountController.text,
          discountAmountController.text,
          advanceAmountController.text,
          balanceAmountController.text);

      await pdfService.savePdfFile("dummyFile", data);
    } catch (e) {
      print(e);
    }
  }
}
