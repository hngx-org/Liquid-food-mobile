class AppUrl {
  static String baseUrl =
      'https://liquid-food-backend-production.up.railway.app/';

  //Post url
  static String get loginUrl => '${baseUrl}api/auth/login';
  static String get staffsignupUrl => '${baseUrl}api/auth/staff/signup';
  static String get refreshUrl => '${baseUrl}api/auth/refresh-token';
  static String get adminSignupUrl => '${baseUrl}api/auth/admin/signup';
  static String get sendLunch => '${baseUrl}api/lunch/send';
  static String get uploadImage => '${baseUrl}api/user/upload-image';
  static String get withdrawal => '${baseUrl}api/withdrawal/request';

  //Get url
  static String get lunchById => '${baseUrl}api/lunch/';
  static String get lunchBalance => '${baseUrl}api/lunch/balance';
  static String get lunchAll => '${baseUrl}api/lunch/all';
  static String get orgInvite => '${baseUrl}api/organization/invite';
  static String get orgLunch => '${baseUrl}api/organization/lunch';
  static String get userBank => '${baseUrl}api/user/bank';
  static String get searchUser => '${baseUrl}api/user/search/';
  static String get userProfile => '${baseUrl}api/user/profile';
  static String get userBankDetails => '${baseUrl}api/user/bank-details';
  static String get userAll => '${baseUrl}api/user/all';
}
