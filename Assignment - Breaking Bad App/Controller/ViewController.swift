//
//  ViewController.swift
//  Assignment - Breaking Bad App
//
//  Created by MOHIT SHARMA on 04/12/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var allCharacters = [BBCharacter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        table.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
                        
        getBreakingBadData { (BBCharacters) in
            DispatchQueue.main.async {
                self.allCharacters = BBCharacters
                self.table.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let charac = allCharacters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.characName = charac.name
        cell.imageURL = charac.image
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let charac = allCharacters[indexPath.row]
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.imageURL = charac.image
        detailVC.characName = charac.name
        detailVC.characStatus = charac.status
        detailVC.characBirthdate = charac.birthday
        self.navigationController?.pushViewController(detailVC, animated: true)
    }


}

