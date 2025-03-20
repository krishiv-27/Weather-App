
import XCTest

class WeatherUITest: XCTestCase {
	var app = XCUIApplication()

	let timeOut = 10

	override func setUp() {
		super.setUp()
		continueAfterFailure = false

		app.launchArguments = ["isRunningUITests"]
		app.launch()
	}

	override func tearDown() {
		super.tearDown()
	}

	func waitUntilExists(forElement: XCUIElement, testCase: WeatherUITest) {

		let predicate = NSPredicate(format: "exists == true")
		testCase.expectation(for: predicate, evaluatedWith: forElement, handler: nil)

		testCase.waitForExpectations(timeout: TimeInterval(timeOut))
	}
}
