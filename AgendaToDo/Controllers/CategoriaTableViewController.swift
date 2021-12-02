//
//  CategoriaTableViewController.swift
//  AgendaToDo
//
//  Created by CAIRO AUGUSTO CARVALHO DE OLIVEIRA on 02/12/21.
//

import UIKit

class CategoriaTableViewController: UITableViewController {
    
    let categorias = CategoriaRepository.getCategorias()
    var categoriaSelecionada : ((Categoria) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categorias.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EscolhaCategoriaCell", for: indexPath)
        let categoria = categorias[indexPath.row]
        cell.textLabel?.text = categoria.nome
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoria = categorias[indexPath.row]
        self.categoriaSelecionada!(categoria)
        self.navigationController?.popViewController(animated: true)
    }

 

}
