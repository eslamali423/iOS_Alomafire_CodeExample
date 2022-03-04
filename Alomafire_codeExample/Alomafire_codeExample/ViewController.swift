//
//  ViewController.swift
//  Alomafire_codeExample
//
//  Created by Eslam Ali  on 03/03/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableView: UITableView!
  //var model = [Film]()
    var model =  [User] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        NetworkManager.shared.fetchDeta{response in
            self.model = response
            print("this is the VIEWDIDLOAD Response :::::: \(response)")
            
            print(self.model[0].name)
            self.tableView.reloadData()
            
        }
        
    }
    // table 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let data =  model[0].name
//        cell.textLabel?.text = data.name
//        cell.detailTextLabel?.text = data.email
        cell.textLabel?.text = "eslam"
        DispatchQueue.main.async {
            tableView.reloadData()
            
        }
        
        
        //    cell.textLabel?.text =
        //  cell.detailTextLabel?.text = data.results[indexPath.row].director
        return cell
    }
    
    


}
