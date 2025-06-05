

# 💼 Flutter Portfolio Web (with GetX)

A **responsive** and **scalable** personal portfolio application built using **Flutter** and **GetX** for clean architecture, effective state management, and structured routing.

---

## 📁 Project Structure

```
lib/
├── core/
│   └── constant/         # App-wide constants and configuration
│
├── globalwidgets/        # Shared reusable widgets (buttons, layouts, etc.)
│
├── presentation/         # Screens (views) and UI-specific logic
│
├── repository/           # Data access layer, APIs, or services
│
└── main.dart             # App entry point and initial bindings
```

---

## ⚙️ Tech Stack

* ✅ **Flutter** – UI toolkit
* ✅ **GetX** – State management, routing, and dependency injection
* ✅ **Clean Architecture** – Separation of concerns
* ✅ **Responsive Design** – Mobile, Web, and Desktop-ready

---

## 🚀 Getting Started

### ✅ Prerequisites

* [Flutter SDK](https://flutter.dev/docs/get-started/install)
* IDE like VS Code or Android Studio

### 📥 Installation

```bash
git clone https://github.com/txngerine/portfolio.git
cd portfolio
flutter pub get
flutter run
```

---

## 🧠 GetX Usage Overview

* **Routing**: `GetMaterialApp` in `main.dart`
* **Controllers**: For reactive logic (`Obx`, `.obs`)
* **Bindings**: To lazily load controllers
* **Navigation**: `Get.to()`, `Get.back()`

---

## 🔧 Modules Overview

* **`core/constant/`**: App-wide static values (colors, strings, dimensions)
* **`globalwidgets/`**: Widgets reused across screens for consistency
* **`presentation/`**: Contains the visual layout and view logic
* **`repository/`**: Will handle APIs, services, or mock data fetching

---

## 🧩 To-Do / Enhancements

* [ ] Add about section
* [ ] Add projects listing
* [ ] Add contact form with backend
* [ ] Improve mobile responsiveness
* [ ] Add theme switching (light/dark)

---

## 📸 Screenshots

> *Coming Soon — Add demo images or GIFs of your portfolio app.*

---

## 🤝 Contribution

Want to contribute? PRs are welcome!

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "Add your feature"`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

## 📜 License

This project is licensed under the **MIT License**.
© 2025 [txngerine](https://github.com/txngerine)

---

Let me know if you'd like to auto-generate the widget or controller documentation or include sample screenshots and icons!
