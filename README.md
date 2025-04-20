# Product Listing App

A Flutter application that displays a list of products using Clean Architecture and BLoC pattern.

## Features

- Clean Architecture implementation
- BLoC pattern for state management
- Dio for network requests with interceptors
- Shared Preferences for local storage
- Error handling and logging
- Responsive UI design
- Dark/Light theme support
- Product search functionality
- Product details view

## Project Structure

### Core Layer
```
lib/core/
├── cached/                 # Local storage management
│   └── cache_helper.dart   # SharedPreferences wrapper
├── constants/              # App constants
│   └── endpoints_strings.dart
├── di/                     # Dependency injection
│   └── injection_container.dart
├── error/                  # Error handling
│   └── exceptions.dart
├── network/                # Network layer
│   ├── api_consumer.dart   # API interface
│   ├── api_interceptors.dart
│   └── dio_consumer.dart   # Dio implementation
├── router/                 # Navigation
│   └── router.dart
├── theme/                  # App theming
│   └── theme.dart
└── utils/                  # Utilities
    └── app_strings.dart    # App strings
```

### Features Layer
```
lib/features/products/
├── data/                   # Data layer
│   ├── datasources/        # Data sources
│   │   └── product_remote_data_source.dart
│   ├── models/             # Data models
│   │   └── product_model.dart
│   └── repositories/       # Repositories
│       └── product_repository_impl.dart
├── domain/                 # Domain layer
│   ├── entities/           # Business entities
│   │   └── product.dart
│   ├── repositories/       # Repository interfaces
│   │   └── product_repository.dart
│   └── usecases/          # Use cases
│       └── get_products.dart
└── presentation/           # Presentation layer
    ├── bloc/              # BLoC implementation
    │   └── product_bloc.dart
    └── pages/             # UI pages
        ├── product_details_page.dart
        └── products_page.dart
```

## Implementation Details

### Network Layer
- Uses Dio for HTTP requests
- Implements interceptors for:
  - Authentication
  - Logging
  - Error handling
- Supports all HTTP methods (GET, POST, PUT, PATCH, DELETE)
- Handles form data and file uploads

### State Management
- Uses BLoC pattern
- Implements:
  - Product listing state
  - Product details state
  - Error states
  - Loading states

### Data Layer
- Implements repository pattern
- Uses remote data source for API calls
- Maps API responses to domain entities
- Handles error cases

### UI Components
- Responsive design
- Dark/Light theme support
- Product list view
- Product details view
- Search functionality
- Error handling UI
- Loading states

## Dependencies

- flutter_bloc: ^8.1.4 - State management
- dio: ^5.4.0 - HTTP client
- get_it: ^7.6.7 - Dependency injection
- shared_preferences: ^2.2.2 - Local storage
- equatable: ^2.0.5 - Equality comparison
- dartz: ^0.10.1 - Functional programming
- go_router: ^13.2.0 - Navigation
- intl: ^0.19.0 - Internationalization

## API Integration

The app uses the Fake Store API:
- Base URL: https://fakestoreapi.com
- Endpoints:
  - GET /products - Get all products
  - GET /products/{id} - Get product details

## Error Handling

The app implements comprehensive error handling:
- Network errors (timeout, connection, etc.)
- Server errors (4xx, 5xx)
- Local storage errors
- UI error states with retry functionality
- Custom exception handling

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request


