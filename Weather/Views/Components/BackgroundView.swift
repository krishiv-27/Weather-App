

import SwiftUI

struct BackgroundView: View {
	var body: some View {
		ZStack {
			LinearGradient(gradient:
							Gradient(colors: [
								WeatherColor.AppBackground,
								WeatherColor.AppBackground,
								WeatherColor.AccentColor,
							]), startPoint: .top, endPoint: .bottomTrailing)

			VisualEffectView(effect: UIBlurEffect(style: .systemMaterialDark))
		}
		.edgesIgnoringSafeArea(.all)
	}
}

struct BackgroundVIew_Previews: PreviewProvider {
	static var previews: some View {
		BackgroundView()
	}
}
