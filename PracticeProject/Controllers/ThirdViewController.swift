//
//  ThirdViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 5/30/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var gestureView: UIView!
    
    
    @IBOutlet weak var label: UILabel!
    
    var angel:CGFloat = 0.0
    var direction:String = "" //up/down
    @IBOutlet weak var ourView: UIView!
    
    
    var negateAngel:CGFloat{
        get{
            let temp = angel * -1
            return temp
        }
    }
    
    
    
    var menuOption:String{
        get{
            switch(angel)
            {
            case 0,360:
                return "Option1"
            case 90,-90:
                return "Option3"
            case 180,-180:
                return "Option4"
            case 270,-270:
                return "Option2"
                
            default:
                return ""
            }
        }
        
        
    }
    
    
    func selectRequiredView(){
        deSelectAll()
        switch(angel)
        {
        case 0,360:
            self.ourView.viewWithTag(1)!.backgroundColor = UIColor.init(red: 32/255, green: 149/255, blue: 210/255, alpha: 1)
        case 90,-90:
            self.ourView.viewWithTag(3)!.backgroundColor = UIColor.init(red: 32/255, green: 149/255, blue: 210/255, alpha: 1)
        case 180,-180:
            self.ourView.viewWithTag(4)!.backgroundColor = UIColor.init(red: 32/255, green: 149/255, blue: 210/255, alpha: 1)
        case 270,-270:
            self.ourView.viewWithTag(2)!.backgroundColor = UIColor.init(red: 32/255, green: 149/255, blue: 210/255, alpha: 1)
        default:
            break
        }
    }
    
    func deSelectAll(){
        self.ourView.viewWithTag(1)!.backgroundColor = UIColor.clear
        self.ourView.viewWithTag(2)!.backgroundColor = UIColor.clear
        self.ourView.viewWithTag(3)!.backgroundColor = UIColor.clear
        self.ourView.viewWithTag(4)!.backgroundColor = UIColor.clear
        
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label.text = menuOption
        
        let swipeGestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        let swipeGestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        swipeGestureRecognizerRight.direction = UISwipeGestureRecognizer.Direction.right
        self.gestureView.addGestureRecognizer(swipeGestureRecognizerRight)
        
        swipeGestureRecognizerLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.gestureView.addGestureRecognizer(swipeGestureRecognizerLeft)
        
        deSelectAll()
        selectRequiredView()
    }
    
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer)
    {
            switch sender.direction
            {
            case UISwipeGestureRecognizer.Direction.right:
                //write your logic for right swipe
               // print("Swiped right")
                direction = "up"
                rotateWheel()
                
            case UISwipeGestureRecognizer.Direction.left:
                //write your logic for left swipe
              //  print("Swiped left")
                direction = "down"
                rotateWheel()
                
            default:
                break
            }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.ourView.layer.cornerRadius = self.ourView.frame.height / 2
        
        
        
    }
    
    
    
    func rotateWheel() {
        
        if direction == "up"
        {
            if angel != 360{
                angel += 90.0
            }
            else{
                angel = 90
            }
        }
        else{
            
      //      print("Before \(angel)")
            if angel != 0{
                angel -= 90.0
            }
            else{
                angel = 270
            }
            
          //  print("AFter \(angel)")
        }
        
        
       
        
        self.label.alpha = 0
        self.label.text = self.menuOption
        UIView.animate(withDuration: 0.33, animations: {
            self.ourView.transform = CGAffineTransform(rotationAngle: (self.angel * CGFloat(Double.pi)) / 180.0)
            self.ourView.viewWithTag(1)!.transform = CGAffineTransform(rotationAngle: (self.negateAngel * CGFloat(Double.pi)) / 180.0)
            self.ourView.viewWithTag(2)!.transform = CGAffineTransform(rotationAngle: (self.negateAngel * CGFloat(Double.pi)) / 180.0)
            self.ourView.viewWithTag(3)!.transform = CGAffineTransform(rotationAngle: (self.negateAngel * CGFloat(Double.pi)) / 180.0)
            self.ourView.viewWithTag(4)!.transform = CGAffineTransform(rotationAngle: (self.negateAngel * CGFloat(Double.pi)) / 180.0)
            
            self.label.alpha = 1
        },completion: { _ in ()
            self.selectRequiredView()
        })
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) {[unowned self] timer in
            
            self.rotateWheel()
        }
    }
    
    
    
    
    
}
