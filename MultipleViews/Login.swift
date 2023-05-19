import SwiftUI

enum AuthenticationStatus {
    case success
    case failure
}

struct Usuario: Codable {
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
                authenticateUser()
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
        .task {
            await fetchData()
        }
    }
    
    func authenticateUser() {
        // Verificar se o usuário existe e se a senha está correta
        let userExists = users.contains { user in
            return user.login == username
        }
        
        if userExists {
            // Encontrou o usuário, agora verificar a senha
            let user = users.first { user in
                return user.login == username
            }
            
            if user?.senha == password {
                // Senha correta, autenticação bem-sucedida
                authenticationStatus = .success
            } else {
                // Senha incorreta
                authenticationStatus = .failure
            }
        } else {
            // Usuário não encontrado
            authenticationStatus = .failure
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://sheetdb.io/api/v1/5e8nz89fd5puk") else {
            print("A URL não está funcionando.")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            if let decodedResponse = try? decoder.decode([Usuario].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("O dado não é válido.")
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
