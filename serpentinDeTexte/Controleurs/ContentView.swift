//
//  ContentView.swift
//  serpentinDeTexte
//
//  Created by Philippe MICHEL on 17/02/2021.
//

import SwiftUI
import SafariServices

struct ContentView: View {
    @State var boutonInstruction:Bool = false
    @State var montrerFenetreAPropos:Bool = false
    @State var montrerSafari:Bool = false
    @State var texteSaisie = ""
    var urlString = "https://www.titastus.com"
    
    var body: some View {
        NavigationView {
            ZStack {
                MessageTexte(texteSaisie: $texteSaisie)
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
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
