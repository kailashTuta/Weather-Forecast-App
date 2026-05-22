import { useState, useEffect, useCallback } from 'react';
import { weatherService } from '../services/weatherService';

/**
 * Custom Hook for Weather API
 * Migrated from AngularJS forecastController's $resource usage
 *
 * This hook encapsulates the weather API logic and provides
 * loading, error, and data states to components.
 *
 * Fixed: Race condition handling with AbortController
 *
 * @param {string} city - City name
 * @param {number} days - Number of forecast days
 * @returns {Object} { weatherData, loading, error, refetch }
 */
export const useWeatherAPI = (city, days = 2) => {
  const [weatherData, setWeatherData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const fetchWeather = useCallback(async (signal) => {
    if (!city) {
      setError('City name is required');
      return;
    }

    setLoading(true);
    setError(null);

    try {
      const data = await weatherService.getForecast(city, days, signal);
      // Only update state if request wasn't aborted
      if (!signal?.aborted) {
        setWeatherData(data);
      }
    } catch (err) {
      // Ignore abort errors
      if (err.name === 'AbortError' || err.name === 'CanceledError') {
        return;
      }
      if (!signal?.aborted) {
        setError(err.message);
        setWeatherData(null);
      }
    } finally {
      if (!signal?.aborted) {
        setLoading(false);
      }
    }
  }, [city, days]);

  useEffect(() => {
    // Create AbortController to cancel previous requests
    const abortController = new AbortController();
    
    fetchWeather(abortController.signal);

    // Cleanup function to abort request on unmount or dependency change
    return () => {
      abortController.abort();
    };
  }, [city, days, fetchWeather]);

  return {
    weatherData,
    loading,
    error,
    refetch: () => fetchWeather()
  };
};

export default useWeatherAPI;

// Made with Bob
