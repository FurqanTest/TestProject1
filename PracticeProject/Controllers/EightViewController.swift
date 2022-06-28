// RXSWIFT DEMOOOOOOOOo
//  EightViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/3/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class EightViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableview: UITableView!
    var bag = DisposeBag()
    
    var viewModel = EightViewModel()
    
    var textValue = PublishSubject<String>()
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib2 = UINib(nibName: "FifthVCTableViewCell", bundle: nil)
        tableview.register(cellNib2, forCellReuseIdentifier: "FifthVCTableViewCell")
        
        bindTableViewToData(fetchTheData: true)
        
        textValue.asObserver().subscribe(onNext: { value in
          //  print("New Value is updated \(value)")
            self.textfield.text = value
        }).disposed(by: bag)
        
        
    }
    
    func bindTableViewToData(fetchTheData:Bool){
        
        viewModel.items.bind(to: tableview.rx.items(cellIdentifier: "FifthVCTableViewCell", cellType: FifthVCTableViewCell.self)) { row ,model, cell in
            cell.label.text = model.text
            cell.backgroundColor = model.color
        }.disposed(by: bag)
        
        tableview.rx.modelSelected(FifthClass.self).bind{ product in
            print(product.text!)
        }.disposed(by: bag)
        
        
        viewModel.items.asObserver().subscribe { item in
            print("items New Furqan \(item)")
        }


        
        if fetchTheData == true{
            viewModel.fetchItems()
        }
        
    }
    
    
    @IBAction func clickToAddClicked(_ sender: UIButton) {
        
        textValue.onNext("Heelo 1 2 3")
//        viewModel.myList.append(FifthClass(text: "Counter\(13)", color: .random()))
//        viewModel.items.onNext(viewModel.myList)
//        viewModel.items.onCompleted()
//        tableview.reloadData()
        
        removeItem(at: IndexPath(row: 5, section: 0))
//        viewModel.myList.append(FifthClass(text: "Counter\(13)", color: .random()))
    }
    
func removeItem(at indexPath: IndexPath) {
    guard var sections = try? viewModel.items.value() else { return }
    sections.append(FifthClass(text: "new Items", color: .random()))
    viewModel.items.onNext(sections)
    tableview.reloadData()
}

}




struct EightViewModel{
    var items = BehaviorSubject<[FifthClass]>(value: [FifthClass]())
    var myList = [FifthClass]()
    mutating func fetchItems(){
        for count in 0...10{
            myList.append(FifthClass(text: "Counter\(count)", color: .random()))
        }
        
        items.onNext(myList)
        items.onCompleted()
    }
   
}
