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

extension Animation {
    
    static func getAnimation() -> Animation {
        Animation(
            animation: dataManager.animations.randomElement() ?? .Shake,
            animationCurve: dataManager.animationCurves.randomElement() ?? .EaseIn,
            smile: dataManager.smiles.randomElement() ?? "🥸")
    }
}
