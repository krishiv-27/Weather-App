

@testable import Weather
import XCTest

// swiftlint:disable force_unwrapping
class PlacesSearchTests: XCTestCase {
	func testPlacesSearchResult() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "SearchResults")
		let decoder = JSONDecoder()
		do {
			let result = try decoder.decode(PlacesResponce.self, from: jsonData)
			XCTAssertEqual(result.searchAPI.result.count, 4)
		} catch {
			XCTAssert(false, "SearchResults.json decode failed \(error)")
		}
	}

	func testPlacesSearchResultEmpty() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "SearchResultsEmpty")
		let decoder = JSONDecoder()
		do {
			let result = try decoder.decode(PlacesResponce.self, from: jsonData)
			XCTAssert(result.searchAPI.result.isEmpty)
		} catch {
			XCTAssert(false, "SearchResultsEmpty.json decode failed \(error)")
		}
	}

	func testPlacesSearchResultInvalidJson() {
		let jsonData = "{\"data1\"\"\"}".data(using: .utf8)!
		let decoder = JSONDecoder()
		do {
			let result = try decoder.decode(PlacesResponce.self, from: jsonData)
			XCTAssert(false, "Should fail \(result)")
		} catch _ as DecodingError {
			XCTAssert(true)
		} catch {
			XCTAssert(false, "should throw DecodingError \(error)")
		}
	}
}
// swiftlint:enable force_unwrapping
