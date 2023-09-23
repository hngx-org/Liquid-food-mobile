import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../api.dart';
import '../repository/banks.dart';
import '../repository/model/accountDataModel.dart';
import '../repository/model/bankListModel.dart';
import '../styles/text_style.dart';
import '../widgets/refactoredForms.dart';



class AddAccountPage extends StatefulWidget {
  const AddAccountPage({Key? key}) : super(key: key);

  static const routeName = '/add-account-page';

  @override
  State<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  final TextEditingController _accountNumberController =
  TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();

  late FocusNode _accountNumberFocusNode;
  late FocusNode _accountNameFocusNode;
  late FocusNode _bankFocusNode;

  // AccountData? _formData;

  String? _selectedBank;

  List<BankListModel> banks = [];

  final ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
    _accountNumberFocusNode = FocusNode();
    _accountNameFocusNode = FocusNode();
    _bankFocusNode = FocusNode();

    _selectedBank = null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      apiService.fetchBanks().then((bankList) {
        setState(() {
          banks = bankList;
          _selectedBank = banks.isNotEmpty ? banks[0].bankName : null;
        });
      });
    });
  }

  @override
  void dispose() {
    _accountNumberFocusNode.dispose();
    _accountNameFocusNode.dispose();
    _bankFocusNode.dispose();
    super.dispose();
  }

  void _showFormDataDialog() {
    final formData = AccountData(
      accountNumber: _accountNumberController.text,
      accountName: _accountNameController.text,
      bank: _selectedBank ?? "",
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Your Account Information', style: TextStyle(color: Colors.blue, fontSize: 20),),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Account Number: ${formData.accountNumber}'),
              Text('Account Name: ${formData.accountName}'),
              Text('Bank: ${formData.bank}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Add account",
          style: AppTextStyle.appBar,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding:
        const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 30),
        child: ListView(
          children: [
            RefactoredForm(
              controller: _accountNumberController,
              label: "Account Number",
              hintText: "Enter your account number",
              focusNode: _accountNumberFocusNode,
              isNumeric: true,
              maxLength: 10,
              inputFormatter: [
                LengthLimitingTextInputFormatter(1)
              ], showDropdownIcon: false,
            ),
            SizedBox(
              height: 20,
            ),
            RefactoredForm(
              showDropdownIcon: false,
              controller: _accountNameController,
              label: "Account Name",
              hintText: "Enter your account name",
              focusNode: _accountNameFocusNode,
              isNumeric: false,
            ),

            SizedBox(
              height: 20,
            ),
            RefactoredForm(
              showDropdownIcon: true,
              controller: _bankController,
              label: "Select bank",
              hintText: "Select your bank",
              focusNode: _bankFocusNode,
              isNumeric: false,
              isDropdown: true, // Indicate it's a dropdown
              dropdownValue: _selectedBank,

              onChanged: (String? value) {
                setState(() {
                  _selectedBank = value;
                });
              },
              dropdownItems: banks.map((BankListModel bank) {

                return DropdownMenuItem<String>(
                  value: bank.bankName,
                  child: Text(bank.bankName),
                );
              }).toList(),
            ),

            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 250.0),
              child: ElevatedButton(
                onPressed: () {
                  /// Add Logic here
                  _showFormDataDialog();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

