//
//  ContentView.swift
//  MultipleViews
//
//  Created by user on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Bem vindo(a) ao app")
                    .font(.largeTitle)
                
                Spacer()
                
                NavigationLink(destination: Login()) {
                    Text("Fazer login")
                        .font(.title)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: Cadastro()) {
                    Text("Fazer cadastro")
                        .font(.title)
                        //.padding()
                        .background(.clear)
                        .foregroundColor(.blue)
                        //.cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("Controle de chamada")
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


