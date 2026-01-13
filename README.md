# Minimalist Expense Tracker

A clean and distraction free expense tracking app built with Flutter. The goal of this project is to practice state management, local persistence, and UI structuring while keeping the design minimal and focused on usability.

## Features

* Add daily expenses with category, amount, and date
* View total spending for the current week
* Weekly bar graph overview
* Categorized expense list
* Local data persistence using Hive
* Simple and minimal UI with smooth interactions

## Screens

The app focuses on a single primary screen that shows

* Weekly total spending
* A bar graph representing daily expenses
* A list of expenses grouped by date
* A floating action button to add new expenses

## Tech Stack

* Flutter
* Dart
* Provider for state management
* Hive for local storage

## Project Structure

```
lib/
│
├── bar_graph/       # Weekly expense bar chart widgets
├── data/            # Expense data source and providers
├── datetime/        # Date and time helper functions
├── models/          # Expense model classes
├── pages/           # App screens
├── widgets/         # Reusable UI components
└── main.dart        # App entry point
```

## State Management

The app uses Provider with ChangeNotifier to manage expense data. UI widgets rebuild automatically when expense data changes, keeping the logic clean and reactive.

## Data Persistence

Hive is used as a lightweight local database to store expenses on the device. All data remains available after app restarts without requiring an internet connection.

## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Run the app using `flutter run`

Make sure Flutter and Dart are properly installed on your system.

## Learning Goals

* Understanding Provider and ChangeNotifier patterns
* Working with local databases in Flutter
* Structuring a scalable Flutter project
* Building clean and minimal UI layouts


## License

This project is open source and available for learning and personal use.
