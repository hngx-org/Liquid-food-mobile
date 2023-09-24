class APIService {
  // environment
  static const prod = 'https://liquid-food-backend-production.up.railway.app';

  // auth controller api
  static const staffsignupAPI = '/api/auth/staff/signup';
  static const refreshTokenAPI = '/api/auth/refresh-token';
  static const loginAPI = '/api/auth/login';
  static const forgotPasswordAPI = '/api/auth/forgot-password';
  static const resetPasswordAPI = '/api/auth/reset-password';
  static const adminsignupAPI = '/api/auth/admin/signup';

  // lunch controller
  static const sendLunchAPI = '/api/lunch/send';
  static const getlunchIdAPI = '/api/lunch/{id}';
  static const getLunchBalanceAPI = '/api/lunch/balance';
  static const getLunchHistoryAPI = '/api/lunch/all';

  // organization controller
  static const particularPersonAPI = '/api/organization/lunch';
  static const allStaffAPI = '/api/organization/lunch/staffs';
  static const inviteStaffAPI = '/api/organization/invite';

  // user controller
  static const withdrawalAPI = '/api/withdrawal/request';

  static String staffSignup = "$prod$staffsignupAPI";
  static String refreshToken = "$prod$refreshTokenAPI";
  static String login = "$prod$loginAPI";
  static String forgotPassword = "$prod$forgotPasswordAPI";
  static String resetPassword = "$prod$resetPasswordAPI";
  static String adminSignup = "$prod$adminsignupAPI";
  static String sendLunch = "$prod$sendLunchAPI";
  static String getLunchId = "$prod$getlunchIdAPI";
  static String getLunchBalance = "$prod$getLunchBalanceAPI";
  static String getLunchHistory = "$prod$getLunchHistoryAPI";
  static String particularPerson = "$prod$particularPersonAPI";
  static String allStaff = "$prod$allStaffAPI";
  static String inviteStaff = "$prod$inviteStaffAPI";
}
