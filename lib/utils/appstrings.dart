
class AppStrings {
 static const String token = 'TOKEN';
 static const String verify = "VERIFY";
 static const String signin = "Sign In";
 static const String signup = "Sign up";
 static const String skip = "Skip";
 static const String emailaccount = "Email Address";
 static const String password = "Password";
 static const String proceed = "Proceed";
 static const String next = "Next";
 static const String fullname = "Full Name";
 static const String dateofbirth = "Date of Birth";
 static const String socialno = "Social Security Number";
 static const String bank = "Bank";
 static const String bankName ="Bank Name";
 static const String accountname = "Account Name";
 static const String accountHolderName ="Account Holder Name";
 static const String accountnumber = "Account Number";
 static const String forgotpassword = "Forgot password";
 static const String acceptchallenge = "Accept Challenge";
 static const String topup = "TopUp";
 static const String home = "Home";
 static const String visitwebsite = "Visit Website";
 static const String saveplan = "Save Plan";
 static const String editplan = "Edit Plan";
 static const String cyclesummery = "Cycle Summary";
 static const String enterPassword ="Please enter password";
 static const String enterName = "Please enter name";
 static const String enterDob = "Please enter DOB";
 static const String enterSecurity = "Please enter Security";
 static const String enterBankName= "Enter Bank Name";
 static const String enterAccountHolderName= "Enter Account Holder name";
 static const String enterAccountNumber = "Enter Account Number";

 String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  // r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  // r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  // r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
   return 'Please Enter email id';
  } else if (!regex.hasMatch(value)) {
   return 'Please Enter a valid email id';
  } else
   return null;
 }

 String? FieldValidation(String value, String msg) {
  if (value == null || value.isEmpty) {
   return msg;
  } else
   return null;
 }
 }