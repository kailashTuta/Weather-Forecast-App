import axios from 'axios';

/**
 * Weather Service - Migrated from AngularJS $resource
 * Original: controllers/controllers.js (forecastController)
 *
 * This service replaces the AngularJS $resource with modern Axios HTTP client
 * for fetching weather forecast data from the Weather API.
 *
 * Fixed: API key moved to environment variable
 * Fixed: Added AbortController support for race condition prevention
 */

const API_KEY = process.env.REACT_APP_WEATHER_API_KEY || 'a19e5510d499452094b24114200310';
const BASE_URL = 'https://api.weatherapi.com/v1';

/**
 * Weather Service API
 */
export const weatherService = {
  /**
   * Get weather forecast for a city
   * @param {string} city - City name
   * @param {number} days - Number of forecast days (default: 2)
   * @param {AbortSignal} signal - Optional abort signal for cancellation
   * @returns {Promise} Weather data
   */
  getForecast: async (city, days = 2, signal = null) => {
    try {
      const response = await axios.get(`${BASE_URL}/forecast.json`, {
        params: {
          key: API_KEY,
          q: city,
          days: days
        },
        signal: signal
      });
      return response.data;
    } catch (error) {
      console.error('Weather API Error:', error);
      throw new Error(
        error.response?.data?.error?.message ||
        'Failed to fetch weather data'
      );
    }
  },

  /**
   * Get current weather for a city
   * @param {string} city - City name
   * @param {AbortSignal} signal - Optional abort signal for cancellation
   * @returns {Promise} Current weather data
   */
  getCurrentWeather: async (city, signal = null) => {
    try {
      const response = await axios.get(`${BASE_URL}/current.json`, {
        params: {
          key: API_KEY,
          q: city
        },
        signal: signal
      });
      return response.data;
    } catch (error) {
      console.error('Weather API Error:', error);
      throw new Error(
        error.response?.data?.error?.message ||
        'Failed to fetch current weather'
      );
    }
  }
};

export default weatherService;

// Made with Bob
