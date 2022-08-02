class Endpoints {
  static const String baseURL = "https://sou.dc2ws002.zsoftware.tech/api/";

  static const String register = "register";
  static const String emailVerification ="email/verify";
  static const String login = "login";
  static const String forgotPassword = "password/email";
  static const String addBank ="add/bank";
  static const String resendOtp ="send/otp";

  static const String getEnvelopes ="get-envelopes";
  static const String getSavingFrequencies ="get-saving-frequencies";
  static const String getAmount ="get-amount";
  static const String getSavingCycle ="get-savingcycle";

  static const String editPlan ="edit-plan";
  static const String getPlan ="get-plans";
  static const String savePlan ="save-plan";

  static const String addFiles ="add-files";
  static const String deleteFiles ="delete-files";
  static const String bank ="bank/{id}";
  static const String categories ="resource/categories";
  static const String category ="resource/category/{id}";
  static const String resource ="resource/{id}";
  static const String search ="resource/search";
}
