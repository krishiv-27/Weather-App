

import Logging
import SwiftUI

var logger = Logger(label: "gr.dkaratzas.Weather.main")

let isRunningUITests = ProcessInfo.processInfo.arguments.contains("isRunningUITests")

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
			MainView()
				.preferredColorScheme(.dark)
        }
    }
}
