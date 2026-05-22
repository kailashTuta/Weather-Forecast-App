import { memo } from 'react';
import { Link } from 'react-router-dom';

/**
 * Navigation Component
 * Migrated from: index.html - header section
 *
 * This component replaces the static AngularJS navigation
 * with a React Router-enabled navigation component.
 *
 * Performance: Wrapped with React.memo to prevent unnecessary re-renders
 */
const Navigation = memo(() => {
  return (
    <header>
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
        <div className="container">
          <Link className="navbar-brand" to="/">
            Weather Forecast
          </Link>
          
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          
          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav ms-auto">
              <li className="nav-item">
                <Link className="nav-link" to="/">
                  Home
                </Link>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
  );
});

Navigation.displayName = 'Navigation';

export default Navigation;

// Made with Bob
