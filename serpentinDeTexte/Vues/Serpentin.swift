//
//  Serpentin.swift
//  serpentinDeTexte
//
//  Created by Philippe MICHEL on 17/02/2021.
//

import SwiftUI

struct Serpentin: View {
    @Binding var chaineSaisie:String
    @State var caracteres = Array("J'aime swiftUI")
    @State private var deplacement = CGSize.zero
    @State private var changementCouleur = false
    @State private var couleurAleatoireFond = 5
    let listeCouleur:[Color] = [.black,.gray,.green,.orange,.pink,.red,.purple,.yellow]
    @Environment(\.presentationMode) var fermerFenetreSnake
    
    var body: some View {
        VStack {
            Button(action: {
                fermerFenetreSnake.wrappedValue.dismiss()
            }, label: {
                Image(systemName: Ressources.images.fermerCroix.rawValue)
            })
        }
        Spacer()
        HStack(spacing: 0) {
            ForEach(0..<chaineSaisie.count) { index in
                Text(String(caracteres[index]))
                    .padding(5)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    //changement de couleur de fond
                    .background(self.changementCouleur ? listeCouleur[couleurAleatoireFond] : Color.blue)
                    .offset(deplacement)
                    .animation(Animation.default.delay(Double(index) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged {self.deplacement = $0.translation}
                .onEnded{ _ in
                    self.deplacement = .zero
                    self.changementCouleur.toggle()
                    couleurAleatoireFond = retourneAleatoire()
                }
        )
        .onAppear {
            //recupere le texte saisie dans le texteField
            caracteres = Array(chaineSaisie)
        }
        Spacer()
    }
    //Retourne un element aléatoire du tableau de couleur
    func retourneAleatoire() -> Int {
        return Int.random(in: 0...listeCouleur.count)
    }
}


struct Serpentin_Previews: PreviewProvider {
    static var previews: some View {
        Serpentin(chaineSaisie: .constant(""))
    }
}
