
import XCTest

// swiftlint:disable all
class WeatherScreenTests: WeatherUITest {
	var mainScreen: MainScreen!
	var weatherScreen: WeatherScreen!

	override func setUp() {
		super.setUp()

		mainScreen = MainScreen(app)
	}

	func testSheetActionsExists() {
		weatherScreen = mainScreen.selectFirstPlaceFromSearch()

		XCTAssertTrue(weatherScreen.cancelButton.exists)
		XCTAssertTrue(weatherScreen.addButton.exists)
		XCTAssertFalse(weatherScreen.dismissButton.exists)
	}

	func testSheetActionsNotExists() {
		weatherScreen = mainScreen.selectFirstPlaceFromSearch()
		weatherScreen.tapAddButton()
		weatherScreen = mainScreen.selectFirstPlace()

		XCTAssertFalse(weatherScreen.cancelButton.exists)
		XCTAssertFalse(weatherScreen.addButton.exists)
		XCTAssertTrue(weatherScreen.dismissButton.exists)
	}

	func testScreenDataDisplaying() {
		weatherScreen = mainScreen.selectFirstPlaceFromSearch()

		XCTAssertTrue(app.staticTexts["Athens"].exists)
		XCTAssertTrue(app.staticTexts["Partly cloudy - Feels like 16º"].exists)
		XCTAssertTrue(app.staticTexts["16º"].exists)
		XCTAssertTrue(app.staticTexts["UV: 4"].exists)
		XCTAssertTrue(app.staticTexts["59%"].exists)
		XCTAssertTrue(app.staticTexts["31km/h"].exists)
		XCTAssertTrue(app.staticTexts["N"].exists)
		XCTAssertTrue(app.staticTexts["7:07 AM"].exists)
		XCTAssertTrue(app.staticTexts["5:13 PM"].exists)


		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["12 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["1 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["2 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["3 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["4 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["5 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["6 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["7 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["8 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["9 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["10 AM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["11 AM"].exists)

		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["12 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["1 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["2 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["3 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["4 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["5 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["6 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["7 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["8 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["9 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["10 PM"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["11 PM"].exists)

		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["Today"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["16º / 12º"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["Wednesday"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["16º / 10º"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["Thursday"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["17º / 10º"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["Friday"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["16º / 11º"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["Saturday"].exists)
		XCTAssertTrue(app.scrollViews.otherElements.staticTexts["17º / 10º"].exists)
	}

	func testCancelButton() {
		weatherScreen = mainScreen.selectFirstPlaceFromSearch()
		weatherScreen.tapCancelButton()
		sleep(2)
		XCTAssertFalse(weatherScreen.cancelButton.exists)
	}

	func testDismissButton() {
		weatherScreen = mainScreen.selectFirstPlaceFromSearch()
		weatherScreen.tapAddButton()
		weatherScreen = mainScreen.selectFirstPlace()
		weatherScreen.tapDismissButton()
		sleep(2)
		XCTAssertFalse(weatherScreen.dismissButton.exists)
	}
}
