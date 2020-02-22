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
    
    // TODO: Setup Table View
    func setupUITableView() {
        
        // TODO: Registers a nib object containing a cell with the table view
        // The UINib object looks for the nib file in the bundle's
        tableView.register(UINib.init(nibName: "CountriesTableViewCell2", bundle: nil), forCellReuseIdentifier: "countriesTableViewCell2")
        
        // TODO: Setup tableView separator property
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
//        tableView.separatorColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        // TODO: Setup TableView Header and Footer
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 60))
        tableView.tableHeaderView?.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        lableHeader.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lableHeader.textAlignment = .left
        lableHeader.text = "Countries".uppercased()
        tableView.tableHeaderView?.addSubview(lableHeader)
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 60))
        tableView.tableFooterView?.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        lableFooter.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lableFooter.textAlignment = .left
        lableFooter.text = "\(countriesList.count)".uppercased()
        tableView.tableFooterView?.addSubview(lableFooter)
        
        // ..
        tableView.sectionIndexTrackingBackgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        tableView.sectionIndexColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)

    }
}

extension CountriesVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countriesList.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "countriesTableViewCell2", for: indexPath) as! CountriesTableViewCell2
        cell.configureCell(at: indexPath)
        return cell
    }
    
    // MARK: - TableView Delegate
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // deselect row. return from selected mode when select row
        self.tableView.deselectRow(at: indexPath, animated: true )
        
        DispatchQueue.main.async {
            
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if !countriesList.isEmpty {
            
            let deleteAction = UIContextualAction(style: .normal, title: "🚮") { (action, view, success) in

                countriesList.remove(at: indexPath.row)
                                
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
        } else {
            
            return nil
            
        }
        
    }
    
    func updateTableViewData() {
        
        self.tableView.reloadData() // Important to renew the tableview
        
        DispatchQueue.main.async {
            
            self.lableFooter.text = "Countries count: \(countriesList.count)"
        }
    }

    
    func showPopulationAlert(vc: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
