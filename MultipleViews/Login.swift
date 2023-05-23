import SwiftUI

func criptografaSenha(senha :String) -> String{
    
    
    return ""
}

enum AuthenticationStatus {
    case success
    case failure
}

public struct Usuario: Codable {
    let id: String
    let login: String
    let senha: String
    let tipo: String
}

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var authenticationStatus: AuthenticationStatus?
    @State private var users = [Usuario]()
    
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
                Task{
                    do {
                        await authenticateUser()
                    }
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            switch authenticationStatus {
            case .success:
                Text("Autenticação bem-sucedida!")
            case .failure:
                Text("Erro de autenticação. Verifique suas credenciais.")
                    .foregroundColor(.red)
            case .none:
                EmptyView()
            }
        }
        .navigationBarTitle("Login")
        .padding()
//        .task {
//            await fetchData()
//        }
    }
    
    func authenticateUser() async {
        
        if await procuraUsuario(nome: username) {
            
            let user = retornoUsuario.first
            
            if user?.senha == password {
                // Senha correta, autenticação bem-sucedida
                authenticationStatus = .success
            } else {
                // Senha incorreta
                authenticationStatus = .failure
            }
        }
    }
        
        
        
//        // Verificar se o usuário existe e se a senha está correta
//        let userExists = users.contains { user in
//            return user.login == username
//        }
//
//        if userExists {
//            // Encontrou o usuário, agora verificar a senha
//            let user = users.first { user in
//                return user.login == username
//            }
//
//            if user?.senha == password {
//                // Senha correta, autenticação bem-sucedida
//                authenticationStatus = .success
//            } else {
//                // Senha incorreta
//                authenticationStatus = .failure
//            }
//        } else {
//            // Usuário não encontrado
//            authenticationStatus = .failure
//        }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
