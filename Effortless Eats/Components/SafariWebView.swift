//
//  SafariWebView.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

//TODO: 사파리 웹 뷰 하단 잘림현상 해결필요

import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable {
    var urlString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

#Preview {
    SafariWebView(urlString: "http://place.map.kakao.com/8107636")
}
