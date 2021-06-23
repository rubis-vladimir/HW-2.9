//
//  AnimationViewController.swift
//  Animation
//
//  Created by Владимир Рубис on 22.06.2021.
//

import UIKit
import Spring

class AnimationViewController: UIViewController {
    
    var animation: Animation = Animation(animation: .Shake, animationCurve: .EaseIn, smile: "👋")
    var counter = 10
    var insectImageViews: [UIImageView] = []
    
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
    
    // MARK: - Reload VC
    
    @IBAction func reset(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AnimationViewController")
        var viewControllers = self.navigationController?.viewControllers
        viewControllers?.removeLast()
        viewControllers?.append(vc)
        self.navigationController?.setViewControllers(viewControllers!, animated: true)
    }
    
    // MARK: - Create animation
    
    func setOptions() {
        reduceCounter()
        animationLabel.text = animation.info
        
        animationView.animation = animation.animation.rawValue
        animationView.curve = animation.animationCurve.rawValue
        animationView.force = CGFloat.random(in: 0...5.0)
        animationView.duration = CGFloat.random(in: 0.5...2.0)
        animationView.delay = CGFloat.random(in: 0...1)
        animationView.damping = CGFloat.random(in: 0...1)
        animationView.velocity = CGFloat.random(in: 0...1)
        animationView.rotate = CGFloat.random(in: 0...1)
        animationView.scaleX = CGFloat.random(in: 0...1)
        animationView.scaleY = CGFloat.random(in: 0...1)
        animationView.x = CGFloat.random(in: 0...150)
        animationView.y = CGFloat.random(in: 0...150)
        animationView.animate()
        
        let newAnimation = Animation.getAnimation()
        animation = newAnimation
        
        button.setTitle("Next - \(animation.animation.rawValue)", for: .normal)
    }
    
    // MARK: - Counter before explosion
    
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
            
            for index in 0..<insectImageViews.count {
                insectImageViews[index].isHidden = true
            }
        } else if counter <= 3 {
            counterLabel.textColor = .red
            insectMove()
        } else {
            insectMove()
        }
    }
    
    // MARK: - Animation-insects
    
    func insectMove() {
        // Создание букашки
        var imageView: UIImageView
        imageView = UIImageView(frame: CGRect(x: Int.random(in: 30...Int(self.view.bounds.width - 30)), y: Int.random(in: 30...Int(self.view.bounds.height - 100)), width: 60, height: 60))
        imageView.image = UIImage(named: "insect")
        self.view.addSubview(imageView)
        
        insectImageViews.append(imageView)
        
        // Вычисление 1-го угла
        let imageXOne = CGFloat.random(in: 0...self.view.bounds.maxX)
        let alphaOne = atan(Double((imageView.center.x - imageXOne)/(self.view.bounds.maxY - imageView.center.y)))
        
        // Вычисление 2-го угла
        let imageYTwo = CGFloat.random(in: 0...self.view.bounds.maxY)
        let alphaTwo = atan(Double((self.view.bounds.maxY - imageYTwo)/(self.view.bounds.maxX - imageXOne)))
        
        // Вычисление 3-го угла
        let imageXThree = CGFloat.random(in: 0...(self.view.bounds.maxX - 20))
        let alphaThree = Double.pi/2 + atan(Double((self.view.bounds.maxX - imageXThree)/imageYTwo)) - alphaTwo
        
        // Движение букашки
        let duration: TimeInterval = 10
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.03) {
                imageView.transform = imageView.transform.rotated(by: CGFloat(alphaOne + Double.pi))
            }
            UIView.addKeyframe(withRelativeStartTime: 0.05, relativeDuration: 0.4) {
                imageView.center = CGPoint(x: imageXOne, y: self.view.bounds.maxY)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.45, relativeDuration: 0.03) {
                imageView.transform = imageView.transform.rotated(by: CGFloat(-(alphaTwo +  Double.pi/2 + alphaOne)))
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                imageView.center = CGPoint(x: self.view.bounds.maxX, y: imageYTwo)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.03) {
                imageView.transform = imageView.transform.rotated(by: CGFloat(-alphaThree))
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2) {
                imageView.center = CGPoint(x: imageXThree, y: self.view.bounds.minY)
            }
        })
    }
}

