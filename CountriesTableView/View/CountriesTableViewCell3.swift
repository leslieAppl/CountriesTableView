//
//  CountriesTableViewCell3.swift
//  CountriesTableView
//
//  Created by leslie on 2/22/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class CountriesTableViewCell3: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // TODO: Configure Table View Cell
    func configureCell(at index: IndexPath) {
        
        self.textLabel?.text = countriesList[index.row].name
        self.detailTextLabel?.text = "\(countriesList[index.row].population)"
        textLabel?.textAlignment = .center
        textLabel?.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        detailTextLabel?.text = "\(countriesList[index.row].population)"
        detailTextLabel?.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        // We don't need down cast here, because we're modifying a public UITableViewCell property.
        self.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        // show button style at right side in table view cell
        self.accessoryType = .detailButton
        //        cell.accessoryType = .detailDisclosureButton
        
        // property of tableView(_: didSelectRowAt:) when select row
        //        cell.selectionStyle = .none
        self.selectionStyle = .blue
        
        // Down Cast from UITableViewCell as CountriesTableViewCell
        // Cause we need fetch custom property 'mainLbl.textColor' from CountriesTableViewCell
        
    }

}
