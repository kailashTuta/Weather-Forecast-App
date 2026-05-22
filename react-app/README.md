# Weather Forecast React App

A modern weather forecast application built with React, migrated from AngularJS.

## 🚀 Quick Start

### Prerequisites
- Node.js (v14 or higher)
- npm or yarn

### Installation

```bash
# Navigate to the react-app directory
cd react-app

# Install dependencies
npm install

# Start the development server
npm start
```

The application will open at `http://localhost:3000`

## 📦 Available Scripts

### `npm start`
Runs the app in development mode with hot reloading.

### `npm test`
Launches the test runner in interactive watch mode.

### `npm run build`
Builds the app for production to the `build` folder.

### `npm run eject`
**Note: this is a one-way operation!** Ejects from Create React App.

## 🏗️ Project Structure

```
react-app/
├── public/
│   └── index.html              # HTML template
├── src/
│   ├── components/             # React components
│   │   ├── Home.jsx           # Home page
│   │   ├── Forecast.jsx       # Forecast page
│   │   ├── WeatherCard.jsx    # Weather card component
│   │   └── Navigation.jsx     # Navigation bar
│   ├── context/               # React Context
│   │   └── CityContext.js     # City state management
│   ├── hooks/                 # Custom React hooks
│   │   └── useWeatherAPI.js   # Weather API hook
│   ├── services/              # API services
│   │   └── weatherService.js  # Weather API service
│   ├── App.js                 # Main app component
│   └── index.js               # Entry point
├── package.json               # Dependencies
├── MIGRATION_GUIDE.md         # Detailed migration documentation
└── README.md                  # This file
```

## 🎯 Features

- ✅ Search weather by city name
- ✅ View current weather conditions
- ✅ View multi-day forecast (1-3 days)
- ✅ Responsive design with Bootstrap
- ✅ Modern React patterns (Hooks, Context API)
- ✅ Clean component architecture

## 🛠️ Technologies Used

- **React 18.2.0** - UI library
- **React Router DOM 6.20.0** - Routing
- **Axios 1.6.2** - HTTP client
- **Bootstrap 4.5.2** - CSS framework
- **Weather API** - Weather data provider

## 📖 Usage

1. **Enter a City**: On the home page, enter a city name in the input field
2. **View Forecast**: Click "Get Forecast" to see the weather forecast
3. **Change Duration**: Select 1, 2, or 3 days to adjust the forecast period
4. **Change City**: Click "Change City" to search for a different location

## 🔄 Migration from AngularJS

This application was migrated from AngularJS to React. For detailed migration information, see [MIGRATION_GUIDE.md](./MIGRATION_GUIDE.md).

### Key Changes:
- Controllers → Functional Components
- Services → Context API + Custom Hooks
- Directives → Reusable Components
- ngRoute → React Router
- $resource → Axios

## 🧪 Testing

Tests can be added using React Testing Library:

```bash
npm test
```

Example test structure:
```javascript
import { render, screen } from '@testing-library/react';
import Home from './components/Home';

test('renders home component', () => {
  render(<Home />);
  // Add assertions
});
```

## 🌐 API Configuration

The app uses Weather API. The API key is currently hardcoded in `src/services/weatherService.js`.

For production, consider:
- Using environment variables
- Implementing API key rotation
- Adding rate limiting

## 📝 License

This project is part of a migration demonstration.

## 🤝 Contributing

This is a migrated application. For improvements:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📞 Support

For issues or questions:
- Check the [MIGRATION_GUIDE.md](./MIGRATION_GUIDE.md)
- Review the original AngularJS code
- Consult React documentation

---

**Migrated from AngularJS to React** | May 2026