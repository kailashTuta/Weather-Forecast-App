"""
WeatherAPILibrary
=================
Python Robot Framework library that wraps weatherapi.com REST calls.

All public methods are exposed as Robot Framework keywords.
"""

import os
import requests
from robot.api.deco import keyword, library


@library(scope="SUITE", auto_keywords=False)
class WeatherAPILibrary:
    """Keyword library for interacting with the weatherapi.com REST API."""

    BASE_URL = "https://api.weatherapi.com/v1"

    def __init__(self):
        self._api_key = os.environ.get("REACT_APP_WEATHER_API_KEY", "")
        if not self._api_key:
            raise RuntimeError(
                "Environment variable REACT_APP_WEATHER_API_KEY is not set."
            )

    # ------------------------------------------------------------------
    # Forecast endpoint
    # ------------------------------------------------------------------

    @keyword("Get Forecast Response")
    def get_forecast_response(self, city: str, days: int = 2) -> requests.Response:
        """Return the raw ``requests.Response`` for GET /v1/forecast.json.

        Parameters:
        - ``city`` — city name or query string (e.g. ``Eluru``)
        - ``days`` — number of forecast days (1–3)
        """
        url = f"{self.BASE_URL}/forecast.json"
        params = {"key": self._api_key, "q": city, "days": days}
        response = requests.get(url, params=params, timeout=15)
        return response

    @keyword("Get Forecast Data")
    def get_forecast_data(self, city: str, days: int = 2) -> dict:
        """Return the parsed JSON body for GET /v1/forecast.json.

        Raises an exception when the HTTP status is not 200.

        Parameters:
        - ``city`` — city name
        - ``days`` — number of forecast days (1–3)
        """
        response = self.get_forecast_response(city, days)
        response.raise_for_status()
        return response.json()

    # ------------------------------------------------------------------
    # Current weather endpoint
    # ------------------------------------------------------------------

    @keyword("Get Current Weather Response")
    def get_current_weather_response(self, city: str) -> requests.Response:
        """Return the raw ``requests.Response`` for GET /v1/current.json.

        Parameters:
        - ``city`` — city name
        """
        url = f"{self.BASE_URL}/current.json"
        params = {"key": self._api_key, "q": city}
        response = requests.get(url, params=params, timeout=15)
        return response

    @keyword("Get Current Weather Data")
    def get_current_weather_data(self, city: str) -> dict:
        """Return the parsed JSON body for GET /v1/current.json.

        Raises an exception when the HTTP status is not 200.

        Parameters:
        - ``city`` — city name
        """
        response = self.get_current_weather_response(city)
        response.raise_for_status()
        return response.json()

    # ------------------------------------------------------------------
    # Assertion helpers
    # ------------------------------------------------------------------

    @keyword("Forecast Response Should Be OK")
    def forecast_response_should_be_ok(self, city: str, days: int = 2):
        """Assert that GET /v1/forecast.json returns HTTP 200.

        Parameters:
        - ``city`` — city name
        - ``days`` — number of forecast days
        """
        response = self.get_forecast_response(city, days)
        assert response.status_code == 200, (
            f"Expected HTTP 200 for forecast, got {response.status_code}. "
            f"Body: {response.text[:200]}"
        )

    @keyword("Current Weather Response Should Be OK")
    def current_weather_response_should_be_ok(self, city: str):
        """Assert that GET /v1/current.json returns HTTP 200.

        Parameters:
        - ``city`` — city name
        """
        response = self.get_current_weather_response(city)
        assert response.status_code == 200, (
            f"Expected HTTP 200 for current weather, got {response.status_code}. "
            f"Body: {response.text[:200]}"
        )
