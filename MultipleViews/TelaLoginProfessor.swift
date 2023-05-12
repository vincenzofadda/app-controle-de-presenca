//
//  SecondView.swift
//  MultipleViews
//
//  Created by user on 12/05/23.
//

import SwiftUI

enum AuthenticationStatusProfessor {
    case success
    case failure
}

struct LoginProfessor: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var AuthenticationStatusProfessor: AuthenticationStatusProfessor?
    
    var body: some View {
        VStack {
            TextField("Nome de usuário", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            SecureField("Senha", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Entrar") {
                authenticateUser()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            switch AuthenticationStatusProfessor {
            case .success:
                Text("Autenticação bem-sucedida!")
            case .failure:
                Text("Erro de autenticação. Verifique suas credenciais.")
                    .foregroundColor(.red)
            case .none:
                EmptyView()
            }
        }
        .navigationBarTitle("Bem-vindo, professor!")
        .padding()
    }
    
    func authenticateUser() {
        // Aqui você pode implementar a lógica de autenticação do usuário
        // Verificar se as credenciais são válidas, por exemplo, consultando um serviço de autenticação
        
        // Exemplo de lógica simples para autenticar o usuário
        if username == "professor" && password == "senha" {
            AuthenticationStatusProfessor = .success
        } else {
            AuthenticationStatusProfessor = .failure
        }
    }
}



struct TelaLoginProfessor_Previews: PreviewProvider {
    static var previews: some View {
        LoginProfessor()
    }
}




