//
//  ViewController.swift
//  Animation
//
//  Created by Владимир Рубис on 22.06.2021.
//

import UIKit
import Spring

class AnimationViewController: UIViewController {
    
    var animation: Animation = Animation(animation: .Shake, animationCurve: .EaseIn, force: 1, duration: 0.5, delay: 0, damping: 0, velocity: 0, rotate: 0, scaleX: 0, scaleY: 0, x: 0, y: 0, smile: "👋")
//    var animation
    
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("Start - shake", for: .normal)
        
        animationView.layer.cornerRadius = animationView.frame.width / 2
    }

    @IBAction func addAnimationButtonTapped(_ sender: UIButton) {
        setOptions()
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
    }
    
    func setOptions() {
        animationLabel.text = animation.info
        
        animationView.animation = animation.animation.rawValue
        animationView.curve = animation.animationCurve.rawValue
        animationView.force = animation.force
        animationView.duration = animation.duration
        animationView.delay = animation.delay
        animationView.damping = animation.damping
        animationView.velocity = animation.velocity
        animationView.rotate = animation.rotate
        animationView.scaleX = animation.scaleX
        animationView.scaleY = animation.scaleY
        animationView.x = animation.x
        animationView.y = animation.y
        animationView.animate()
        
        let newAnimation = Animation.getAnimation()
        animation = newAnimation
        
        button.setTitle("Next - \(animation.animation.rawValue)", for: .normal)
    }
}

