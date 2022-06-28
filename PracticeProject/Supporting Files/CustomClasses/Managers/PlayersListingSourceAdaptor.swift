//

//
//  Created by Furqan Ali Khan on 01/07/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//

/*

import Foundation
import UIKit

class PlayersListingSourceAdaptor: NSObject, UITableViewDelegate, UITableViewDataSource  {
    
    let ViewCellId = "PlayersListingTableViewCell"
    public var myList = [TeamAndPlayerClass]()
    public var EmptyStateView:UIView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewCellId, for: indexPath) as! PlayersListingTableViewCell
        cell.UpdateCell(inputObject: myList[indexPath.row])
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell =   tableView.cellForRow(at: indexPath)  as! PlayersListingTableViewCell
        let parenViewController:UIViewController = GetCurrentViewControllerClass.FirstAvailableViewController(inputView: cell)
        let viewController = PlayersListingViewController()
        viewController.globalPlayerId = myList[indexPath.row].id ?? "1"
        parenViewController.navigationController!.pushViewController(viewController, animated: true)
    }
    
}
 
 */
