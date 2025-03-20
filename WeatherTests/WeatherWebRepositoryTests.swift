
// swiftlint:disable all
@testable import Weather
import XCTest
import Combine

class WeatherWebRepositoryTests: XCTestCase {
	var urlSession: URLSession!
	private var cancellables = Set<AnyCancellable>()

	override func setUpWithError() throws {
		// Set url session for mock networking
		let configuration = URLSessionConfiguration.ephemeral
		configuration.protocolClasses = [MockURLProtocol.self]
		urlSession = URLSession(configuration: configuration)
	}

	func testFetchWeatherValid() throws {
		let weatherWebRepository = WeatherWebRepository(urlSession: urlSession)
		let mockData = Bundle.stubbedDataFromJson(filename: "WeatherResponse")

		MockURLProtocol.requestHandler = { request in
			return (HTTPURLResponse(), mockData)
		}

		let expectation = XCTestExpectation(description: "response")

		weatherWebRepository.fetchWeather(location: "")
			.sink(receiveCompletion: { _ in }, receiveValue: { localWeather in
				XCTAssertEqual(localWeather.currentWeather.count, 1)
				XCTAssertEqual(localWeather.dailyWeather.count, 5)

				expectation.fulfill()
			})
			.store(in: &cancellables)
		wait(for: [expectation], timeout: 1)
	}

	func testFetchWeatherInvalidJson() throws {
		let weatherWebRepository = WeatherWebRepository(urlSession: urlSession)
		let mockData = "{\"data1\"\"\"}".data(using: .utf8)!

		MockURLProtocol.requestHandler = { request in
			return (HTTPURLResponse(), mockData)
		}

		let expectation = XCTestExpectation(description: "response")

		weatherWebRepository.fetchWeather(location: "")
			.sink { operationResult in
				switch operationResult {
					case .failure(let error):
						XCTAssertEqual(error.errorDescription, WeatherApiError.decodingError.errorDescription)
						expectation.fulfill()
						break
					case .finished:
						break
				}
			} receiveValue: { _ in }
			.store(in: &cancellables)

		wait(for: [expectation], timeout: 1)
	}

	func testFetchWeatherInvalidStatusCode() throws {
		let weatherWebRepository = WeatherWebRepository(urlSession: urlSession)
		let mockData = Bundle.stubbedDataFromJson(filename: "WeatherResponse")
		let mockResponse = HTTPURLResponse(url: URL(string: "www.google.gr")!, statusCode: 404, httpVersion: "HTTP/1.1", headerFields: nil)!


		MockURLProtocol.requestHandler = { request in
			return (mockResponse, mockData)
		}

		let expectation = XCTestExpectation(description: "response")

		weatherWebRepository.fetchWeather(location: "")
			.sink { operationResult in
				switch operationResult {
					case .failure(let error):
						XCTAssertEqual(error.errorDescription, WeatherApiError.errorCode(404).errorDescription)
						expectation.fulfill()
						break
					case .finished:
						break
				}
			} receiveValue: { _ in }
			.store(in: &cancellables)

		wait(for: [expectation], timeout: 1)
	}

	func testSearchLocationValid() throws {
		let weatherWebRepository = WeatherWebRepository(urlSession: urlSession)
		let mockData = Bundle.stubbedDataFromJson(filename: "PlacesResponse")

		MockURLProtocol.requestHandler = { request in
			return (HTTPURLResponse(), mockData)
		}

		let expectation = XCTestExpectation(description: "response")

		weatherWebRepository.searchLocation(location: "")
			.sink(receiveCompletion: { _ in }, receiveValue: { places in
				XCTAssertEqual(places.count, 4)

				expectation.fulfill()
			})
			.store(in: &cancellables)
		wait(for: [expectation], timeout: 1)
	}

	func testSearchLocationInvalidJson() throws {
		let weatherWebRepository = WeatherWebRepository(urlSession: urlSession)
		let mockData = "{\"data1\"\"\"}".data(using: .utf8)!

		MockURLProtocol.requestHandler = { request in
			return (HTTPURLResponse(), mockData)
		}

		let expectation = XCTestExpectation(description: "response")

		weatherWebRepository.searchLocation(location: "")
			.sink { operationResult in
				switch operationResult {
					case .failure(let error):
						XCTAssertEqual(error.errorDescription, WeatherApiError.decodingError.errorDescription)
						expectation.fulfill()
						break
					case .finished:
						break
				}
			} receiveValue: { _ in }
			.store(in: &cancellables)

		wait(for: [expectation], timeout: 1)
	}

	func testSearchLocationInvalidStatusCode() throws {
		let weatherWebRepository = WeatherWebRepository(urlSession: urlSession)
		let mockData = Bundle.stubbedDataFromJson(filename: "PlacesResponse")
		let mockResponse = HTTPURLResponse(url: URL(string: "www.google.gr")!, statusCode: 404, httpVersion: "HTTP/1.1", headerFields: nil)!


		MockURLProtocol.requestHandler = { request in
			return (mockResponse, mockData)
		}

		let expectation = XCTestExpectation(description: "response")

		weatherWebRepository.searchLocation(location: "")
			.sink { operationResult in
				switch operationResult {
					case .failure(let error):
						XCTAssertEqual(error.errorDescription, WeatherApiError.errorCode(404).errorDescription)
						expectation.fulfill()
						break
					case .finished:
						break
				}
			} receiveValue: { _ in }
			.store(in: &cancellables)

		wait(for: [expectation], timeout: 1)
	}
}
// swiftlint:enable all
