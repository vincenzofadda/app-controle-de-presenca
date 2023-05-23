//
//  ContentView.swift
//  MultipleViews
//
//  Created by user on 12/05/23.
//

import SwiftUI

let startColor = Color(
    .sRGB,
    red: Double(0x5C) / 255,
    green: Double(0x22) / 255,
    blue: Double(0xD3) / 255,
    opacity: 1
)

let endColor = Color(
    .sRGB,
    red: Double(0x30) / 255,
    green: Double(0x62) / 255,
    blue: Double(0xF2) / 255,
    opacity: 1
)

let gradient = LinearGradient(
    gradient: Gradient(colors: [startColor, endColor]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)


struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
        NavigationView {
            ZStack{
                gradient
                    .ignoresSafeArea()
                VStack {
                    
                    Text("Tenha uma sala de aula na palma da sua mão")
                        .font(.body)
                        .foregroundColor(.white)
                        
                    
                    Spacer()
                    
                    NavigationLink(destination: Login()) {
                        Text("Login")
                            .font(.title)
                            .padding()
                            .frame(width: proxy.size.width * 0.85)
                            .background(.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: Cadastro()) {
                        Text("Cadastrar")
                            .font(.title)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                
                .padding()
            }
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


