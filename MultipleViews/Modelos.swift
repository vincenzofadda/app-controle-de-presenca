//
//  Modelos.swift
//  MultipleViews
//
//  Created by Roberto on 25/05/23.
//

import Foundation
import SwiftUI

struct Usuario: Codable {
    let id: String
    let nome: String
    let login: String
    let senha: String
    let usuariotipo: String
    let reset: Bool
    let ativo: Bool
    let data_cricao: Date
}

struct UsuarioTipo: Codable {
    let id: String
    let nome: String
}

struct Turma: Codable {
    let id: String
    let professor: String
    let nome: String
    let periodo: String
    let diasemana: String
    let ativo: String
}

struct TurmaAluno: Codable {
    let id: String
    let turma: String
    let usuario: String
    let ativo: String
}

struct TurmaAlunosFrequencia: Codable {
    let id: String
    let usuario: String
    let turma: String
    let data: String
    let comparecimento: String
}
