const String loginEndPoint = '/api/auth/login';
const String signUpEndPoint = '/api/auth/signup';
const String forgotPasswordEndPoint = '/api/auth/forgot-password';
const String verifyCodeEndPoint = '/api/auth/user/verify';
const String resetCodeEndPoint = '/api/auth/user/resend-code';

// User Endpoints
const String currentUserEndPoint = '/api/auth/user/me';
const String updateUserEndPoint = '/api/users/profil/{id}';
const String changePasswordProfileEndPoint =
    '/api/users/profil/change-password';

// Categories Endpoints
const String getCategoriesByOrderEndPoint = '/api/categories/category-by-order';

// Products Endpoints
const String getProductsByOrderEndPoint = '/api/products/product-by-order';
const String getSimilarProductsEndPoint = '/api/products/similar/{categoryId}';

// Slider Endpoints
const String getSlidersEndPoint = '/api/sliders/sliderTop';

// Abonnement Endpoints
const String getAbonnementEndPoint = '/api/commandes/abonnements/by-user';

// Commande Endpoints
const String getCommandesEndPoint = '/api/commandes/by-user';
const String createCommandeEndPoint = '/api/commandes/create';
const String confirmPaymentEndPoint = '/api/commandes/payment/success';

// Adresse Endpoints
const String getAdressesEndPoint = '/api/adresse-facturations/by-user';
const String createAdresseEndPoint = '/api/adresse-facturations';
const String deleteAdresseEndPoint = '/api/adresse-facturations/{id}';
const String updateAdresseEndPoint = '/api/adresse-facturations/{id}';
const String setDefaultAdresseEndPoint =
    '/api/adresse-facturations/defaut/{id}';

// Carte Bancaire Endpoints
const String getCartesEndPoint = '/api/carte-bancaires/by-user';
const String setupIntentCarteEndPoint = '/api/carte-bancaires/setup-intent';
const String createCarteEndPoint = '/api/carte-bancaires';
const String deleteCarteEndPoint = '/api/carte-bancaires/{id}';
const String updateCarteEndPoint = '/api/carte-bancaires/{id}';
const String setDefaultCarteEndPoint = '/api/carte-bancaires/defaut/{id}';
