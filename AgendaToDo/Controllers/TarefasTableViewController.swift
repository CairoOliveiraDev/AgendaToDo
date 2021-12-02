//
//  TarefasTableViewController.swift
//  AgendaToDo
//
//  Created by CAIRO AUGUSTO CARVALHO DE OLIVEIRA on 29/11/21.
//

import UIKit



class TarefasTableViewController: UITableViewController {
    
    private var dataFormat: DateFormatter = DateFormatter()
    private var tarefas: [Tarefa] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tarefas = TarefaRepository.instance.getTarefas()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TarefaCell", for: indexPath) as! TarefaTableViewCell
        let tarefa = tarefas[indexPath.row]
        
        dataFormat.dateFormat = "HH:mm"
        cell.horaLabel.text = dataFormat.string(from: tarefa.data)
        
        dataFormat.dateFormat = "dd/MM/yyyy"
        cell.dataLabel.text = dataFormat.string(from: tarefa.data)
        
        cell.categoriaNomeLabel.text = tarefa.categoria.nome
        cell.categoriaView.backgroundColor = tarefa.categoria.color
        cell.tarefaDescricaoLabel.text = tarefa.nome
        
        return cell
    }

}
