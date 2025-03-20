

import XCTest

class MainScreen: ScreenObject {
	var app: XCUIApplication
	var searchTextField: XCUIElement { return app.textFields[AppConstants.A11y.searchTextField] }
	var searchClearButton: XCUIElement { return app.images[AppConstants.A11y.searchTextField] }
	var searchResultList: XCUIElement { return app.tables[AppConstants.A11y.searchResultList] }
	var emptyResultImage: XCUIElement { return app.images[AppConstants.A11y.searchEmptyResultContainer] }
	var emptyResultLabel: XCUIElement { return app.staticTexts[AppConstants.A11y.searchEmptyResultContainer] }
	var placesScrollView: XCUIElement { return app.scrollViews[AppConstants.A11y.placesScrollView] }
	var editPlacesButton: XCUIElement { return app.buttons[AppConstants.A11y.editPlacesButton] }

	init(_ application: XCUIApplication) {
		app = application
	}

	func tapSearchTextField() {
		searchTextField.tap()
	}

	func removeFirstPlace() {
		editPlacesButton.tap()
		_ = selectFirstPlace()
		editPlacesButton.tap()
	}

	func searchFor(place: String) {
		searchTextField.typeText(place)
	}

	func clearSearchTextField() {
		searchClearButton.tap()
	}

	func selectFirstPlaceFromSearch() -> WeatherScreen {
		tapSearchTextField()
		searchFor(place: "Athens")

		searchResultList.cells.element(boundBy: 0).tap()

		return WeatherScreen(app)
	}

	func selectFirstPlace() -> WeatherScreen {
		placesScrollView.otherElements.element(boundBy: 0).tap()

		return WeatherScreen(app)
	}
}
