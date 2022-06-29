//
//  FifteenViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/29/22.
//
import Foundation
import AVFoundation
import UIKit

class FifteenViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    
    let synthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .random()
        
      
    }
    
    @IBAction func onConvertClick(_ sender: UIButton) {
        convertAudio()
        
        
    }
    
    func convertAudio(){
        let utterance = AVSpeechUtterance(string: textview.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5
        utterance.volume = 1.0
        synthesizer.speak(utterance)
    }
    

}
