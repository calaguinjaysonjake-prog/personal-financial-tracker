# Personal Financial Tracker

A full-stack Personal Financial Tracker application built with a **Flutter** frontend and an **Express.js** backend, using **MongoDB** for data persistence. This project demonstrates a modern approach to tracking personal finances with a clean, responsive UI and a robust RESTful API.

## 🚀 Features

-   **Dashboard Overview**: View your current balance, total income, and total expenses at a glance.
-   **Transaction Management**:
    -   **Create**: Add new transactions with detailed information (amount, category, date, description).
    -   **Read**: View a list of all transactions with visual indicators for income vs. expense.
    -   **Update**: Edit existing transaction details.
    -   **Delete**: Remove unwanted transactions.
-   **Filtering**: Filter transactions by category (e.g., Food, Transport, Salary) and date to track spending habits.
-   **Modern UI**: Designed with **Material 3** components, featuring:
    -   Gradient balance cards.
    -   Category-specific icons.
    -   Responsive forms with validation.
    -   Clean, distraction-free interface (no debug banners).
-   **Cross-Platform**: Runs on Android, iOS, Web, and Desktop (Windows/macOS/Linux).

## 🛠️ Tech Stack

### Frontend (Mobile/Web/Desktop)
-   **Framework**: [Flutter](https://flutter.dev/) (Dart)
-   **State Management**: `setState` (Local state management for simplicity and learning)
-   **HTTP Client**: `http` package for API communication.
-   **Formatting**: `intl` package for date and currency formatting.
-   **UI Library**: Material Design 3.

### Backend (API)
-   **Runtime**: [Node.js](https://nodejs.org/)
-   **Framework**: [Express.js](https://expressjs.com/)
-   **Database**: [MongoDB](https://www.mongodb.com/) (using [Mongoose](https://mongoosejs.com/) ODM).
-   **Environment Management**: `dotenv`.
-   **CORS**: Enabled for cross-origin requests.

## 📂 Project Structure

```
personal_financial_tracker/
├── backend/                  # Express.js Backend
│   ├── controllers/          # Request logic (CRUD operations)
│   ├── models/               # Mongoose schemas (Transaction model)
│   ├── routes/               # API route definitions
│   ├── server.js             # Entry point, database connection
│   └── .env                  # Environment variables (Mongo URI, Port)
├── lib/                      # Flutter Frontend
│   ├── models/               # Dart data models
│   ├── screens/              # UI Screens (List, Add, Edit)
│   ├── services/             # API communication logic
│   └── main.dart             # App entry point, Theme config
└── pubspec.yaml              # Flutter dependencies
```

## ⚙️ Installation & Setup

Follow these steps to run the project locally.

### Prerequisites
-   [Node.js](https://nodejs.org/) installed.
-   [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
-   [MongoDB](https://www.mongodb.com/) installed locally or a MongoDB Atlas connection string.

### 1. Backend Setup

1.  Navigate to the backend directory:
    ```bash
    cd backend
    ```
2.  Install dependencies:
    ```bash
    npm install
    ```
3.  Create a `.env` file in the `backend` folder and add your MongoDB URI:
    ```env
    MONGO_URI=mongodb://localhost:27017/pft
    PORT=5000
    ```
4.  Start the server:
    ```bash
    npm start
    # OR for development with auto-restart
    npx nodemon server.js
    ```
    *The server will run on `http://localhost:5000`.*

### 2. Frontend Setup

1.  Navigate to the project root (if you are in `backend`, go back up):
    ```bash
    cd ..
    ```
2.  Install Flutter dependencies:
    ```bash
    flutter pub get
    ```
3.  Run the app:
    ```bash
    flutter run
    ```
    *Select your target device (Chrome, Android Emulator, etc.).*

    > **Note for Android Emulator**: The app automatically handles the localhost mapping. It uses `10.0.2.2` for Android emulators and `localhost` for other platforms to ensure connectivity to the backend.

## 📡 API Endpoints

The backend exposes the following RESTful API endpoints at `http://localhost:5000/api/transactions`:

| Method | Endpoint | Description | Body Parameters |
| :--- | :--- | :--- | :--- |
| `GET` | `/` | Get all transactions | - |
| `POST` | `/` | Create a transaction | `{ type, title, amount, category, date, description }` |
| `PUT` | `/:id` | Update a transaction | `{ type, title, amount, category, date, description }` |
| `DELETE` | `/:id` | Delete a transaction | - |

## 📸 How It Works (Demo Flow)

1.  **Launch**: Open the app to see your financial summary.
2.  **Add**: Tap the floating action button (`+ Add Transaction`) to enter a new expense or income. Select a category (e.g., 'Food') and date.
3.  **View**: The new transaction appears immediately in the list, updating your total balance.
4.  **Filter**: Use the filter icon in the app bar to see only "Food" expenses from "Nov 2023".
5.  **Edit/Delete**: Tap a transaction to edit details or delete it if it was a mistake.

---
*Created with ❤️ using Flutter & Express.*
