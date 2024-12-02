/// Contains all the api endpoints
/// whenever backend server domain will be changed just update [baseUrl] and [baseUrlWebView]
/// [baseUrlWebView] is mainly used for opening in-app paypal webview

class ApiEndPoint {
  static String baseUrl = 'http://ec2-3-99-226-224.ca-central-1.compute.amazonaws.com/api';

  static String imageUrl = 'http://ec2-3-99-226-224.ca-central-1.compute.amazonaws.com/';

  // static String baseUrlWebView = 'https://mbl-backend.adveroos.net/';
  static String signUp = '$baseUrl/signup';
  static String checkUserNameUrl= '$baseUrl/users/check-userName';
  static String createUserProfile = '$baseUrl/users/update-profile';
  static String otpVerification = '$baseUrl/otp_verification';
  // static String getAllProfiles = '$baseUrl/profiles';
  static String sendConnectionReq = '$baseUrl/connections/send-request';
  static String sendOtp = '$baseUrl/users/send-otp';
  static String undoConnectionReq = '$baseUrl/connections/undo-request';
  static String getAllProfiles = '$baseUrl/profiles/get-profile-data';
  static String createProfile = '$baseUrl/profiles/create';
  static String getPendingRequests = '$baseUrl/connections/pending-request';
  static String acceptRequest = '$baseUrl/connections/accept-request';
  static String rejectRequest = '$baseUrl/connections/reject-request';
  static String getSingleProfile = '$baseUrl/profiles/';
  static String getProfileCompletionStatus = '$baseUrl/profiles/completion/';
  static String getUserMatrimonialProfile = '$baseUrl/profiles/get-user-matrimonial-profile';
  static String getConnections = '$baseUrl/connections/friends';
  static String updateMatriMonialProfile = '$baseUrl/profiles/update';
  static String deleteMatrimonialProfile = '$baseUrl/profiles/';

  static String removeConnection= '$baseUrl/connections/remove';
  static String searchQuery = '$baseUrl/profiles/search-in?searchTerm=';



  ///user_otp_verify
  static String verifyOtp = '$baseUrl/users/verify-otp';
}
