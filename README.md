# Weather Forecast Application - AngularJS to React Migration

A comprehensive weather forecast application demonstrating a complete migration from AngularJS to React, with detailed documentation, ontology-based tracking, and best practices.

## 📋 Project Overview

This project showcases a real-world migration from a legacy AngularJS application to a modern React application. It includes:

- **Legacy AngularJS Application** - Original implementation
- **Modern React Application** - Migrated version with modern patterns
- **Migration Ontology** - JSON-LD schema for tracking the migration
- **Comprehensive Documentation** - Requirements, guides, and bug fixes
- **Kubernetes Manifests** - Deployment configurations

## 🎯 Key Features

- 🌤️ Real-time weather data from WeatherAPI.com
- 📅 Multi-day weather forecasts (1-3 days)
- 🔍 City-based weather search
- 📱 Responsive Bootstrap UI
- 🔄 Complete migration documentation
- 📊 Ontology-based migration tracking

## 🏗️ Project Structure

```
Weather-Forecast-App-main/
├── angularjs-app/              # Legacy AngularJS application
│   ├── controllers/            # AngularJS controllers
│   ├── services/               # AngularJS services
│   ├── directives/             # Custom directives
│   ├── pages/                  # HTML templates
│   ├── config.js               # Configuration
│   ├── Dockerfile              # Docker configuration
│   └── README.md               # AngularJS app documentation
│
├── react-app/                  # Modern React application
│   ├── src/
│   │   ├── components/         # React components
│   │   ├── context/            # Context API for state management
│   │   ├── hooks/              # Custom React hooks
│   │   └── services/           # API services
│   ├── MIGRATION_GUIDE.md      # Detailed migration documentation
│   ├── MIGRATION_TRACKING.json # Migration progress tracking
│   ├── PERFORMANCE_OPTIMIZATIONS.md
│   ├── Dockerfile              # Docker configuration
│   └── README.md               # React app documentation
│
├── docs/                       # Project documentation
│   ├── functional-requirements.md
│   ├── functional-requirements.docx
│   ├── non-functional-requirements.md
│   └── non-functional-requirements.docx
│
├── manifest/                   # Kubernetes deployment manifests
│   ├── deployment-blue.yaml    # Blue deployment
│   ├── deployment-green.yaml   # Green deployment
│   ├── svc.yaml                # Service configuration
│   └── README.md               # Deployment documentation
│
├── prompts/                    # AI prompts used in development
│   ├── 01-ontology-schema-generation.md
│   ├── 02-requirements-documentation.md
│   ├── 03-context-studio-mcp-query.md
│   └── README.md
│
├── angularjs-to-react-migration-ontology.jsonld  # Migration ontology
├── README_BUGFIXES.md          # Bug fixes documentation
└── README.md                   # This file
```

## 🚀 Quick Start

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Docker (optional, for containerized deployment)
- Kubernetes cluster (optional, for K8s deployment)

### Running the AngularJS Application

```bash
cd angularjs-app

# Option 1: Simple HTTP Server
python -m http.server 8000

# Option 2: Docker
docker build -t angularjs-weather-app .
docker run -p 8080:80 angularjs-weather-app
```

Visit `http://localhost:8000` or `http://localhost:8080`

### Running the React Application

```bash
cd react-app

# Install dependencies
npm install

# Start development server
npm start
```

Visit `http://localhost:3000`

## 📚 Documentation

### Core Documentation

- **[AngularJS App README](./angularjs-app/README.md)** - Legacy application documentation
- **[React App README](./react-app/README.md)** - Modern application documentation
- **[Migration Guide](./react-app/MIGRATION_GUIDE.md)** - Detailed migration process
- **[Bug Fixes](./README_BUGFIXES.md)** - All bugs identified and fixed

### Requirements Documentation

- **[Functional Requirements](./docs/functional-requirements.md)** - Feature specifications
- **[Non-Functional Requirements](./docs/non-functional-requirements.md)** - Performance, security, etc.

### Migration Resources

- **[Migration Ontology](./angularjs-to-react-migration-ontology.jsonld)** - JSON-LD schema
- **[Migration Tracking](./react-app/MIGRATION_TRACKING.json)** - Progress tracking
- **[Performance Optimizations](./react-app/PERFORMANCE_OPTIMIZATIONS.md)** - Optimization guide

### Deployment

- **[Kubernetes Manifests](./manifest/README.md)** - K8s deployment guide

### Development Process

- **[Prompts Collection](./prompts/README.md)** - AI prompts used in development

## 🔄 Migration Highlights

### Technology Stack Comparison

| Aspect | AngularJS | React |
|--------|-----------|-------|
| **Framework** | AngularJS 1.8.2 | React 18.2.0 |
| **Routing** | ngRoute | React Router v6 |
| **State Management** | Services + $scope | Context API + Hooks |
| **HTTP Client** | $resource (JSONP) | Axios |
| **Component Pattern** | Controllers + Templates | Functional Components |
| **Data Binding** | Two-way binding | One-way data flow |

### Key Migration Patterns

1. **Controllers → Functional Components**
   - `homeController` → `Home.jsx`
   - `forecastController` → `Forecast.jsx`

2. **Services → Context + Hooks**
   - `cityService` → `CityContext` + `useCityContext`
   - `$resource` → `useWeatherAPI` custom hook

3. **Directives → Reusable Components**
   - Custom directives → `WeatherCard.jsx`, `Navigation.jsx`

4. **Routing**
   - `ngRoute` → React Router v6 with modern patterns

## 🐛 Bug Fixes

Over 11 bugs were identified and fixed during the migration:

- ✅ Critical syntax errors in $resource configuration
- ✅ Security vulnerabilities (hardcoded API keys)
- ✅ Missing error handling
- ✅ Input validation issues
- ✅ Race conditions in API calls
- ✅ Type coercion problems
- ✅ Deprecated library versions

See [README_BUGFIXES.md](./README_BUGFIXES.md) for complete details.

## 🔧 Configuration

### API Key Setup

Both applications require a WeatherAPI.com API key:

1. Sign up at [WeatherAPI.com](https://www.weatherapi.com/)
2. Get your free API key

**AngularJS App:**
```javascript
// angularjs-app/config.js
var APP_CONFIG = {
  WEATHER_API_KEY: 'your-api-key-here',
  // ...
};
```

**React App:**
```bash
# react-app/.env
REACT_APP_WEATHER_API_KEY=your-api-key-here
```

## 🐳 Docker Support

Both applications include Dockerfile configurations:

```bash
# Build AngularJS app
cd angularjs-app
docker build -t angularjs-weather-app .
docker run -p 8080:80 angularjs-weather-app

# Build React app
cd react-app
docker build -t react-weather-app .
docker run -p 3000:80 react-weather-app
```

## ☸️ Kubernetes Deployment

Blue-green deployment manifests are provided:

```bash
cd manifest

# Deploy blue version
kubectl apply -f deployment-blue.yaml

# Deploy service
kubectl apply -f svc.yaml

# Deploy green version (for blue-green deployment)
kubectl apply -f deployment-green.yaml
```

See [manifest/README.md](./manifest/README.md) for details.

## 📊 Migration Ontology

The project includes a comprehensive JSON-LD ontology schema that defines:

- Application components and their relationships
- Migration phases and strategies
- Requirements (functional, non-functional, security, performance)
- Stakeholder roles
- Test cases and verification methods
- Component mappings between AngularJS and React

View: [angularjs-to-react-migration-ontology.jsonld](./angularjs-to-react-migration-ontology.jsonld)

## 🧪 Testing

### AngularJS App
- Manual testing recommended
- No automated tests included

### React App
```bash
cd react-app
npm test
```

## 🔒 Security Considerations

⚠️ **Important:**

1. **API Keys**: Never commit API keys to version control
2. **Environment Variables**: Use `.env` files (excluded from git)
3. **Production**: Implement backend proxy for API calls
4. **CORS**: Configure proper CORS policies
5. **Rate Limiting**: Implement API rate limiting

## 📈 Performance

The React application includes several optimizations:

- Component memoization
- Lazy loading
- Request cancellation (AbortController)
- Efficient state management
- Code splitting

See [PERFORMANCE_OPTIMIZATIONS.md](./react-app/PERFORMANCE_OPTIMIZATIONS.md)

## 🤝 Contributing

This is a demonstration project. For improvements:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📝 License

This project is a demonstration of AngularJS to React migration patterns.

## 🎓 Learning Resources

This project demonstrates:

- Legacy code migration strategies
- Modern React patterns and best practices
- Ontology-based project tracking
- Comprehensive documentation practices
- DevOps and deployment strategies
- Bug fixing and code quality improvement

## 📞 Support

For questions or issues:

1. Check the relevant README files
2. Review the migration guide
3. Consult the bug fixes documentation
4. Review the ontology schema

## 🏆 Project Highlights

- ✅ Complete migration from AngularJS to React
- ✅ Comprehensive documentation (8+ documents)
- ✅ Ontology-based tracking system
- ✅ 11+ bugs identified and fixed
- ✅ Docker and Kubernetes support
- ✅ Security improvements implemented
- ✅ Performance optimizations applied
- ✅ Modern development practices

---

**Migration Status:** ✅ COMPLETED  
**Last Updated:** May 2026  
**Maintained by:** Development Team

For detailed migration information, see [MIGRATION_GUIDE.md](./react-app/MIGRATION_GUIDE.md)