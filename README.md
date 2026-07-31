
# Flutter Notes App (BLoC + SQLite)

A production-focused Flutter application demonstrating local data persistence using SQLite combined with BLoC state management for scalable architecture.

This project showcases how to build a fully offline-capable notes app with clean separation between UI, business logic, and database layer.

---

## Overview

The Notes App allows users to create, update, delete, and manage notes efficiently using a local database.

It is designed with:

* Offline-first architecture
* Reactive state management (BLoC)
* Persistent local storage (SQLite)

SQLite is commonly used in Flutter apps for structured local data storage and supports full CRUD operations.

---

## Architecture

This project follows a layered and feature-based architecture:

```
lib/
│
├── core/                # Utilities, constants
├── data/                # Database (SQLite), models, repositories
├── domain/              # Business logic, use cases
├── presentation/        # UI + BLoC
│   ├── bloc/
│   ├── screens/
│   └── widgets/
│
└── main.dart
```

### Key Design Principles

* Separation of concerns
* Scalable state management
* Clean and testable codebase

---

## Tech Stack

* Flutter
* Dart
* BLoC (flutter_bloc) – structured state management
* SQLite (sqflite) – local persistent storage
* Repository Pattern

---

## Features

* Create, update, delete notes (CRUD)
* Offline data persistence using SQLite
* Reactive UI updates via BLoC
* Search and filter notes (if implemented)
* Clean and responsive UI
* Efficient state handling

---

## Getting Started

### Clone the repository

```bash
git clone https://github.com/pragati-flutter/bloc_sqlite_notes_app.git
cd bloc_sqlite_notes_app
```

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

---

## Project Highlights

* Integration of BLoC with local database
* Clean handling of asynchronous database operations
* Scalable Flutter architecture
* Decoupled UI and data layers

---

## Future Improvements

* Unit and widget testing
* Note categorization or tagging
* Cloud sync (Firebase or REST API)
* Dark mode support
* Backup and restore functionality



