//
//  Instructions.swift
//  serpentinDeTexte
//
//  Created by Philippe MICHEL on 17/02/2021.
//

import SwiftUI

struct Instructions: View {
    @Environment(\.presentationMode) var fermerInstruction
    var body: some View {
        VStack {
            Button(action: {
                fermerInstruction.wrappedValue.dismiss()
            }, label: {
                Image(systemName: Ressources.images.fermerCroix.rawValue)
            })
            Spacer()
            Text("instruction")
                .multilineTextAlignment(.center)
                .padding(50)
                .background(Color.pink)
                .border(Color.green)
                .cornerRadius(10)
            Spacer()
        }
    }
}
struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
    }
}
