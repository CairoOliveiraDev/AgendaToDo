//
//  NovaTarefaTableViewController.swift
//  AgendaToDo
//
//  Created by CAIRO AUGUSTO CARVALHO DE OLIVEIRA on 01/12/21.
//

import UIKit

class NovaTarefaTableViewController: UITableViewController, UITextFieldDelegate {
    
    private var dataPicker: UIDatePicker = UIDatePicker()
    private var dateFormatter = DateFormatter()
    private var selectedIndexPath: IndexPath?
    private var tarefaRepository = TarefaRepository.instance
    
    var tarefa : Tarefa = Tarefa()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        dataPicker.datePickerMode = .dateAndTime

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Nome da Tarefa"
        }else if section == 1{
            return "Categoria"
        }else{
            return "Data e Hora"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TarefaDescricaoCell", for: indexPath) as! TarefaDescricaoTableViewCell
            cell.tarefaDescricaoTextField.delegate = self
            return cell
        }
        
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriaCell", for: indexPath)
            cell.textLabel?.text = self.tarefa.categoria.nome
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! DataTableViewCell
        cell.dataTextField.inputView = dataPicker
        cell.dataTextField.delegate = self
        cell.dataTextField.inputAccessoryView = accessoryView()
        return cell
    }
    // ACTION BUTTONS
    @IBAction func tapSaveButton(_ sender: Any) {
        tarefaRepository.save(tarefa: tarefa)
        self.navigationController?.popViewController(animated: true)
    }
    // DELEGATE METODOS
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        let cell = textField.superview?.superview as? DataTableViewCell
        if let dateCell = cell{
            self.selectedIndexPath = tableView.indexPath(for: dateCell)
            
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.tarefa.nome = textField.text!
    }
    
    // UIVIEW FUNCIONS
    
    func accessoryView()-> UIView{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let barItemSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Feito", style: .done, target: self, action: #selector(NovaTarefaTableViewController.selecionaData))
        toolBar.setItems([barItemSpace, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        return toolBar
    }
    
    @objc func selecionaData(){
        if let indexPath = self.selectedIndexPath{
            let cell = tableView.cellForRow(at: indexPath) as? DataTableViewCell
            if let dateCell = cell{
                dateCell.dataTextField.text = dateFormatter.string(from: dataPicker.date)
                self.view.endEditing(true)
                self.tarefa.data = dataPicker.date
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ParaCategoriaTableViewController" {
            let destino = segue.destination as! CategoriaTableViewController
            destino.categoriaSelecionada = { categoria in
                self.tarefa.categoria = categoria
                self.tableView.reloadData()
            }
        }
    }
    
}
