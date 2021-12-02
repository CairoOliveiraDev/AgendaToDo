//
//  TarefaRepository.swift
//  AgendaToDo
//
//  Created by CAIRO AUGUSTO CARVALHO DE OLIVEIRA on 02/12/21.
//

import Foundation
import UIKit

class TarefaRepository{
    static let instance: TarefaRepository = TarefaRepository()
    
    private var tarefas: [Tarefa]
    
    private init(){
        self.tarefas = []
    }
    
    func save(tarefa: Tarefa){
        self.tarefas.append(tarefa)
    }
    
    func update(tarefaAtualizar: Tarefa){
        let tarefaIndex = tarefas.firstIndex{(tarefa) -> Bool in
            tarefa.id == tarefaAtualizar.id
        }
        tarefas.remove(at: tarefaIndex!)
        tarefas.append(tarefaAtualizar)
    }
    
    func getTarefas() -> [Tarefa]{
        self.tarefas
    }
    
}
