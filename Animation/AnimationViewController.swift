//
//  AnimationViewController.swift
//  Animation
//
//  Created by Владимир Рубис on 22.06.2021.
//

import UIKit
import Spring

class AnimationViewController: UIViewController {
    
    var animation: Animation = Animation(animation: .Shake, animationCurve: .EaseIn, force: 1, duration: 0.5, delay: 0, damping: 0, velocity: 0, rotate: 0, scaleX: 0, scaleY: 0, x: 0, y: 0, smile: "👋")
    var counter = 10
    
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet var ladyBagView: [UIView]!
    
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var explosionImageView: SpringImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("Start - shake", for: .normal)
        for index in 0..<ladyBagView.count {
            ladyBagView[index].layer.cornerRadius = ladyBagView[index].frame.width / 2
        }
        animationLabel.text = """
        Hello!
        Let's start now 😈
        Press ⬇️
        """
        explosionImageView.isHidden = true
    }

    @IBAction func addAnimationButtonTapped(_ sender: UIButton) {
        setOptions()
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AnimationViewController")
        var viewControllers = self.navigationController?.viewControllers
        viewControllers?.removeLast()
        viewControllers?.append(vc)
        self.navigationController?.setViewControllers(viewControllers!, animated: true)
    }
    
    func setOptions() {
        reduceCounter()
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
    
    func reduceCounter() {
        counter -= 1
        counterLabel.text = String(counter)
        if counter == 0 {
            animationView.isHidden = true
            counterLabel.isHidden = true
            button.isHidden = true
            explosionImageView.animation = Spring.AnimationPreset.FadeIn.rawValue
            explosionImageView.curve = Spring.AnimationCurve.EaseIn.rawValue
            explosionImageView.duration = 1.5
            explosionImageView.isHidden = false
            explosionImageView.animate()
        } else if counter <= 3 {
            counterLabel.textColor = .red
        }
    }
}

