//
//  Created by Furqan Ali Khan on 25/06/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//
/*

import Foundation
import UIKit

class CalenderCollectionViewSourceAdaptor : NSObject,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let calenderCollectionViewCellId = "CalenderTemplateCollectionViewCell"
    public var myList = [CalenderClass]()
    public var delegate: MonthChangedDelegate?
    var dummyCollectionView:UICollectionView?
    var month:String = ""
    
    public var EmptyStateView:UIView?
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        isMonthChanged(index: FindLastVisibleRowOnScreen())
    }
    
    
    func FindLastVisibleRowOnScreen()-> Int
    {
        let te = dummyCollectionView!.indexPathsForVisibleItems
        var lastIndex:Int = 0
        
        if te.count > 0
        {
            for counter in 0 ... te.count - 1
            {
                if te[counter].row > lastIndex
                {
                    lastIndex = te[counter].row
                }
            }
        }
        return lastIndex
    }
    
    
    func isMonthChanged(index:Int)
    {
        if month != myList[index].month
        {
            month = myList[index].month!
            delegate?.ReturnMonth(month: month)
            print("CHANGED MONTH")
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dummyCollectionView = collectionView
        return myList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let inset:CGFloat = 0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthOfScreen:CGFloat = (collectionView.frame.width - 35)
        let widthOfItem:CGFloat = (widthOfScreen / 7)
        return CGSize(width: widthOfItem, height: 44)
    }
    
    var didSetSelectedFirstTimeFlag:Bool = false // using this flag because I select current date from front
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: calenderCollectionViewCellId, for: indexPath) as! CalenderTemplateCollectionViewCell
        
        cell.UpdateCell(inputObject: myList[indexPath.row])
        
        if didSetSelectedFirstTimeFlag == false
        {
            if myList[indexPath.row].isSelected == true
            {
                lastSelectedIndex = indexPath.row
                didSetSelectedFirstTimeFlag = true
            }
        }
        return cell
    }
    
    var lastSelectedIndex:Int = -1
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if lastSelectedIndex == -1
        {
            lastSelectedIndex = indexPath.row
            myList[indexPath.row].isSelected = true
            
            collectionView.reloadItems(at: [indexPath])
        }
        else
        {
            if lastSelectedIndex != indexPath.row
            {
                myList[lastSelectedIndex].isSelected = false
                myList[indexPath.row].isSelected = true
                let oldIndexPath:IndexPath = IndexPath.init(row: lastSelectedIndex, section: 0)
                lastSelectedIndex = indexPath.row
                collectionView.reloadItems(at: [indexPath,oldIndexPath])
            }
            
        }
        
        delegate?.DateSelected(index: indexPath.row)
        
        
    }
    
}

 
 */
