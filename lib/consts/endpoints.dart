class Endpoints {
  static String baseUrl = "https://sanjay-tiwari-backend.vercel.app";
  static String registerUser = "/api/user/register";
  static String verifyOtp = "/api/user/verify/668933964bbddd8b44face8e";
  static String resendOtp = "api/user/resend/650d2bc9540d5ae5cd499869";
  static String forgetPassword = "api/user/forgetPassword";
  static String forgetVerifyOtp = "api/user/forgotVerifyotp";
  static String changePassword =
      "api/user/changePassword/668933964bbddd8b44face8e";
  static String getUserProfile = "/api/user/profile";
  static String getUserProfileById = "/api/user/users/6687dbbc452b9ba48d9f7795";
  static String updateProfile = "/api/user/update";
  static String uploadProfilePicture = "/api/user/upload-profile-picture";
  static String deleteUser = "/api/user/users/65166718a9d6ed4607f5336a";
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
