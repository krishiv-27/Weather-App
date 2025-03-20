

@testable import Weather
import XCTest

// swiftlint:disable force_unwrapping
class PlaceTests: XCTestCase {
	func testPlaceValid() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "Place")
		let decoder = JSONDecoder()
		do {
			let place = try decoder.decode(Place.self, from: jsonData)
			XCTAssertEqual(place.name, "Athens")
			XCTAssertEqual(place.country, "Greece")
			XCTAssertEqual(place.region, "Attica")

			let encoder = JSONEncoder()
			let data = try encoder.encode(place)
			let encodedPlace = try decoder.decode(Place.self, from: data)
			XCTAssertEqual(place, encodedPlace)
			XCTAssertEqual(place.name, encodedPlace.name)
			XCTAssertEqual(place.country, encodedPlace.country)
			XCTAssertEqual(place.region, encodedPlace.region)
		} catch {
			XCTAssert(false, "Place.json decode failed \(error)")
		}
	}

	func testPlaceValidOnlyName() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "PlaceNameOnly")
		let decoder = JSONDecoder()
		do {
			let place = try decoder.decode(Place.self, from: jsonData)
			XCTAssertEqual(place.name, "Athens")
			XCTAssertNil(place.country)
			XCTAssertNil(place.region)
		} catch {
			XCTAssert(false, "PlaceNameOnly.json decode failed \(error)")
		}
	}

	func testPlaceNoName() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "PlaceNoName")
		let decoder = JSONDecoder()
		do {
			let place = try decoder.decode(Place.self, from: jsonData)
			XCTAssertEqual(place.name, "Unknown")
		} catch {
			XCTAssert(false, "PlaceNoName.json decode failed \(error)")
		}
	}

	func testPlaceEquality() {
		let jsonData = Bundle.stubbedDataFromJson(filename: "PlaceNameOnly")
		let decoder = JSONDecoder()
		guard let place = try? decoder.decode(Place.self, from: jsonData) else {
			XCTAssert(false, "PlaceNameOnly.json decode failed ")
			return
		}
		let jsonData1 = Bundle.stubbedDataFromJson(filename: "Place")
		guard let place1 = try? decoder.decode(Place.self, from: jsonData1) else {
			XCTAssert(false, "Place.json decode failed ")
			return
		}
		XCTAssertNotEqual(place, place1, "places should not match")
	}

	func testPlaceInvalidJson() {
		let jsonData = "{\"data1\"\"\"}".data(using: .utf8)!
		let decoder = JSONDecoder()
		do {
			let place = try decoder.decode(Place.self, from: jsonData)
			XCTAssert(false, "Should fail \(place)")
		} catch _ as DecodingError {
			XCTAssert(true)
		} catch {
			XCTAssert(false, "should throw DecodingError \(error)")
		}
	}
}
// swiftlint:enable force_unwrapping
