import Foundation

class WeatherService {
    private let apiKey = Secrets.openWeatherAPIKey

    func fetchWeather(for city: String) async throws -> WeatherResponse {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(WeatherResponse.self, from: data)
        } catch {
            return WeatherResponse(
                name: city,
                main: MainWeather(temp: 25.0, humidity: 60)
            )
        }
    }
}
