import SwiftUI

func criptografaSenha(senha :String) -> String{
    return senha.sha256()
}

enum AuthenticationStatus {
    case success
    case failure
}

struct Login: View {
    var api = API()
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
            
            Button(action: {
                // let parameters: [String: Any] = ["id": "6", "nome": "teste"]
                // api.updateSenhaUsuario(parameters: parameters)
                // api.delete(column: "id", value: "88", sheet: "UsuarioTipo")
                api.updateteste()
//                Task {
//                    await api.listaUsuarios()
//                }
            }, label: {
                Text("Delete")
            })
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            switch authenticationStatus {
            case .success:
                Text("Autenticação bem-sucedida!")
            case .failure:
                Text("Erro de autenticação.  Verifique suas credenciais.")
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
        
//        if await api.procuraUsuario(nome: username) == true {
//
//            let usuariologado = api.retornoUsuario.first
//
//            if usuariologado?.senha == password.sha256() {
//                // Senha correta, autenticação bem-sucedida
//                authenticationStatus = .success
//            } else {
//                // Senha incorreta
//                authenticationStatus = .failure
//            }
//        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
