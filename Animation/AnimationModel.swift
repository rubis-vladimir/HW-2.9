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
        .shake,
        .pop,
        .morph,
        .squeeze,
        .wobble,
        .swing,
        .flipX,
        .flipY,
        .fall,
        .squeezeLeft,
        .squeezeRight,
        .squeezeDown,
        .squeezeUp,
        .slideLeft,
        .slideRight,
        .slideDown,
        .slideUp,
        .fadeIn,
        .fadeOut,
        .fadeInLeft,
        .fadeInRight,
        .fadeInDown,
        .fadeInUp,
        .zoomIn,
        .zoomOut,
        .flash
    ]
    
//    let animationCurves: [Spring.AnimationCurve] = [
//        .EaseIn,
//        .EaseOut,
//        .EaseInOut,
//        .Linear,
//        .Spring,
//        .EaseInSine,
//        .EaseOutSine,
//        .EaseInOutSine,
//        .EaseInQuad,
//        .EaseOutQuad,
//        .EaseInOutQuad,
//        .EaseInCubic,
//        .EaseOutCubic,
//        .EaseInOutCubic,
//        .EaseInQuart,
//        .EaseOutQuart,
//        .EaseInOutQuart,
//        .EaseInQuint,
//        .EaseOutQuint,
//        .EaseInOutQuint,
//        .EaseInExpo,
//        .EaseOutExpo,
//        .EaseInOutExpo,
//        .EaseInCirc,
//        .EaseOutCirc,
//        .EaseInOutCirc,
//        .EaseInBack,
//        .EaseOutBack,
//        .EaseInOutBack
//    ]
    let animationCurves = Spring.AnimationCurve.allCases
    let smiles: [Character] = [
    "🥸", "🤩", "🥳", "🤪", "😱", "🤤", "🤣"
    ]
}
let dataManager = DataManager()

extension Animation {
    
    static func getAnimation() -> Animation {
        Animation(
            animation: dataManager.animations.randomElement() ?? .shake,
            animationCurve: dataManager.animationCurves.randomElement() ?? .easeIn,
            smile: dataManager.smiles.randomElement() ?? "🥸")
    }
}
