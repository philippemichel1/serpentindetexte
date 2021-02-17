//
//  MessageTexte.swift
//  serpentinDeTexte
//
//  Created by Philippe MICHEL on 17/02/2021.
//

import SwiftUI

struct MessageTexte: View {
    @Binding var texteSaisie:String
    @State var boutonInstruction:Bool = false
    @State var champsDeSaisieRempli:Bool = false
    @State var montreAlerte:Bool = false
    var body: some View {
        VStack {
            Text("title")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color.red)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            Spacer()
            //champs de saisie TextField
            TextField("userText", text: $texteSaisie)
                .padding(10)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.gray)
            //Bouton afficher le serpentin
            Button("serpentineButton", action:verificationSaisie)
                .padding()
                .foregroundColor(.red)
                .background(Color.gray)
                .cornerRadius(10)
            NavigationLink(
                destination: Serpentin(chaineSaisie: $texteSaisie),
                isActive:$champsDeSaisieRempli,
                label: {
                    EmptyView()
                })
                //affiche une alerte si le champs de saisie est vide
                .alert(isPresented: $montreAlerte, content: {
                    Alert(title: Text("alert"))
                })
            Spacer()
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {
                            self.boutonInstruction.toggle()
                        }, label: {
                            Text("instructionButton")
                        })
                        // Montre la fenetre des instructions
                        .sheet(isPresented: $boutonInstruction) {
                            Instructions()
                        }
                        
                    }
                }
            
        }
    }
    //Vérification du textField il ne doit pas etre vide.
    func verificationSaisie() {
        if texteSaisie == "" {
            champsDeSaisieRempli = false
            montreAlerte = true
        } else {
            champsDeSaisieRempli = true
            montreAlerte = false
        }
    }
}

struct MessageTexte_Previews: PreviewProvider {
    static var previews: some View {
        MessageTexte(texteSaisie: .constant("Texte"))
    }
}
