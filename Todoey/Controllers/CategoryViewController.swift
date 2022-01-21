//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Carlos Cobian on 17/01/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        //loadData()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category.name
        
        return cell
    }
    
    //MARK: - Data Manipulation Methods
    func saveData(category: Category){
        do{
            try realm.write{
                realm.add(category)
            }
        }catch{
            print("Error saving context: \(error)")
        }
        tableView.reloadData()
    }
    
//    func loadData(with request: NSFetchRequest<Category> = Category.fetchRequest()){
//        do{
//            categories = try context.fetch(request)
//        }catch{
//            print("Error fetching data from context \(error)")
//        }
//        tableView.reloadData()
//    }
    
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFieldText = UITextField()
        
        let alert = UIAlertController.init(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "Add category", style: .default) { action in
            let newCategory = Category()
            newCategory.name = textFieldText.text!
            self.categories.append(newCategory)
            self.saveData(category: newCategory)
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Add new category"
            textFieldText = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categories[indexPath.row]
        }
        
       
    }
}
