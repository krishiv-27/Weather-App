

import XCTest

class WeatherScreen: ScreenObject {
	var app: XCUIApplication
	var addButton: XCUIElement { return app.buttons[AppConstants.A11y.weatherAddButton] }
	var cancelButton: XCUIElement { return app.buttons[AppConstants.A11y.weatherCancelButton] }
	var dismissButton: XCUIElement { return app.buttons[AppConstants.A11y.weatherDismissButton] }

	init(_ application: XCUIApplication) {
		app = application
	}

	func tapAddButton() {
		addButton.tap()
	}

	func tapCancelButton() {
		cancelButton.tap()
	}

	func tapDismissButton() {
		dismissButton.tap()
	}
}
