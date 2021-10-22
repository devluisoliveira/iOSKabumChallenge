//
//  ProductModel.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 18/10/21.
//

import Foundation

struct ProdutosResponse: Codable {
    let produtos: [Produtos]
}

struct Produtos: Codable {
    let img: String
    let nome: String
    let precoFormatado: String
    let precoDescontoFormatado: String
    let fabricante: Fabricantes
    
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case img
        case nome
        case precoFormatado = "preco_formatado"
        case precoDescontoFormatado = "preco_desconto_formatado"
        case fabricante
      }
}

struct Fabricantes: Codable {
    let nome: String
}
