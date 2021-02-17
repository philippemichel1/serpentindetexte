//
//  FenetreMenu.swift
//  serpentinDeTexte
//
//  Created by Philippe MICHEL on 17/02/2021.
//

import SwiftUI

struct FenetreMenu: View {
    var largeurFenetre:CGFloat
    var hauteurFenetre:CGFloat
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(Color.white)
                .frame(width: largeurFenetre, height: hauteurFenetre, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: 2, y: 2)
        }
    }
}

struct FenetreMenu_Previews: PreviewProvider {
    static var previews: some View {
        FenetreMenu(largeurFenetre: 100, hauteurFenetre: 100)
    }
}
