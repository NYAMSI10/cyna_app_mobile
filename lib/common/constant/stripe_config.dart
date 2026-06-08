/// Configuration Stripe pour l'application mobile.
///
/// ⚠️ IMPORTANT :
/// - Renseigne ici ta clé **publishable** Stripe (commence par `pk_test_...` en
///   test, `pk_live_...` en production). Tu la trouves dans le Dashboard Stripe :
///   Développeurs > Clés API.
/// - Elle doit appartenir au **même compte** que la clé secrète (`sk_...`)
///   utilisée par le backend.
/// - Ne mets JAMAIS la clé secrète (`sk_...`) ici : elle ne doit jamais sortir
///   du backend.
class StripeConfig {
  StripeConfig._();

  static const String publishableKey =
      'pk_test_51TI2oWHDMNyNr5MVENTPgMCh1957hIdFBn5pqLzc1RXnZeuUatMrdLFwPAEMTZziIELtQaHszelsfFLCRBRXClOL007h0zWsPT';
}
