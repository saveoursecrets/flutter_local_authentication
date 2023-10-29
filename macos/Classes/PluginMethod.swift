//
//  PluginMethod.swift
//  flutter_local_authentication
//
//  Created by Ezequiel (Kimi) Aceto on 19/10/23.
//  Contact: ezequiel.aceto@gmail.com
//  WebSite: https://eaceto.dev

import FlutterMacOS
import Foundation

enum PluginMethod {
    case canAuthenticate
    case authenticate(allowReuse: Bool)
    case setTouchIDAuthenticationAllowableReuseDuration(duration: Double)
    case getTouchIDAuthenticationAllowableReuseDuration
    case setLocalizationModel(model: LocalizationModel?)

    static func from(_ call: FlutterMethodCall) -> PluginMethod? {
        switch call.method {
        case "canAuthenticate": return .canAuthenticate
        case "authenticate":
            if 
                let arguments = call.arguments as? [String: Any],
                let allowReuse : Bool = arguments["allowReuse"] as? Bool {
                return .authenticate(allowReuse: allowReuse)
            } else {
                return .authenticate(allowReuse: false)
            }
        case "setTouchIDAuthenticationAllowableReuseDuration":
            let arguments = call.arguments as? [String: Any]
            let duration: Double = arguments?["duration"] as? Double ?? 0.0
            return .setTouchIDAuthenticationAllowableReuseDuration(duration: duration)
        case "getTouchIDAuthenticationAllowableReuseDuration":
            return .getTouchIDAuthenticationAllowableReuseDuration
        case "setLocalizationModel":
            let model = LocalizationModel.from(call.arguments as? [String: Any])
            return .setLocalizationModel(model: model)
        default:
            return nil
        }
    }
}
