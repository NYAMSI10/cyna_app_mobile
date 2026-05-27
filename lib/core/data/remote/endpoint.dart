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

// Slider Endpoints
const String getSlidersEndPoint = '/api/sliders/sliderTop';

// Abonnement Endpoints
const String getAbonnementEndPoint = '/api/commandes/abonnements/by-user';

// Commande Endpoints
const String getCommandesEndPoint = '/api/commandes/by-user';

// Adresse Endpoints
const String getAdressesEndPoint = '/api/adresse-facturations/by-user';
const String createAdresseEndPoint = '/api/adresse-facturations';
const String deleteAdresseEndPoint = '/api/adresse-facturations/{id}';
const String updateAdresseEndPoint = '/api/adresse-facturations/{id}';
const String setDefaultAdresseEndPoint =
    '/api/adresse-facturations/defaut/{id}';
