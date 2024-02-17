//
//  SafariWebView.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable {
    var urlString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let requestURL: URL = URL(string: urlString) ?? URL(string: "http://place.map.kakao.com/8107636")!
        let safariViewController = SFSafariViewController(url: requestURL)
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

#Preview {
    SafariWebView(urlString: "http://place.map.kakao.com/8107636")
}
