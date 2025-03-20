

#if DEBUG
import Combine
import Foundation

class WeatherServiceMock: WeatherService {
	private let weatherLocalRepository = WeatherLocalRepository()
	func loadPlaces() -> AnyPublisher<[Place], Never> {
		if isRunningUITests {
			return weatherLocalRepository.loadPlaces()
		}
		return Just(createPlacesResponseMock())
			.receive(on: DispatchQueue.main)
			.map {
				$0.searchAPI.result
			}
			.eraseToAnyPublisher()
	}

	func savePlaces(places: [Place]) -> AnyPublisher<Void, Never> {
		if isRunningUITests {
			return weatherLocalRepository.savePlaces(places: places)
		}
		return Just(createWeatherResponseMock())
			.receive(on: DispatchQueue.main)
			.map { _ in 
			}
			.eraseToAnyPublisher()
	}

	func search(for location: String) -> AnyPublisher<[Place], WeatherApiError> {
		return Just(createPlacesResponseMock())
			.receive(on: DispatchQueue.main)
			.map {
				$0.searchAPI.result
			}
			.setFailureType(to: WeatherApiError.self)
			.eraseToAnyPublisher()
	}

	func fetchWeather(for place: Place) -> AnyPublisher<LocalWeather, WeatherApiError> {
		return Just(createWeatherResponseMock())
			.receive(on: DispatchQueue.main)
			.map {
				$0.data
			}
			.setFailureType(to: WeatherApiError.self)
			.eraseToAnyPublisher()
	}

	// swiftlint:disable force_try force_unwrapping
	func createPlacesResponseMock() -> PlacesResponce {
		let path = Bundle.main.path(forResource: "SearchLocationsResponse", ofType: "json")!
		let url = URL(fileURLWithPath: path)
		let data = try! Data(contentsOf: url)
		let response = try! JSONDecoder().decode(PlacesResponce.self, from: data)
		return response
	}

	func createWeatherResponseMock() -> WeatherResponse {
		let path = Bundle.main.path(forResource: "WeatherResponse", ofType: "json")!
		let url = URL(fileURLWithPath: path)
		let data = try! Data(contentsOf: url)
		let response = try! JSONDecoder().decode(WeatherResponse.self, from: data)
		return response
	}
	// swiftlint:enable force_try force_unwrapping
}
#endif
