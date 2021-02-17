//
//  MessageTexte.swift
//  serpentinDeTexte
//
//  Created by Philippe MICHEL on 17/02/2021.
//

import SwiftUI
import SafariServices

struct MessageTexte: View {
    @Binding var texteSaisie:String
    @State var boutonInstruction:Bool = false
    @State var champsDeSaisieRempli:Bool = false
    @State var montreAlerte:Bool = false
    @State var montrerFenetreAPropos:Bool = false
    var urlString = "https://www.titastus.com"
    @State var montrerSafari:Bool = false
    
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
                    })// fin bouton
            
            // montrer genetre A propos
            if montrerFenetreAPropos {
                ZStack(alignment: .center) {
                    FenetreMenu(largeurFenetre: 270, hauteurFenetre: 130)
                    VStack {
                        HStack {
                            Image(Ressources.images.titastus.rawValue)
                                .resizable()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            Button(action: {
                                montrerSafari.toggle()
                            }, label: {
                                Text("www.titastus.com")
                            }) .sheet(isPresented: $montrerSafari) {
                                ControleurSafari(url: URL(string: self.urlString)!)
                                    .padding()
                            }
                        }
                        
                        BoutonFermeture(fermetureFenetre: $montrerFenetreAPropos, couleurFond: .black, couleurTexte: .red)
                    }
                }
            } // fin de if
            Spacer()
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button(action: {
                                self.boutonInstruction.toggle()
                            }, label: {
                                Text("instructionButton")
                            })
                            // Montre la fenetre des instructions
                            .sheet(isPresented: $boutonInstruction) {
                                Instructions()
                            }
                            Spacer(minLength: 40)
                            Button(action: {
                                self.montrerFenetreAPropos.toggle()
                            }, label: {
                                Text("aboutus")
                            })
                            Spacer()
                            
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
