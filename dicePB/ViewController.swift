//
//  ViewController.swift
//  dicePB
//
//  Created by eric on 2020/9/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var dicsImage: [UIImageView]!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var leftsumLabel: UILabel!
    @IBOutlet weak var rightsumLabel: UILabel!
    var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
        var sum = 0
        var leftsum = 0
        var rightsum = 0
        for i in 0...dicsImage.count-1 {
            let number = Int.random(in: 1...6)
            dicsImage[i].image = UIImage(systemName: "die.face.\(number).fill")
            sum = sum + number
            if i % 2 == 0 {
                leftsum = leftsum + number
            } else {
                rightsum = rightsum + number
            }
            
            let shakeSound = Bundle.main.url(forResource: "shake", withExtension: "mp3")!
            player = AVPlayer(url: shakeSound)
            player?.play()
            
        }
        sumLabel.text = "總計:\(sum)"
        leftsumLabel.text = "左列合計:\(leftsum)"
        rightsumLabel.text = "右列合計:\(rightsum)"
       }
    }
    
    
    @IBAction func dicsBtnChange(_ sender: Any) {
        var sum = 0
        var leftsum = 0
        var rightsum = 0
      
        for i in 0...dicsImage.count-1 {
            let number = Int.random(in: 1...6)
            dicsImage[i].image = UIImage(systemName: "die.face.\(number).fill")
            sum = sum + number
            if i % 2 == 0 {
                leftsum = leftsum + number
            } else {
                rightsum = rightsum + number
            }
    
           
            let shakeSound = Bundle.main.url(forResource: "shake", withExtension: "mp3")!
            player = AVPlayer(url: shakeSound)
            player?.play()
            
        }
        sumLabel.text = "總計:\(sum)"
        leftsumLabel.text = "左列合計:\(leftsum)"
        rightsumLabel.text = "右列合計:\(rightsum)"
    }
    
}

