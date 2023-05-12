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
                
                Text("Bem vindo(a) ao aplicativo de controle de chamada")
                    .font(.largeTitle)
                
                Spacer()
                
                NavigationLink(destination: SecondView()) {
                    Text("Entrar como professor")
                        .font(.title)
                        //.padding()
                        .background(.clear)
                        .foregroundColor(.blue)
                        //.cornerRadius(10)
                }
                
                NavigationLink(destination: SecondView()) {
                    Text("Entrar como aluno")
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


