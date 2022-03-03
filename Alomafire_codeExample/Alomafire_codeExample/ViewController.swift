//
//  ViewController.swift
//  Alomafire_codeExample
//
//  Created by Eslam Ali  on 03/03/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
  var model = [Films]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        NetworkManager.shared.fetchFilms { response in
            self.model = response
            print( self.model[0].results[0].title)
            
        }
      
        //print(model.count)
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data =  model[indexPath.row].results[indexPath.row]
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.producer
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
        
        
        //    cell.textLabel?.text =
        //  cell.detailTextLabel?.text = data.results[indexPath.row].director
        return cell
    }
    
    
}

