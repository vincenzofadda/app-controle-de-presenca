//
//  API.swift
//  MultipleViews
//
//  Created by user on 23/05/23.
//

import Foundation
import SwiftUI


//struct Usuario: Codable{
//    let id: String
//    let login: String
//    let senha: String
//    let tipo: String
//}

//struct ContentView: View {
//
//    @State private var users = [Usuario]()
//
//    var body: some View {
//
//
//
//        VStack{
//
//        NavigationView{
//            List(users, id: \.id) {user in
//                VStack(alignment: .leading){
//                    // Text(user.id).font(.headline).foregroundColor(Color.blue)
//                    Text(user.login).font(.headline).foregroundColor(Color.blue)
//                    Text(user.senha).font(.headline).foregroundColor(.secondary)
//                    Text(user.tipo).font(.headline).foregroundColor(.secondary)
//              }
//            }.navigationTitle("Usuarioo").task {
//                await fetchData()
//        }
//    }
//
//
//            Button(action: {postUsuario()}) {
//                Text("Incluir")
//                    .foregroundColor(.blue)
//                    .font(.title)
//                    .padding()
//                    .border(Color.blue, width: 3)
//
//            }
//
//         }
//}

class API {
    let urlPadrao = "https://sheetdb.io/api/v1/5e8nz89fd5puk"
    
    public var users = [Usuario]()
    public var usertype = [UsuarioTipo]()
    public var turma = [Turma]()
    public var retornoUsuario = [Usuario]()
    
    func listaUsuarios() async{
        // guard let url = URL(string: "https://api.sheety.co/76f5c7009c1695f3365d24f26f3fe380/foundation/usuario")
        guard let url = URL(string: "\(urlPadrao)?sheet=Usuario")
        else {
            print("A URL nao esta funcionando.")
            return
        }
        do {
            let (dados, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            if let decodedResponse = try? decoder.decode([Usuario].self, from: dados) {
                users = decodedResponse
                print("decodificou")
                // print(users)
            } else {
                // print(users)
                print("nao decodificou")
            }
        } catch {
            print("O dado nao e valido.")
        }
    }
    

    func listaUsuarioTipo() async{
        guard let url = URL(string: "\(urlPadrao)?sheet=UsuarioTipo")
        else {
            print("A URL nao esta funcionando.")
            return
        }
        do {
            let (dados, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            if let decodedResponse = try? decoder.decode([UsuarioTipo].self, from: dados) {
                usertype = decodedResponse
                print("decodificou")
                // print(users)
            } else {
                // print(users)
                print("nao decodificou")
            }
        } catch {
            print("O dado nao e valido.")
        }
    }
    
    func listaTurma() async{
        guard let url = URL(string: "\(urlPadrao)?sheet=Turma")
        else {
            print("A URL nao esta funcionando.")
            return
        }
        do {
            let (dados, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            if let decodedResponse = try? decoder.decode([Turma].self, from: dados) {
                turma = decodedResponse
                print("decodificou")
                // print(users)
            } else {
                // print(users)
                print("nao decodificou")
            }
        } catch {
            print("O dado nao e valido.")
        }
    }
    
    
    
    
    func procuraUsuario(nome :String) async -> Bool{
        do {
            guard let url = URL(string: "\(urlPadrao)/search?login=\(nome)")
            else {
                print("URL Invalida.")
                return false
            }
            let (dados, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Usuario].self, from: dados) {
                retornoUsuario = decodedResponse
            }
        }
        catch {
            print("O dado nao e valido.")
        }
        return true
    }
    
    
    func postUsuario(){
        do {
            guard let url =  URL(string: urlPadrao)
            else{
                return
            }
            //### This is a little bit simplified. You may need to escape `username` and `password` when they can contain some special characters...
            // let body = "id=\(username)&password=\(password)"
            //let body = "id=99&login=teste&senha=123456&tipo=Professor"
            let body = "id=88&nome=teste&sheet=UsuarioTipo"
            let finalBody = body.data(using: .utf8)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalBody

            URLSession.shared.dataTask(with: request){
                (data, response, error) in
                //print(response as Any)
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else{
                    return
                }
               print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                
            }.resume()
        }
    }
    
    
    func delete(column :String, value: String, sheet: String){
        do {
            guard let url =  URL(string: "\(urlPadrao)?column=\(column)&value=\(value)&sheet=\(sheet)") //"https://sheetdb.io/api/v1/5e8nz89fd5puk?column=id&value=99&sheet=Usuario"
            else{
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"

            URLSession.shared.dataTask(with: request){
                (data, response, error) in
                //print(response as Any)
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else{
                    return
                }
               print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                
            }.resume()
        }
    }
    
    func updateSenhaUsuario(parameters: [String: Any]) {
        
        guard let url = URL(string: urlPadrao) else {
            print("URL error!")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request =  URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(Usuario.self, from: data)
                    DispatchQueue.main.async {
                        print("resultado -> ", result)
                    }
                } else {
                    print("no data")
                }
            } catch let JsonError {
                print("json error", JsonError.localizedDescription)
            }
        }.resume()
    }
    
}
    
    

