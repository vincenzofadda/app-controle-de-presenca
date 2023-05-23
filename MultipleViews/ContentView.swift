//
//  ContentView.swift
//  MultipleViews
//
//  Created by user on 12/05/23.
//

import SwiftUI

let purple = Color(
    .sRGB,
    red: Double(0x51) / 255,
       green: Double(0x1E) / 255,
       blue: Double(0xE4) / 255,
       opacity: 1
)

let blue = Color(
    .sRGB,
        red: Double(0x30) / 255,
        green: Double(0x62) / 255,
        blue: Double(0xF2) / 255,
        opacity: 1
)

let startGradient = Color(
    .sRGB,
        red: Double(0x5C) / 255,
        green: Double(0x22) / 255,
        blue: Double(0xD3) / 255,
        opacity: 1
)

let endGradient = Color(
    .sRGB,
        red: Double(0x30) / 255,
        green: Double(0x62) / 255,
        blue: Double(0xF2) / 255,
        opacity: 1
)

let blackWithOpacity = Color.black.opacity(0.25)

let gradient = LinearGradient(
    gradient: Gradient(colors: [startGradient, endGradient]),
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
                    
                    Text("Tenha uma sala de aula na palma da sua mao")
                        .font(.custom("Poppins-Medium", size: proxy.size.height * 0.018))
                        .foregroundColor(.white)
                        .padding(.top, proxy.size.height * 0.67)
                    
                    Spacer()
                    
                    NavigationLink(destination: Login()) {
                        Text("Login")
                            .font(.custom("Poppins-Bold", size: proxy.size.height * 0.025))
                            .padding()
                            .frame(width: proxy.size.width * 0.85, height: proxy.size.height * 0.06)
                            .background(purple)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(color: blackWithOpacity, radius: 10, x: 3, y: 5)
                    }
                    
                    NavigationLink(destination: Cadastro()) {
                        Text("Cadastrar")
                            .font(.custom("Poppins-Bold", size: proxy.size.height * 0.025))
                            .padding()
                            .frame(width: proxy.size.width * 0.85, height: proxy.size.height * 0.06)
                            .background(blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(color: blackWithOpacity, radius: 10, x: 3, y: 5)
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


