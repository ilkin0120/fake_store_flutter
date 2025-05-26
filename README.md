# Fake Store Project

A simple e-commerce application built with Flutter, demonstrating Clean Architecture principles and utilizing the FakeStoreAPI.

## Features

- 🛍️ Browse a catalog of products fetched from [FakeStoreAPI](https://fakestoreapi.com/)
- 📄 View detailed information about each product including price, category, and rating
- ❤️ Add or remove products from the Wishlist with instant UI feedback
- 🧺 Add products to Cart and adjust quantity with +/– buttons
- 👆 Swipe-to-delete functionality in Cart using Dismissible
- 📦 View total price summary and checkout button in Cart
- 🎨 Fully customizable color scheme via context extensions (`context.color`, `context.text`)
- ♻️ Lazy loading of products with pagination
- 🧱 Built with clean architecture: separation of concerns (data, domain, presentation)
- 📦 Uses `freezed` and `json_serializable` for immutable data modeling and API parsing

## Architecture

The project follows the principles of Clean Architecture, separating concerns into distinct layers:

- **Presentation Layer**: Handles the UI and user interaction (likely in `lib/presentation`). Uses BLoC for state management (based on `lib/bloc` directory).
- **Domain Layer**: Contains the core business logic and entities (in `lib/domain`). Entities are likely defined using `freezed`.
- **Data Layer**: Responsible for data fetching and storage (in `lib/data`). Interacts with remote data sources (FakeStoreAPI) and potentially local storage. Data models for serialization are defined here, likely using `json_serializable`.

## Technologies Used

- **Freezed**: Code generator for data classes, unions, and pattern-matching.
- **JsonSerializable**: Code generator for automatic JSON serialization/deserialization.
- **BLoC**: State management pattern (inferred from directory structure).
- **Dio/http**: (Likely used for API calls, need to confirm or mention as probable).

## Project Structure

```
. faker-store/
├── android/
├── ios/
├── lib/
│   ├── bloc/           # BLoC implementations
│   ├── common/         # Common utilities/widgets
│   ├── data/           # Data layer (models, datasources, repositories)
│   │   ├── datasources/
│   │   ├── models/
│   │   └── repositories/
│   ├── domain/         # Domain layer (entities, repositories, usecases)
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── usecases/
│   ├── presentation/   # Presentation layer (UI, widgets, pages)
│   ├── routes/         # Navigation routes
│   ├── styles/         # Styling definitions
│   └── themes/         # Theme definitions
├── assets/
├── test/
├── pubspec.yaml        # Project dependencies
├── pubspec.lock
├── analysis_options.yaml # Linting rules
└── README.md           # Project README
```

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/ilkin0120/fake_store_flutter.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run code generation:
```bash
flutter pub run build_runner build
```

4. Run the app:
```bash
flutter run
```