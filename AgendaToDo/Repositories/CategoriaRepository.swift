//
//  CategoriaRepository.swift
//  AgendaToDo
//
//  Created by CAIRO AUGUSTO CARVALHO DE OLIVEIRA on 02/12/21.
//

import Foundation
import UIKit

class CategoriaRepository{
    static func getCategorias()->[Categoria]{
        let categorias = [
            Categoria(nome: "Trabalho", color: UIColor.green),
            Categoria(nome: "Estudo", color: UIColor.blue),
            Categoria(nome: "A Fazer", color: UIColor.yellow),
            Categoria(nome: "Lembretes", color: UIColor.red)
        ]
        
        return categorias;
    }
}
