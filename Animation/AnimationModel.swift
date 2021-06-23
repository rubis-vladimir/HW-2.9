//
//  AnimationModel.swift
//  Animation
//
//  Created by Владимир Рубис on 22.06.2021.
//

import UIKit
import Spring

struct Animation {
    var animation: Spring.AnimationPreset
    var animationCurve: Spring.AnimationCurve
    var force: CGFloat
    var duration: CGFloat
    var delay: CGFloat
    var damping: CGFloat
    var velocity: CGFloat
    var rotate: CGFloat
    var scaleX: CGFloat
    var scaleY: CGFloat
    var x: CGFloat
    var y: CGFloat
    var smile: Character
    
    var info: String {"""
         Animation: "\(animation)"
         Curve: "\(animationCurve)"
        \(smile)
        """}
}

class DataManager {
    let animations: [Spring.AnimationPreset] = [
        .Shake,
        .Pop,
        .Morph,
        .Squeeze,
        .Wobble,
        .Swing,
        .FlipX,
        .FlipY,
        .Fall,
        .SqueezeLeft,
        .SqueezeRight,
        .SqueezeDown,
        .SqueezeUp,
        .SlideLeft,
        .SlideRight,
        .SlideDown,
        .SlideUp,
        .FadeIn,
        .FadeOut,
        .FadeInLeft,
        .FadeInRight,
        .FadeInDown,
        .FadeInUp,
        .ZoomIn,
        .ZoomOut,
        .Flash
    ]
    
    let animationCurves: [Spring.AnimationCurve] = [
        .EaseIn,
        .EaseOut,
        .EaseInOut,
        .Linear,
        .Spring,
        .EaseInSine,
        .EaseOutSine,
        .EaseInOutSine,
        .EaseInQuad,
        .EaseOutQuad,
        .EaseInOutQuad,
        .EaseInCubic,
        .EaseOutCubic,
        .EaseInOutCubic,
        .EaseInQuart,
        .EaseOutQuart,
        .EaseInOutQuart,
        .EaseInQuint,
        .EaseOutQuint,
        .EaseInOutQuint,
        .EaseInExpo,
        .EaseOutExpo,
        .EaseInOutExpo,
        .EaseInCirc,
        .EaseOutCirc,
        .EaseInOutCirc,
        .EaseInBack,
        .EaseOutBack,
        .EaseInOutBack
    ]
    
    let smiles: [Character] = [
    "🥸", "🤩", "🥳", "🤪", "😱", "🤤", "🤣"
    ]
}

let dataManager = DataManager()
//let startAnimation
extension Animation {
    
    static func getAnimation() -> Animation {
        Animation(
            animation: dataManager.animations.randomElement() ?? .Shake,
            animationCurve: dataManager.animationCurves.randomElement() ?? .EaseIn,
            force: CGFloat.random(in: 0...5.0),
            duration: CGFloat.random(in: 0.5...2.0),
            delay: CGFloat.random(in: 0...1.0),
            damping: CGFloat.random(in: 0...1),
            velocity: CGFloat.random(in: 0...1),
            rotate: CGFloat.random(in: 0...1),
            scaleX: CGFloat.random(in: 0...1),
            scaleY: CGFloat.random(in: 0...1),
            x: CGFloat.random(in: 0...150),
            y: CGFloat.random(in: 0...150),
            smile: dataManager.smiles.randomElement() ?? "🥸")
    }
}
