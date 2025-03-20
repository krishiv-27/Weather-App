

#if DEBUG
import Combine
import Foundation
// swiftlint:disable force_cast force_unwrapping
class MainViewModelMock: MainViewModel {
	private let weatherService: WeatherServiceMock
	private var cancellables = Set<AnyCancellable>()

	override init(weatherService: WeatherService) {
		self.weatherService = weatherService as! WeatherServiceMock
		super.init(weatherService: weatherService)

		searchText = "Athens"

		weathersData.append(WeatherData(place: self.weatherService.createPlacesResponseMock().searchAPI.result.first!))

		weathersData.first?.weather = self.weatherService.createWeatherResponseMock().data
	}
}
// swiftlint:enable force_cast force_unwrapping
#endif
