const String loginEndPoint = '/api/auth/login';
const String signUpEndPoint = '/api/auth/signup';
const String forgotPasswordEndPoint = '/api/auth/forgot-password';
const String verifyCodeEndPoint = '/api/auth/user/verify';
const String resetCodeEndPoint = '/api/auth/user/resend-code';

// User Endpoints
const String currentUserEndPoint = '/api/auth/user/me';

// Station Endpoints
const String getStationByUserEndPoint = '/api/station/user/{userId}';
const String createStationEndPoint = '/api/station/create/user/{userId}';
const String getStationEndPoint = '/api/station/{stationId}';
const String updateStationEndPoint = '/api/station/update/{stationId}';
const String deleteStationEndPoint = '/api/station/delete/{stationId}';
const String getAllStationsEndPoint = '/api/station/allStations/ok';

// Bornes Endpoints
const String getBorneEndPoint = '/api/borne/{borneId}';

// Reservation Endpoints
const String createReservationEndPoint = '/api/reservation/create';
