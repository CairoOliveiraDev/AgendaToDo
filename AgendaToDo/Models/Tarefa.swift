//
//  Tarefa.swift
//  AgendaToDo
//
//  Created by CAIRO AUGUSTO CARVALHO DE OLIVEIRA on 30/11/21.
//

import Foundation
import UIKit

struct Tarefa{
    var id = UUID()
    var nome: String = ""
    var data: Date = Date()
    var categoria: Categoria = Categoria(nome: "Compras", color: .black)
}
