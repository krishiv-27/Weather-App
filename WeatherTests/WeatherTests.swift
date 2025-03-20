

@testable import Weather
import XCTest

// swiftlint:disable force_unwrapping
class WeatherTests: XCTestCase {

	func testLocalWeatherValid() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "Weather")

		let decoder = JSONDecoder()
		do {
			let localWeather = try decoder.decode(LocalWeather.self, from: jsonData)

			XCTAssertEqual(localWeather.currentWeather.count, 1)
			XCTAssertEqual(localWeather.dailyWeather.count, 5)
		} catch {
			XCTAssert(false, "Weather.json decode failed \(error)")
		}
	}

	func testCurrentWeatherValid() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "Weather")

		let decoder = JSONDecoder()
		do {
			let localWeather = try decoder.decode(LocalWeather.self, from: jsonData)
			let currentWeather = localWeather.currentWeather.first!

			XCTAssertEqual(currentWeather.weatherDescription, "Partly cloudy")
			XCTAssertEqual(currentWeather.tempFormatted, "16º")
			XCTAssertEqual(currentWeather.feelsLikeFormatted, "16º")
			XCTAssertEqual(currentWeather.uvIndexFormatted, "4")
			XCTAssertEqual(currentWeather.humidityFormatted, "59%")
			XCTAssertEqual(currentWeather.windSpeedFormatted, "31km/h")
			XCTAssertEqual(currentWeather.windDirectionFormatted, "N")
		} catch {
			XCTAssert(false, "Weather.json decode failed \(error)")
		}
	}

	func testWeatherElementValid() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "Weather")

		let decoder = JSONDecoder()
		do {
			let localWeather = try decoder.decode(LocalWeather.self, from: jsonData)
			let dailyWeather = localWeather.dailyWeather.first!

			XCTAssertEqual(dailyWeather.highTempFormatted, "16º")
			XCTAssertEqual(dailyWeather.lowTempFormatted, "12º")
			XCTAssertNotNil(dailyWeather.image)
			XCTAssertEqual(dailyWeather.day, "Tuesday")
		} catch {
			XCTAssert(false, "Weather.json decode failed \(error)")
		}
	}

	func testHourlyValid() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "Weather")

		let decoder = JSONDecoder()
		do {
			let localWeather = try decoder.decode(LocalWeather.self, from: jsonData)
			let hourly = localWeather.dailyWeather.first!.hourly.first!

			XCTAssertEqual(hourly.timeFormatted, "12 AM")
			XCTAssertEqual(hourly.tempFormatted, "13º")
			XCTAssertNotNil(hourly.image)
		} catch {
			XCTAssert(false, "Weather.json decode failed \(error)")
		}
	}

	func testAstronomyValid() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "Weather")

		let decoder = JSONDecoder()
		do {
			let localWeather = try decoder.decode(LocalWeather.self, from: jsonData)
			let astronomy = localWeather.dailyWeather.first!.astronomy.first!

			XCTAssertEqual(astronomy.sunriseFormatted, "7:07 AM")
			XCTAssertEqual(astronomy.sunsetFormatted, "5:13 PM")
		} catch {
			XCTAssert(false, "Weather.json decode failed \(error)")
		}
	}

	func testLocalWeatherInvalidJson() {
		let jsonData = "{\"data1\"\"\"}".data(using: .utf8)!
		let decoder = JSONDecoder()
		do {
			let place = try decoder.decode(LocalWeather.self, from: jsonData)
			XCTAssert(false, "Should fail \(place)")
		} catch _ as DecodingError {
			XCTAssert(true)
		} catch {
			XCTAssert(false, "should throw DecodingError \(error)")
		}
	}
}
// swiftlint:enable force_unwrapping
