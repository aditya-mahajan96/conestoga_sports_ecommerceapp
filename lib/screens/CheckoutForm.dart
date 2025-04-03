import 'package:flutter/material.dart';
import 'package:etlaafinalproject/utils/constants.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({super.key});

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _creditcardNumberController = TextEditingController();
  final _cvvController = TextEditingController();
  final _expiryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.hintColor,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 20.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: MyColors.blueColor,
            title: Center(child: CommonTextWidget(text: AppStrings.checkoutForm, fontSize: Dimens.eighteen, fontWeight: FontWeight.w600, fontColor: Colors.white)),
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: Dimens.ten, horizontal: Dimens.twenty),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                hSizedBox2,
                CommonTextWidget(
                  fontSize: Dimens.sixteen,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w600,
                  text: AppStrings.enterFirstName,
                ),
                hSizedBox,
                CustomTextFieldNew(
                  readOnly: false,
                  onChangedTap: (test) {},
                  maxLength: 50,
                  fontSize: Dimens.fourteen,
                  obscureText: false,
                  maxlines: Dimens.one,
                  margin: 0,

                  textEditingController: _firstNameController,
                  hintText: AppStrings.enterYourFirstName,
                  borderRadius: Dimens.thirty,
                  textInputAction: TextInputAction.next,
                  keyboardShow: TextInputType.name,
                  themeColor: Colors.white,
                  textColor: Colors.black,
                  hintStyle: TextStyle(color: Colors.grey),
                  borderColor: Colors.white,
                  contentpadding: EdgeInsets.only(left: Dimens.ten, right: Dimens.ten, top: Dimens.ten),
                  onValidate: (value) {
                    return null;
                  },
                ),
                hSizedBox2,
                CommonTextWidget(
                  fontSize: Dimens.sixteen,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w600,
                  text: AppStrings.enterLastName,
                ),
                hSizedBox,
                CustomTextFieldNew(
                  readOnly: false,
                  onChangedTap: (test) {},
                  maxLength: 50,
                  fontSize: Dimens.fourteen,
                  obscureText: false,
                  maxlines: Dimens.one,
                  margin: 0,
                  keyboardShow: TextInputType.name,
                  textEditingController: _lastNameController,
                  hintText: AppStrings.enterYourLastName,
                  borderRadius: Dimens.thirty,
                  themeColor: Colors.white,
                  textColor: Colors.black,
                  hintStyle: TextStyle(color: Colors.grey),
                  borderColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  contentpadding: EdgeInsets.only(left: Dimens.ten, right: Dimens.ten, top: Dimens.ten),
                  onValidate: (value) {
                    return null;
                  },
                ),
                hSizedBox2,
                CommonTextWidget(
                  fontSize: Dimens.sixteen,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w600,
                  text: AppStrings.phoneNumber,
                ),
                hSizedBox,
                CustomTextFieldNew(
                  readOnly: false,
                  onChangedTap: (test) {},
                  maxLength: 11,
                  fontSize: Dimens.fourteen,
                  obscureText: false,
                  maxlines: Dimens.one,
                  margin: 0,
                  keyboardShow: TextInputType.number,
                  textEditingController: _phoneNumberController,
                  hintText: AppStrings.enterPhonenumber,
                  borderRadius: Dimens.thirty,
                  themeColor: Colors.white,
                  textColor: Colors.black,
                  hintStyle: TextStyle(color: Colors.grey),
                  borderColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  contentpadding: EdgeInsets.only(left: Dimens.ten, right: Dimens.ten, top: Dimens.ten),
                  onValidate: (value) {
                    return null;
                  },
                ),
                hSizedBox3,
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(Dimens.ten),
                  color: MyColors.checkColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                        textAlignment: TextAlign.center,
                        fontSize: Dimens.twenty,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.w600,
                        text: AppStrings.creditcardetails,
                      ),
                      Icon(Icons.credit_card, color: Colors.white)
                    ],
                  ),
                ),
                hSizedBox2,
                CommonTextWidget(
                  fontSize: Dimens.sixteen,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w600,
                  text: AppStrings.creditcard,
                ),
                hSizedBox,
                CustomTextFieldNew(
                  readOnly: false,
                  onChangedTap: (test) {},
                  maxLength: 16,
                  fontSize: Dimens.fourteen,
                  obscureText: false,
                  maxlines: Dimens.one,
                  margin: 0,
                  keyboardShow: TextInputType.number,
                  textEditingController: _creditcardNumberController,
                  hintText: AppStrings.entercreditnumber,
                  borderRadius: Dimens.thirty,
                  themeColor: Colors.white,
                  textColor: Colors.black,
                  hintStyle: TextStyle(color: Colors.grey),
                  borderColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  contentpadding: EdgeInsets.only(left: Dimens.ten, right: Dimens.ten, top: Dimens.ten),
                  onValidate: (value) {
                    return null;
                  },
                ),
                hSizedBox2,
                CommonTextWidget(
                  fontSize: Dimens.sixteen,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w600,
                  text: AppStrings.cvv,
                ),
                hSizedBox,
                CustomTextFieldNew(
                  readOnly: false,
                  onChangedTap: (test) {},
                  maxLength: 4,
                  fontSize: Dimens.fourteen,
                  obscureText: true,
                  maxlines: Dimens.one,
                  margin: 0,
                  keyboardShow: TextInputType.number,
                  textEditingController: _cvvController,
                  hintText: AppStrings.entercvv,
                  borderRadius: Dimens.thirty,
                  themeColor: Colors.white,
                  textColor: Colors.black,
                  hintStyle: TextStyle(color: Colors.grey),
                  borderColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  contentpadding: EdgeInsets.only(left: Dimens.ten, right: Dimens.ten, top: Dimens.ten),
                  onValidate: (value) {
                    return null;
                  },
                ),
                hSizedBox2,
                CommonTextWidget(
                  fontSize: Dimens.sixteen,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w600,
                  text: AppStrings.Expirydetails,
                ),
                hSizedBox,
                CustomTextFieldNew(
                  readOnly: false,
                  onChangedTap: (test) {},
                  maxLength: 6,
                  fontSize: Dimens.fourteen,
                  obscureText: false,
                  maxlines: Dimens.one,
                  margin: 0,
                  keyboardShow: TextInputType.number,
                  textEditingController: _expiryController,
                  hintText: AppStrings.enterexpirydetails,
                  borderRadius: Dimens.thirty,
                  themeColor: Colors.white,
                  textColor: Colors.black,
                  hintStyle: TextStyle(color: Colors.grey),
                  borderColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  contentpadding: EdgeInsets.only(left: Dimens.ten, right: Dimens.ten, top: Dimens.ten),
                  onValidate: (value) {
                    return null;
                  },
                ),
                hSizedBox3,
                CommonButton(
                    haveShadow: false,
                    paddingValues: EdgeInsets.symmetric(horizontal: Dimens.ten, vertical: Dimens.twenty),
                    text: AppStrings.paynow,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimens.fourteen,
                    fontColor: Colors.white,
                    color: MyColors.blueColor,
                    onWidgetClicked: () {
                      if (isAllFilled()) {
                        displaySnackBar(message: AppStrings.thankyou, contextV: context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Productslistscreen()));

                      }
                    }),
              ]))),
    );
  }

  bool isAllFilled() {
    if (_firstNameController.text.isEmpty) {
      displaySnackBar(message: AppStrings.enterYourFirstName, contextV: context);
      return false;
    } else if (_lastNameController.text.isEmpty) {
      displaySnackBar(message: AppStrings.enterYourLastName, contextV: context);
      return false;
    } else if (_phoneNumberController.text.isEmpty) {
      displaySnackBar(message: AppStrings.enterPhonenumber, contextV: context);
      return false;
    } else if (_phoneNumberController.text.length < 10) {
      displaySnackBar(message: AppStrings.enterValidPhone, contextV: context);
      return false;
    } else if (_creditcardNumberController.text.isEmpty) {
      displaySnackBar(message: AppStrings.entercreditnumber, contextV: context);
      return false;
    } else if (_creditcardNumberController.text.length < 16) {
      displaySnackBar(message: AppStrings.enterValidCredit, contextV: context);
      return false;
    } else if (_cvvController.text.isEmpty) {
      displaySnackBar(message: AppStrings.entercvv, contextV: context);
      return false;
    } else if (_cvvController.text.length < 3) {
      displaySnackBar(message: AppStrings.enterValidCvv, contextV: context);
      return false;
    } else if (_expiryController.text.isEmpty) {
      displaySnackBar(message: AppStrings.enterexpirydetails, contextV: context);
      return false;
    }

    return true;
  }

  static void displaySnackBar({required String message, required contextV}) {
    ScaffoldMessenger.of(contextV).showSnackBar(SnackBar(
      backgroundColor: message==AppStrings.thankyou?Colors.green:Colors.red,
      content: Text(message),
    ));
  }
}
