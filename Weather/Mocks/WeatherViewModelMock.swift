

#if DEBUG
import Combine
import Foundation
// swiftlint:disable force_unwrapping
class WeatherViewModelMock: WeatherViewModel {
	private let weatherService = WeatherServiceMock()

	init() {
		let localWeather = weatherService.createWeatherResponseMock().data
		super.init(localWeather: localWeather, place: weatherService.createPlacesResponseMock().searchAPI.result.first!)
	}
}
// swiftlint:enable force_unwrapping
#endif
