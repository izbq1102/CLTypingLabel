//
//  ViewController.swift
//  CLTypingLabel
//
//  Created by Lin on 2/21/16.
//  Copyright © 2016 Chenglin. All rights reserved.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {
    
    @IBOutlet weak var demoLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoLabel.charInterval = 0.1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Set Text
        demoLabel.text = "This is a demo of a typing label animation..."
        demoLabel.onTypingAnimationFinished = { [unowned self] in
            self.showSampleAlert()
        }
    }

    fileprivate func showSampleAlert() {
        let sampleAlert = UIAlertController(title: "Sample",
                                            message: "Typing animation finished!",
                                            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        sampleAlert.addAction(okAction)
        self.present(sampleAlert, animated: true, completion: nil)
    }
    
    @IBAction func stopTapped(_ sender: AnyObject) {
        demoLabel.pauseTyping()
    }
    @IBAction func continueTapped(_ sender: AnyObject) {
        demoLabel.continueTyping()
    }
    
    var showNoramlText = false
    
    @IBAction func restartTapped(_ sender: AnyObject) {
        if( showNoramlText)
            //Plain Text Sample
        {
            demoLabel.text = "This is a demo of a typing label animation..."
        }
        else
        {
            //Attributed Text Sample
            let attr = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.strokeColor: UIColor.green,
                NSAttributedString.Key.strokeWidth: -3
                ] as [NSAttributedString.Key : Any]
            demoLabel.attributedText = NSAttributedString(string: "This is an attributed text typing animation...", attributes: attr)
        }
        showNoramlText = !showNoramlText
    }
}

