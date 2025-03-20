

import Foundation

// swiftlint:disable force_unwrapping
enum AppConstants {
	enum Api {
		static let apiUrl = URL(string: "https://api.worldweatheronline.com/premium/v1")!
		static let apiKey = "4b31658053df438e80004805251703"

		enum QueryKey: String {
			case apiKey = "key"
			case searchString = "q"
			case format = "format"

			// Weather Query
			case numOfDays = "num_of_days"
			case forcast = "fx"
			case currentCondition = "cc"
			case monthlyCondition = "mca"
			case location = "includelocation"
			case comments = "show_comments"
			case tp = "tp"
		}

		enum QueryValue {
			static let numOfDays = "5"
			static let forcast = "yes"
			static let currentCondition = "yes"
			static let monthlyCondition = "no"
			static let location = "no"
			static let comments = "no"
			static let tp = "1"
		}
	}

	enum A11y {
		static let searchTextField = "searchTextField"
		static let searchResultList = "searchResultList"
		static let searchEmptyResultContainer = "searchEmptyResultContainer"

		static let weatherAddButton = "weatherAddButton"
		static let weatherCancelButton = "weatherCancelButton"
		static let weatherDismissButton = "weatherDismissButton"

		static let placesScrollView = "placesScrollView"
		static let removePlaceButton = "removePlaceButton"
		static let editPlacesButton = "editPlacesButton"
	}
}
// swiftlint:enable force_unwrapping
