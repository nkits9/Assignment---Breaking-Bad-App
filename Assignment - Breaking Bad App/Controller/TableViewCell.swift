//
//  TableViewCell.swift
//  Assignment - Breaking Bad App
//
//  Created by MOHIT SHARMA on 04/12/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var icon: UIImageView!
    @IBOutlet var name: UILabel!

    
    var imageURL = String() {
        didSet {
            fetchImage(imageURL: imageURL)
        }
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
    
    var characName = String() {
        didSet {
            name.text = characName
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
//        name.text = characName
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
