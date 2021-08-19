//
//  HomeFeedTableViewCell.swift
//  discountMe
//
//  Created by Arik Saadi on 24/07/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dealImageView: UIImageView!
    @IBOutlet weak var dealNameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
