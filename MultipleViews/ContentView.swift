//
//  ContentView.swift
//  MultipleViews
//
//  Created by user on 12/05/23.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
        NavigationView {
            ZStack{
                gradient
                    .ignoresSafeArea()
                VStack {
                    
                    Text("Tenha uma sala de aula na palma da sua mao")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(.white)
                        .padding(.top, proxy.size.height * 0.67)
                    
                    Spacer()
                    
                    NavigationLink(destination: Login()) {
                        Text("Login")
                            .font(.custom("Poppins-Bold", size: 17))
                            .padding()
                            .frame(width: proxy.size.width * 0.85, height: proxy.size.height * 0.06)
                            .background(purple)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(color: blackWithOpacity, radius: 10, x: 3, y: 5)
                    }
                    
                    NavigationLink(destination: Cadastro()) {
                        Text("Cadastrar")
                            .font(.custom("Poppins-Bold", size: 17))
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


