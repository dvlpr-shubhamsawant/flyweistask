class Endpoints {
  static String baseUrl = "https://sanjay-tiwari-backend.vercel.app";
  static String registerUser = "/api/user/register";
  static String login = "/api/user/login";
  static String verifyOtp = "/api/user/verify/";
  static String resendOtp = "/api/user/resend/";
  static String forgetPassword = "api/user/forgetPassword";
  static String forgetVerifyOtp = "api/user/forgotVerifyotp";
  static String changePassword = "api/user/changePassword/";
  static String getUserProfile = "/api/user/profile";
  static String getUserProfileById = "/api/user/users/";
  static String updateProfile = "/api/user/update";
  static String uploadProfilePicture = "/api/user/upload-profile-picture";
  static String deleteUser = "/api/user/users/";
  static String uploadId = "api/user/upload-id-picture";
  static String addShopDetails = "api/user/update-documents";
  static String updateBankDetails = "api/user/updateBankDetails";

  static String addToCart = "/api/user/cart/add";
  static String getCart = "/api/user/cart/get";
  static String updateCartItem = "/api/user/cart/update";
  static String updateCartItemQuantity = "/api/user/cart/updateQuantity";
  static String deleteAllCart = "/api/user/cart/delete";
  static String deleteItemCart = "/api/user/cart/products";
  static String applyCouponInCart = "/api/user/cart/apply-coupon";
  static String deleteCouponInCart = "/api/user/cart/delete-apply-coupon";
  static String getAllCoupons = "/api/user/coupon";

  static String getAllProducts = "/api/user/products";
}
