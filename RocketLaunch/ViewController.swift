//
//  ViewController.swift
//  RocketLaunch
//
//  Created by Сергей Борисов on 04.03.2020.
//  Copyright © 2020 Сергей Борисов. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var rocketContentView: UIView!
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var successLabel: UILabel!
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "launch", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        player = try? AVAudioPlayer(contentsOf: url)
        // Do any additional setup after loading the view.
    }

    @IBAction func powerButtonPress(_ sender: UIButton) {
        rocketContentView.isHidden = false
        player.play()
        successLabel .isHidden=true
        let frame = rocketImageView.frame
        rocketImageView.frame.origin.y = 1000
        UIView.animate(withDuration: 3.5, animations: {
            self.rocketImageView.frame = frame
        }) { (_) in
            self.successLabel.isHidden=false
        }
    }
    
}

