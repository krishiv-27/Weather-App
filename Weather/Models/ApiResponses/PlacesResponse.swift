

import Foundation

// MARK: - Search Location
struct PlacesResponce: Codable {
	let searchAPI: SearchAPI

	enum CodingKeys: String, CodingKey {
		case searchAPI = "search_api"
	}
}

// MARK: - SearchAPI
struct SearchAPI: Codable {
	let result: [Place]
}
