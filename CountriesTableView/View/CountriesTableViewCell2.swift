//
//  CountriesTableViewCell2.swift
//  CountriesTableView
//
//  Created by leslie on 2/22/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class CountriesTableViewCell2: UITableViewCell {

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
        
        textLabel?.text = countriesList[index.row].name
        textLabel?.textColor = #colorLiteral(red: 0, green: 0.7665774226, blue: 0.2695714235, alpha: 1)
        detailTextLabel?.text = "\(countriesList[index.row].population)"
        detailTextLabel?.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        // We don't need down cast here, because we're modifying a public UITableViewCell property.
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
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
