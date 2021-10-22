//
//  AppService.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 18/10/21.
//

import Foundation

class AppService {
    static let shared = AppService()
    
    let API = "https://servicespub.prod.api.aws.grupokabum.com.br/home/v1"
    
    func buscaProdutos(completion: @escaping (ProdutosResponse?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/home/produto") else {return}
        URLSession.shared.dataTask(with: url) { data, res, err in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else {return}
                let products = try JSONDecoder().decode(ProdutosResponse.self, from: data)
                completion(products, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
}
