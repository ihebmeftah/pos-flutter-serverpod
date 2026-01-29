# POS Flutter Serverpod

## Getting Started

### Prerequisites

- Dart SDK (^3.8.0)
- Flutter SDK
- Docker and Docker Compose
- Git

### Setup Instructions

1. **Clone the project**

   ```bash
   git clone <repository-url>
   cd pos-flutter-serverpod
   ```

2. **Switch to the alpha branch**

   ```bash
   git checkout alpha
   ```

3. **Install dependencies**

   > **Note:** Install Dart dependencies from the `pubspec.yaml` files in `pos_client`, `pos_flutter`, and `pos_server` directories.

4. **Start Docker services**

   ```bash
   docker compose up --build --detach
   ```

5. **Generate Serverpod code**

   ```bash
   cd pos_server
   serverpod generate
   ```

6. **Apply migrations and Seed the database**

   ```bash
   cd pos_server
   serverpod run seed
   cd ..
   ```

   > **Note:** You can use pgAdmin to consult and manage the database.  
   > For information about seeded test accounts, see [TEST-ACCOUNTS.MD](TEST-ACCOUNTS.MD). > For information about seeded test accounts, see [TEST-ACCOUNTS.MD](TEST-ACCOUNTS.MD).

7. **run serverpod**

   ```bash
   serverpod run start
   ```

   The server should now be running and ready to use!The server should now be running and ready to use!

8. **Run the Flutter application**

   Navigate to the Flutter project:

   ```bash
   cd pos_flutter
   ```

   Choose your platform:
   - **Web:**

     ```bash
     flutter run -d web-server --web-port=8888
     ```

   - **Android:**

     ```bash
     flutter run -d android
     ```

   - **iOS:**

     ```bash
     flutter run -d ios
     ```

---

### Important Notes

> **Using a Real Device:** If you're running the app on a real device (Android/iOS), you need to update the `config.json` file located in `pos_flutter/assets/` and change `localhost` to your PC's IP address.
