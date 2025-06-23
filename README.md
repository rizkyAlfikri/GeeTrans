GeeTrans 🚗
A Flutter-based ride-handling application.

GeeTrans enables users to request rides, track drivers, and manage trip history across Android, iOS, and Web platforms.

🧭 Features
Request and dispatch rides

Real-time trip tracking with maps

Animated driver arrival status

Trip history and receipts

Cross-platform support: Android, iOS, and Web

⚙️ Architecture & Tech Stack
Flutter (Dart): UI and cross-platform logic

State management: Bloc / Provider / Riverpod (adjust to match code)

Platform support:

Android (android/)

iOS (ios/)

Core modules in lib/ folder:

models/: Data models (e.g., Ride, User, Driver)

services/: APIs, location & backend communication

screens/: Screens like Map, Booking, History

widgets/: UI components (buttons, maps, cards)

Testing: Unit and widget tests in test/

🚀 Getting Started
Install Flutter SDK – follow Flutter installation guide.

Clone the repo

bash
Copy
Edit
git clone https://github.com/rizkyAlfikri/GeeTrans.git
cd GeeTrans
Install dependencies

bash
Copy
Edit
flutter pub get
Configure backend/API keys

Update API endpoints or keys (in lib/services/config.dart)

Add Google Maps API key to android/app/src/main/AndroidManifest.xml and ios/Runner/Info.plist

Run the app

Android: flutter run -d android

iOS: flutter run -d ios

Web: flutter run -d chrome

🧪 Running Tests
bash
Copy
Edit
flutter test
This will execute all unit and widget tests in the test/ directory.

🧩 Project Structure
bash
Copy
Edit
GeeTrans/
├── android/
├── ios/
├── web/
├── lib/
│   ├── models/       # Data models (Ride, User, etc.)
│   ├── services/     # API and backend services
│   ├── screens/      # UI screens
│   └── widgets/      # Reusable components
├── test/             # Tests
├── pubspec.yaml      # Dependencies
└── README.md
👥 Contributing
Interested in helping? Awesome!

Fork the repo

Create a branch: git checkout -b feature/your-feature

Commit your changes: git commit -m "Add awesome feature"

Push and open a pull request

📄 License
This project is licensed under the MIT License.
© 2025 rizkyAlfikri
