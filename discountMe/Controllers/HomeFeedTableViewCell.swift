//
//  HomeFeedTableViewCell.swift
//  discountMe
//
//  Created by Arik Saadi on 24/07/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dealNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onTapDealExpand(_ sender: Any) {
        // TODO Connect it to list of favorites.
    }
    
    
}
