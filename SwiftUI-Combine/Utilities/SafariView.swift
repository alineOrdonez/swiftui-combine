//
//  SafariView.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 06/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation
import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {

    var string: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let url = URL(string: string)!
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}
