//
//  ControleurSafari.swift
//  serpentinDeTexte
//
//  Created by Philippe MICHEL on 17/02/2021.
//

import Foundation
import SafariServices
import SwiftUI

struct ControleurSafari: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<ControleurSafari>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<ControleurSafari>) {

    }
}
