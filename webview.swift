import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct ContentView: View {
    var body: some View {
        // Point this to your Web4 hosted URL
        WebView(url: URL(string: "https://web4application.github.io")!)
            .edgesIgnoringSafeArea(.all)
    }
}
