//
//  ViewController.swift
//  CountriesTableView
//
//  Created by leslie on 2/18/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class CountriesVC: UIViewController {
    
    let lableHeader = UILabel(frame: CGRect(x: 16, y: 20, width: 200, height: 20))
    let lableFooter = UILabel(frame: CGRect(x: 16, y: 18, width: 200, height: 20))
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUITableView()
        
    }
    
    @IBAction func switchModePressed(_ sender: Any) {
        
        // switching mode
        switch currentViewModeValue {
        case .Simple:
            currentViewModeValue = .Extended
            createExtendedTableViewData()
        case .Extended:
            currentViewModeValue = .Simple
        }
        
        self.updateTableViewData()
    }
    
    // TODO: Setup Table View
    func setupUITableView() {
        
        // TODO: Registers a nib object containing a cell with the table view
        // The UINib object looks for the nib file in the bundle's
        tableView.register(UINib.init(nibName: "CountriesTableViewCell", bundle: nil), forCellReuseIdentifier: "countriesTableViewCell")
        
        // TODO: Setup tableView separator property
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
//        tableView.separatorColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        // TODO: Setup TableView Header and Footer
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 60))
        tableView.tableHeaderView?.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        lableHeader.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lableHeader.textAlignment = .left
        lableHeader.text = "\(countriesList.count) Countries".uppercased()
        tableView.tableHeaderView?.addSubview(lableHeader)
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 60))
        tableView.tableFooterView?.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        lableFooter.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lableFooter.textAlignment = .left
        lableFooter.text = "\(countriesList.count) Countries".uppercased()
        tableView.tableFooterView?.addSubview(lableFooter)
        
        // TODO: Setup Section Index
        tableView.sectionIndexTrackingBackgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        tableView.sectionIndexColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }
}

extension CountriesVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableView Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        
        switch currentViewModeValue {
        case .Simple:
            return 1
        case .Extended:
            return sectionTitles.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch currentViewModeValue {
        case .Simple:
            return countriesList.count
        case .Extended:
            
            let countryKey = sectionTitles[section] // A, B, C
            
            if let countryValues = countryDictionary[countryKey] {
                
                return countryValues.count
                
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // initiate new cell with subtitle style
//        let cell3 = UITableViewCell(style: .subtitle, reuseIdentifier: "countriesTableViewCell2")
//        cell3.textLabel?.text = countriesList[indexPath.row].name
//        cell3.textLabel?.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
//        cell3.detailTextLabel?.text = "\(countriesList[indexPath.row].population)"
//        cell3.detailTextLabel?.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//        return cell3
        
        // custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "countriesTableViewCell", for: indexPath) as! CountriesTableViewCell
        cell.configureCell(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch currentViewModeValue {
        case .Simple:
            return nil
        default:
            
            return sectionTitles[section] // A, B, C
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch currentViewModeValue {
        case .Simple:
            return 0
        default:
            
            return 6
        }
    }
    
    // TODO: Setup TableView Section Header Text Floating on the Screen
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 6))
        returnedView.backgroundColor = #colorLiteral(red: 0.9385011792, green: 0.7164435983, blue: 0.3331357837, alpha: 0.75)
        
        // 'y' is the point of setting Header text floating on the Screen!
        let label = UILabel(frame: CGRect(x: 16, y: self.view.bounds.minY + 10, width: 200, height: 20 ))
        label.text = sectionTitles[section] // A, B..
        label.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        returnedView.addSubview(label)
        
        return returnedView
    }
    
    // MARK: - TableView Delegate
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // deselect row. return from selected mode when select row
        self.tableView.deselectRow(at: indexPath, animated: true )
        
        DispatchQueue.main.async {
            
        }
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
    //        let country = countriesList[indexPath.row].name
    //        if country == "USA" {
    //
    //            return 80
    //        }
            
            return 40
            
        }
    
    // UITableViewCell.accessoryType
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        // show detailButton view
        // Tip: to implement Alert View is to set UIviewController as self.UIViewController as base View, not the 'UITableVew'.
        self.showPopulationAlert(vc: self, title: "\(countriesList[indexPath.row].name)", message: "\(countriesList[indexPath.row].population)")
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = indexPath.section
        let row = indexPath.row
        
        
            
            let deleteAction = UIContextualAction(style: .normal, title: "🚮") { (action, view, success) in
                
                switch currentViewModeValue {
                case .Simple:
                    if !countriesList.isEmpty {
                        
                        countriesList.remove(at: row)

                    }
                case .Extended:
                    if !countryDictionary.isEmpty {
                        // remove element in the dictionary array
                        let countryKey = sectionTitles[section]
                    }
                }
                
                // self.tableView.reloadData() was replaced by calling self.updateTableViewData()
//                self.tableView.reloadData() // Important to renew the tableview
                
                self.updateTableViewData()
            }
            
            deleteAction.backgroundColor = UIColor.red
            deleteAction.image = #imageLiteral(resourceName: "trash")
            
            let swipActionConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
            swipActionConfiguration.performsFirstActionWithFullSwipe = false
//            swipActionConfiguration.performsFirstActionWithFullSwipe = true

            return swipActionConfiguration
        
        
    }
    
    func updateTableViewData() {
        
//        createExtendedTableViewData()
        
        self.tableView.reloadData() // Important to renew the tableview
        
        DispatchQueue.main.async {
            
            self.lableHeader.text = "\(countriesList.count) Countries".uppercased()
            self.lableFooter.text = "\(countriesList.count) Countries".uppercased()
        }
    }

    
    func showPopulationAlert(vc: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
