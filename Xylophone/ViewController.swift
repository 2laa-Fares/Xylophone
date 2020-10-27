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
        playSound(soundName: sender.currentTitle!)
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
        
    func playSound(soundName: String) {
        // Get url of sound.
        let url = Bundle.main.url(forResource: "Sounds/\(soundName)", withExtension: "wav")
        // Set the audio session category,to make audio play even if phone in silent mode.
        try! AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        // Set file path to audio player.
        player = try! AVAudioPlayer(contentsOf: url!)
        // Play audio.
        player!.play()
    }
}

