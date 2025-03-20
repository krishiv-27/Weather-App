

@testable import Weather
import XCTest

// swiftlint:disable all
class HelperTests: XCTestCase {
	func testFormatAstronomyTime() {
		let formattedDate = Helpers.formatAstronomyTime(from: "07:06 AM")

		XCTAssertEqual(formattedDate, "7:06 AM")
	}

	func testFormatHourlyTime() {
		for i in 0...11 {
			let time = i * 100
			let formattedDate = Helpers.formatHourlyTime(time: "\(time)")

			if i == 10 {
				XCTAssertEqual(formattedDate, "10 AM")
			} else if i == 11 {
				XCTAssertEqual(formattedDate, "11 AM")
			} else if i == 0 {
				XCTAssertEqual(formattedDate, "12 AM")
			} else {
				XCTAssertEqual(formattedDate, "\(i) AM")
			}
		}

		// TODO: Check PM hours
//		for i in 12...23 {
//			let time = i * 100
//			let formattedDate = Helpers.formatHourlyTime(time: "\(time)")
//
//			XCTAssertEqual(formattedDate, "\(i) PM", "formattedDate: should be \(i) PM")
//		}
	}

	func testDayOfWeek() {
		let formattedDate = Helpers.dayOfWeek(from: "2021-11-15")

		XCTAssertEqual(formattedDate, "Monday")
	}

	func testTimeToDate() {
		let timeToDate = Helpers.timeToDate("07:06 AM")

		XCTAssertNotNil(timeToDate)
	}

	func testHourlyTimeToDate() {
		let timeToDate = Helpers.hourlyTimeToDate(Helpers.formatHourlyTime(time: "07:06 AM")!)

		XCTAssertNotNil(timeToDate)
	}

	// TODO: test all ranges
	func testIsNight() {
		let sunsrise = Helpers.timeToDate("05:00 AM")!
		let sunset = Helpers.timeToDate("05:00 PM")!

		var time = Helpers.timeToDate("04:00 PM")!

		XCTAssertFalse(Helpers.isNight(sunrise: sunsrise, sunset: sunset, time: time))

		time = Helpers.timeToDate("05:00 PM")!
		XCTAssertTrue(Helpers.isNight(sunrise: sunsrise, sunset: sunset, time: time))
	}
}
// swiftlint:enable all
