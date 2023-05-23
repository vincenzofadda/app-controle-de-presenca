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

struct ContentView: View {
    @State private var nomeCompleto: String = ""
    @State private var email: String = ""
    @State private var criarsenha: String = ""
    @State private var repetirEmail: String = ""
    @State private var aluno = false
    @State var segmentationSelection : ProfileSection = .professor
    var body: some View {
            Picker("", selection: $segmentationSelection) {
                ForEach(ProfileSection.allCases, id: \.self) { option in
                    Text(option.rawValue)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding()
            
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

            TextField("Confirme seu e-mail", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocorrectionDisabled()
                .autocapitalization(.none)

            SecureField("Insira sua senha", text: $criarsenha)
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

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
