

import XCTest

// swiftlint:disable all
class MainScreenTests: WeatherUITest {
	var mainScreen: MainScreen!

	override func setUp() {
		super.setUp()

		mainScreen = MainScreen(app)
	}

	func testSearchPlaces() {
		mainScreen.tapSearchTextField()
		mainScreen.searchFor(place: "Test")
		self.waitUntilExists(forElement: mainScreen.searchResultList, testCase: self)

		XCTAssertEqual(mainScreen.searchResultList.cells.count, 4)
		XCTAssertTrue(mainScreen.searchResultList.cells["Athens, Attica, Greece"].exists)
		XCTAssertTrue(mainScreen.searchResultList.cells["Athens, Ohio, United States of America"].exists)
		XCTAssertTrue(mainScreen.searchResultList.cells["Athens, Tennessee, United States of America"].exists)
		XCTAssertTrue(mainScreen.searchResultList.cells["Athens, Texas, United States of America"].exists)
	}

	func testSearchPlacesNoResults() {
		mainScreen.tapSearchTextField()
		mainScreen.searchFor(place: "T")

		self.waitUntilExists(forElement: mainScreen.emptyResultImage, testCase: self)

		XCTAssertTrue(mainScreen.emptyResultImage.exists)
		XCTAssertTrue(mainScreen.emptyResultLabel.exists)
		XCTAssertEqual(mainScreen.emptyResultLabel.label, L10n.noSearchResults)
	}

	func testAddPlace() {
		let weatherScreen = mainScreen.selectFirstPlaceFromSearch()
		weatherScreen.tapAddButton()

		XCTAssertTrue(mainScreen.placesScrollView.otherElements.staticTexts["Athens - Attica"].exists)
		XCTAssertTrue(mainScreen.placesScrollView.otherElements.staticTexts["Partly cloudy"].exists)
		XCTAssertTrue(mainScreen.placesScrollView.otherElements.staticTexts["16º"].exists)

	}

	func testRemovePlace() {
		let weatherScreen = mainScreen.selectFirstPlaceFromSearch()
		weatherScreen.tapAddButton()

		mainScreen.removeFirstPlace()

		XCTAssertFalse(mainScreen.placesScrollView.otherElements.staticTexts["Athens - Attica"].exists)
		XCTAssertFalse(mainScreen.placesScrollView.otherElements.staticTexts["Partly cloudy"].exists)
		XCTAssertFalse(mainScreen.placesScrollView.otherElements.staticTexts["16º"].exists)
	}

	func testNoEditButtonWhileSearch() {
		// add a place
		let weatherScreen = mainScreen.selectFirstPlaceFromSearch()
		weatherScreen.tapAddButton()

		XCTAssertTrue(mainScreen.editPlacesButton.exists)

		mainScreen.tapSearchTextField()
		mainScreen.searchFor(place: "Athens")

		XCTAssertFalse(mainScreen.editPlacesButton.exists)
	}
}
// swiftlint:enable all
