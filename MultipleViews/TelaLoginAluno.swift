//
//  SecondView.swift
//  MultipleViews
//
//  Created by user on 12/05/23.
//

import SwiftUI

/*
struct SecondView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Tela 2")
                .font(.largeTitle)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Adicione aqui a lógica para autenticar o usuário
            }) {
                Text("Login")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle("Login")
        .padding()
    }
}
 */
enum AuthenticationStatusAluno {
    case success
    case failure
}

struct LoginAluno: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var AuthenticationStatusAluno: AuthenticationStatusAluno?
    
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
            
            switch AuthenticationStatusAluno {
            case .success:
                Text("Autenticação bem-sucedida!")
            case .failure:
                Text("Erro de autenticação. Verifique suas credenciais.")
                    .foregroundColor(.red)
            case .none:
                EmptyView()
            }
        }
        .padding()
    }
    
    func authenticateUser() {
        // Aqui você pode implementar a lógica de autenticação do usuário
        // Verificar se as credenciais são válidas, por exemplo, consultando um serviço de autenticação
        
        // Exemplo de lógica simples para autenticar o usuário
        if username == "aluno" && password == "senha" {
            AuthenticationStatusAluno = .success
        } else {
            AuthenticationStatusAluno = .failure
        }
    }
}



struct LoginAluno_Previews: PreviewProvider {
    static var previews: some View {
        LoginAluno()
    }
}




