//
//  DetailViewController.swift
//  Assignment - Breaking Bad App
//
//  Created by MOHIT SHARMA on 04/12/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var birthdate: UILabel!
    
    var imageURL = String()
    var characName = String()
    var characStatus = String()
    var characBirthdate = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = characName
        status.text = characStatus
        birthdate.text = characBirthdate
        print("imageURL - ", imageURL)
        fetchImage(imageURL: imageURL)
        
    }
    
    
    func fetchImage(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        let getDataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.icon.image = image
            }
        }
        getDataTask.resume()
    }
}
