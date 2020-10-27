//
//  ViewController.swift
//  Xylophone
//
//  Created by 2laa Ewis on 10/27/20.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound()
    }
        
    func playSound() {
        // Get url of sound.
        let url = Bundle.main.url(forResource: "Sounds/C", withExtension: "wav")
        // Set the audio session category,to make audio play even if phone in silent mode.
        try! AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        // Set file path to audio player.
        player = try! AVAudioPlayer(contentsOf: url!)
        // Play audio.
        player!.play()
    }
}

