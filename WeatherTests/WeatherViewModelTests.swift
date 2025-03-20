

// swiftlint:disable all
@testable import Weather
import XCTest
import Combine

class WeatherViewModelTests: XCTestCase {
	var viewModel: WeatherViewModel!

	override func setUpWithError() throws {
		let place = WeatherServiceMock().createPlacesResponseMock().searchAPI.result.first!
		let weather = WeatherServiceMock().createWeatherResponseMock().data
		viewModel = WeatherViewModel(localWeather: weather, place: place)
	}

	func testWeatherViewModelData() {
		XCTAssertEqual(viewModel.placeName, "Athens")
		XCTAssertEqual(viewModel.daySummaries.count, 5)
		XCTAssertEqual(viewModel.currentTempDescription, "Partly cloudy")
		XCTAssertNotNil(viewModel.currentWeatherIcon)
		XCTAssertEqual(viewModel.currentTemp, "16º")
		XCTAssertEqual(viewModel.feelsLike, "16º")
		XCTAssertEqual(viewModel.uvIndex, "4")
		XCTAssertEqual(viewModel.humidity, "59%")
		XCTAssertEqual(viewModel.windSpeed, "31km/h")
		XCTAssertEqual(viewModel.windDirection, "N")
		XCTAssertEqual(viewModel.sunriseTime, "7:07 AM")
		XCTAssertEqual(viewModel.sunsetTime, "5:13 PM")

		let weatherElement = viewModel.daySummaries.first!

		XCTAssertEqual(viewModel.dayFor(weatherElement: weatherElement), "Today")
		XCTAssertNotNil(viewModel.imageFor(weatherElement: weatherElement))
		XCTAssertEqual(viewModel.highTempFor(weatherElement: weatherElement), "16º")
		XCTAssertEqual(viewModel.lowTempFor(weatherElement: weatherElement), "12º")
	}
}
