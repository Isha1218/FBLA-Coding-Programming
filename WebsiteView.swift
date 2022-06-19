//
//  WebsiteView.swift
//  FBLA WAtour
//
//  Created by Ishita Mundra on 5/22/22.
//

import SwiftUI
import WebKit

// Allows for a website to be displayed within the app
// Will be used when allowing the user to book a hotel
struct WebsiteView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    var urlToDisplay: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        // Loads URL for display
        webView.load(URLRequest(url: urlToDisplay))
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
}
