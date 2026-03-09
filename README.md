# Expense Tracker – Receipt Scanner App

## Overview

Expense Tracker เป็นแอป Flutter สำหรับสแกนใบเสร็จและบันทึกรายจ่าย โดยผู้ใช้สามารถถ่ายรูปใบเสร็จ เพิ่มข้อมูลค่าใช้จ่าย และดูรายละเอียดรายการได้

โปรเจกต์นี้พัฒนาโดยใช้ **Clean Architecture** และ **BLoC State Management** เพื่อแยกความรับผิดชอบของโค้ดให้ชัดเจนและง่ายต่อการขยายในอนาคต

---

## Features

* Scan receipt using device camera
* Mock OCR to extract receipt text
* Add new expense record
* View expense detail with receipt image
* Offline usage (no internet required)
* Hero animation for receipt preview
* Unit & widget testing

---

## Architecture

This project follows **Clean Architecture** principles.

Layer structure:

```
lib/
 ├── core/
 │   └── di/
 │
 ├── features/
 │   └── expense/
 │       ├── data/
 │       ├── domain/
 │       └── presentation/
 │           ├── bloc/
 │           └── pages/
 │
 ├── providers/
 ├── routes/
 └── main.dart
```

### Layers

**Presentation Layer**

* UI pages
* BLoC state management
* User interactions

**Domain Layer**

* Business logic
* Entities
* Use cases

**Data Layer**

* Repository implementations
* Data sources

---

## Packages Used

* flutter_bloc
* auto_route
* image_picker
* provider

---

## How to Run

### 1. Clone Repository

```
git clone https://github.com/YOUR_USERNAME/expense-tracker.git
```

### 2. Install Dependencies

```
flutter pub get
```

### 3. Run the App

```
flutter run
```

For Android device or emulator.

---

## Testing

Run all tests using:

```
flutter test
```

Expected output:

```
All tests passed
```

---

## Notes

* The OCR functionality is currently **mocked** for demonstration purposes.
* No API keys are stored in the source code.
* The application is designed to work **offline**.

---

## Demo

The demonstration video shows:

* Receipt scanning
* Adding expense
* Viewing expense detail
* Animation
* Running automated tests

---

## Author

Developed as part of a Flutter application assignment.
