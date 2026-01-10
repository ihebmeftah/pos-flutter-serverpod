# POS Flutter Serverpod

A modern, full-stack Point of Sale (POS) system built with Flutter and Serverpod. This application provides a complete restaurant/retail management solution with multi-building support, real-time order processing, inventory management, and employee administration.

## 🚀 Features

### Authentication & User Management

- **Secure Authentication**: Email/password authentication with verification
- **Role-based Access Control**: Admin and staff user roles with different permissions
- **User Profiles**: Complete user profile management with scope-based authorization

### Building Management

- **Multi-location Support**: Manage multiple buildings/locations from a single interface
- **Building Configuration**: Set opening/closing times, addresses, and operational settings
- **Multi-order Tables**: Support for handling multiple orders per table (configurable per building)

### Inventory Management

- **Article/Product Management**: Complete CRUD operations for products and articles
- **Category Management**: Organize products into categories for easy navigation
- **Stock Tracking**: Monitor inventory levels across different locations

### Order Processing

- **Table Management**: Assign and track orders by table
- **Order Creation & Tracking**: Create, modify, and track orders in real-time
- **Multi-order Support**: Handle multiple orders per table simultaneously (when enabled)

### Employee Management

- **Employee Records**: Maintain detailed employee information
- **Employee Details**: Track employee roles, assignments, and performance
- **Access Control**: Manage employee permissions based on roles

## 🏗️ Architecture

This project follows a clean, modular architecture with three main components:

### 1. **pos_server** (Backend)

- Built with [Serverpod](https://serverpod.dev/)
- PostgreSQL database with automated migrations
- RESTful API endpoints for all operations
- Authentication services with JWT token management
- Endpoints include:
  - User authentication and authorization
  - Building management
  - Article/product operations
  - Category management
  - Employee management
  - Order processing
  - Table management

### 2. **pos_flutter** (Frontend)

- Cross-platform Flutter application
- GetX state management
- Responsive UI supporting web, iOS, Android, macOS, Linux, and Windows
- Features:
  - Clean, intuitive user interface
  - Real-time data synchronization
  - Offline-capable design
  - Theme support (light/dark mode)

### 3. **pos_client** (Shared Client Library)

- Auto-generated client code from Serverpod
- Type-safe API calls
- Shared models and protocols between server and client

## 📋 Prerequisites

- **Flutter SDK**: 3.x or higher
- **Dart SDK**: 3.x or higher
- **Docker**: For running PostgreSQL database
- **PostgreSQL**: 14 or higher (via Docker or local installation)

## 🛠️ Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd pos-flutter-serverpod
```

### 2. Start the Database

```bash
cd pos_server
docker-compose up -d
```

### 3. Setup the Server

```bash
cd pos_server
dart pub get
dart run bin/main.dart
```

The server will start on `http://localhost:8080`

### 4. Run the Flutter App

```bash
cd pos_flutter
flutter pub get
flutter run -d chrome  # For web
# or
flutter run -d macos   # For macOS
# or
flutter run -d windows # For Windows
```

## 🗂️ Project Structure

```
pos-flutter-serverpod/
├── pos_server/          # Serverpod backend
│   ├── bin/            # Server entry point
│   ├── lib/src/        # Endpoints and business logic
│   ├── config/         # Configuration files
│   └── migrations/     # Database migrations
│
├── pos_flutter/        # Flutter application
│   ├── lib/
│   │   ├── main.dart   # App entry point
│   │   └── app/
│   │       ├── modules/    # Feature modules
│   │       ├── routes/     # Navigation
│   │       ├── themes/     # UI themes
│   │       └── data/       # Data layer
│   └── assets/         # Images and config
│
└── pos_client/         # Shared client library
    └── lib/src/        # Generated protocol classes
```

## 🔑 Key Modules

- **Authentication**: User registration, login, and session management
- **Buildings**: Multi-location management and configuration
- **Articles**: Product/item catalog management
- **Categories**: Product categorization
- **Employees**: Staff management and permissions
- **Orders**: Order creation, tracking, and processing
- **Tables**: Table assignment and status tracking
- **Inventory**: Stock tracking and management

## 🔒 Security

- JWT-based authentication
- Password hashing with secure salts
- User session management
- Role-based access control (RBAC)
- Email verification for new accounts

## 🌐 Supported Platforms

- ✅ Web
- ✅ iOS
- ✅ Android
- ✅ macOS
- ✅ Linux
- ✅ Windows

## 📱 Screenshots

_(Add screenshots of your application here)_

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

_(Add your license information here)_

## 👥 Authors

_(Add author information here)_

## 🐛 Known Issues

- Tables view is currently in development
- Order view features are being implemented

## 🗺️ Roadmap

- [ ] Complete table management interface
- [ ] Enhanced order processing workflow
- [ ] Reports and analytics dashboard
- [ ] Real-time notifications
- [ ] Mobile-optimized UI
- [ ] Offline mode support
- [ ] Multi-currency support
- [ ] Receipt printing integration

## 📞 Support

For issues and questions, please open an issue on GitHub.

---

**Built with ❤️ using Flutter and Serverpod**
