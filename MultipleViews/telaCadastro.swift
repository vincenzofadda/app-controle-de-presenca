//
//  ContentView.swift
//  picker
//
//  Created by Felipe Frances on 23/05/23.
//

import SwiftUI

enum ProfileSection : String, CaseIterable {
    case professor = "Professor"
    case aluno = "Aluno"
}

struct Cadastro: View {
    @State private var nomeCompleto: String = ""
    @State private var email: String = ""
    @State private var criarSenha: String = ""
    @State private var confirmarEmail: String = ""
    @State private var aluno = false
    @State var segmentationSelection : ProfileSection = .professor
    
    var body: some View {
       
        VStack {
            Text("Cadastre-se")
                .bold()
                .padding()
        
            
            Picker("", selection: $segmentationSelection) {
                ForEach(ProfileSection.allCases, id: \.self) { option in
                    Text(option.rawValue)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding()
            
            if segmentationSelection == .professor {
                VStack {
                    TextField("Digite seu nome completo", text: $nomeCompleto)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Digite seu e-mail", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Confirme seu e-mail", text: $confirmarEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Insira sua senha", text: $criarSenha)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    
                    Button("Cadastrar") {
                        //                authenticateUser()
                        
                        
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
            } else {
                VStack {
                    TextField("Digite seu nome completo", text: $nomeCompleto)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Digite seu e-mail", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Confirme seu e-mail", text: $confirmarEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Insira sua senha", text: $criarSenha)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    
                    Button("Cadastrar") {
                        //                authenticateUser()
                        
                        
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .background(.red)
            }
        }
    }
}

struct Cadastro_Previews: PreviewProvider {
    static var previews: some View {
        Cadastro()
    }
}
