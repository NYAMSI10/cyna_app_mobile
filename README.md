# Cyna App Mobile

Application mobile de la plateforme SaaS de cybersécurité **Cyna**. Construite avec Flutter et Riverpod.

---

## Stack technique

| Outil | Version | Rôle |
| --- | --- | --- |
| Flutter | ≥ 3.x | Framework UI cross-platform |
| Dart SDK | ≥ 3.1.0 | Langage |
| Riverpod | 3.1 | Gestion d'état global |
| Retrofit + Dio | 4.9 / 5.9 | Requêtes HTTP vers l'API |
| Go Router | 17.x | Navigation déclarative |
| Freezed | 3.2 | Modèles immuables (codegen) |
| Flutter Secure Storage | 10.x | Stockage sécurisé des tokens JWT |
| Flutter Stripe | 13.x | Paiements Stripe |
| Google Fonts | 8.x | Typographies |
| Google Maps Flutter | 2.14 | Cartographie |
| Toastification | 3.x | Notifications in-app |
| PDF + Printing | 3.12 / 5.14 | Génération et impression de PDF |

---

## Prérequis

- **Flutter** ≥ 3.1.0 ([guide d'installation](https://docs.flutter.dev/get-started/install))
- **Dart SDK** ≥ 3.1.0 (inclus avec Flutter)
- **Android Studio** ou **Xcode** (pour les émulateurs)
- Le **backend Cyna** démarré sur <http://localhost:3000> (voir `cyna_backend/`)

Vérifier l'installation :

```bash
flutter doctor
```

---

## Installation

```bash
# 1. Se placer dans le dossier mobile
cd cyna_app_mobile

# 2. Installer les dépendances
flutter pub get

# 3. Générer les fichiers de code (Freezed, Retrofit, Riverpod)
dart run build_runner build --delete-conflicting-outputs
```

---

## Lancer l'application

```bash
# Lister les appareils disponibles (émulateurs / physiques)
flutter devices

# Lancer sur un appareil spécifique
flutter run -d <device_id>

# Lancer en mode debug (appareil par défaut)
flutter run
```

---

## Commandes disponibles

| Commande | Description |
| --- | --- |
| `flutter run` | Lance l'application en mode debug |
| `flutter run --release` | Lance en mode release (optimisé) |
| `flutter build apk` | Compile un APK Android |
| `flutter build ios` | Compile pour iOS (macOS requis) |
| `flutter test` | Lance les tests unitaires et widgets |
| `flutter pub get` | Installe les dépendances |
| `dart run build_runner build` | Régénère les fichiers codegen |
| `dart run build_runner watch` | Régénère en mode watch |

---

## Configuration de l'API

L'URL de base de l'API est définie dans `lib/core/constant/` ou dans le client Dio. Pour pointer vers le backend local :

```dart
// lib/core/data/ — client Dio
const String baseUrl = 'http://10.0.2.2:3000/api'; // Émulateur Android
// ou
const String baseUrl = 'http://localhost:3000/api'; // iOS / appareil physique
```

> Sur émulateur Android, `10.0.2.2` correspond à `localhost` de la machine hôte.

---

## Structure du projet

```text
cyna_app_mobile/
├── assets/
│   ├── logos/              # Logo et splash screen
│   └── images/             # Illustrations
├── lib/
│   ├── features/           # Modules fonctionnels (Clean Architecture)
│   │   ├── authentication/ # Connexion, inscription, OTP
│   │   ├── home/           # Page d'accueil, sliders, catégories
│   │   ├── product-detail/ # Détail d'un produit
│   │   ├── category/       # Liste des catégories
│   │   ├── panier/         # Panier d'achat
│   │   ├── checkout/       # Processus de paiement (Stripe)
│   │   ├── commande/       # Historique des commandes
│   │   ├── abonnement/     # Gestion des abonnements
│   │   ├── carte_bancaire/ # Cartes bancaires
│   │   ├── adresse/        # Adresses de facturation
│   │   ├── onboarding/     # Écrans d'introduction
│   │   └── profile/        # Profil utilisateur
│   ├── core/               # Couche technique transversale
│   │   ├── data/           # Client Dio, intercepteurs
│   │   ├── provider/       # Providers Riverpod globaux
│   │   ├── route/          # Configuration Go Router
│   │   ├── model/          # Modèles partagés
│   │   ├── constant/       # Constantes (URLs, clés…)
│   │   ├── extension/      # Extensions Dart
│   │   ├── helpers/        # Fonctions utilitaires
│   │   └── widgets/        # Widgets réutilisables
│   ├── common/             # Exceptions, modèles communs
│   ├── navigation_menu.dart # Barre de navigation principale
│   └── main.dart           # Point d'entrée Flutter
├── android/                # Configuration Android native
├── ios/                    # Configuration iOS native
├── pubspec.yaml            # Dépendances et assets
└── analysis_options.yaml   # Règles de lint Dart
```

---

## Génération du code

Ce projet utilise **Freezed**, **Retrofit** et **Riverpod Generator**. Après toute modification d'un modèle ou d'un service annoté, relancer :

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Build de production

```bash
# APK Android (release)
flutter build apk --release

# App Bundle Android (recommandé pour le Play Store)
flutter build appbundle --release

# iOS (macOS requis)
flutter build ios --release
```

Les artefacts sont générés dans `build/app/outputs/`.
