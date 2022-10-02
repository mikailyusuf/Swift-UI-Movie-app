//
//  SafariView.swift
//  Movie App
//
//  Created by Mikail on 01/10/2022.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable{
    
    let url:URL
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVc = SFSafariViewController(url: self.url)
        return safariVc
    }
}
