

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
	var effect: UIVisualEffect?
	func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
	func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct VisualEffectView_Previews: PreviewProvider {
    static var previews: some View {
        VisualEffectView()
    }
}
