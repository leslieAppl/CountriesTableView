//
//  CountriesTableViewCell.swift
//  CountriesTableView
//
//  Created by leslie on 2/18/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLbl: UILabel!
    
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
        
        let row = index.row
        let section = index.section
        
        switch currentViewModeValue {
        case .Simple:
            mainLbl.text = countriesList[row].name
        case .Extended:
            
            let countryKey = sectionTitles[section]
            
            if let countryValues = countryDictionary[countryKey] {
                
                mainLbl.text = countryValues[row].name
            }
        }
        

        mainLbl.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
//        mainLbl.textAlignment = .center

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
