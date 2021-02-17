//
//  ContentView.swift
//  serpentinDeTexte
//
//  Created by Philippe MICHEL on 17/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State var texteSaisie = ""
    var body: some View {
        NavigationView {
            MessageTexte(texteSaisie: $texteSaisie)
            
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
