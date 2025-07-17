//
//  CodeFormat.swift
//  ReactNativeCameraKit
//
//  Created by Imdad on 2023-12-22.
//

import Foundation
import AVFoundation

enum CodeFormat: String, CaseIterable {
    case aztec = "aztec"
    case code128 = "code-128"
    case code39 = "code-39"
    case code39Mod43 = "code-39-mod-43"
    case code93 = "code-93"
    case dataMatrix = "data-matrix"
    case ean13 = "ean-13"
    case ean8 = "ean-8"
    case interleaved2of5 = "interleaved-2-of-5"
    case itf14 = "itf-14"
    case pdf417 = "pdf-417"
    case qr = "qr"
    case upce = "upc-e"
    case codabar = "codabar"
    case upca = "upc-a"
    case unknown = "unknown"

    // Convert from AVMetadataObject.ObjectType to CodeFormat
    static func fromAVMetadataObjectType(_ type: AVMetadataObject.ObjectType) -> CodeFormat {
        switch type {
        case .aztec: return .aztec
        case .code128: return .code128
        case .code39: return .code39
        case .code39Mod43: return .code39Mod43
        case .code93: return .code93
        case .dataMatrix: return .dataMatrix
        case .ean13: return .ean13
        case .ean8: return .ean8
        case .interleaved2of5: return .interleaved2of5
        case .itf14: return .itf14
        case .pdf417: return .pdf417
        case .qr: return .qr
        case .upce: return .upce
        // codabar and upca are only available on iOS 15+
        case .codabar:
            if #available(iOS 15.0, *) { return .codabar } else { return .unknown }
        case .upca:
            if #available(iOS 15.0, *) { return .upca } else { return .unknown }
        default: return .unknown
        }
    }

    // Convert from CodeFormat to AVMetadataObject.ObjectType
    func toAVMetadataObjectType() -> AVMetadataObject.ObjectType {
        switch self {
        case .aztec: return .aztec
        case .code128: return .code128
        case .code39: return .code39
        case .code39Mod43: return .code39Mod43
        case .code93: return .code93
        case .dataMatrix: return .dataMatrix
        case .ean13: return .ean13
        case .ean8: return .ean8
        case .interleaved2of5: return .interleaved2of5
        case .itf14: return .itf14
        case .pdf417: return .pdf417
        case .qr: return .qr
        case .upce: return .upce
        // codabar and upca are only available on iOS 15+
        case .codabar:
            if #available(iOS 15.0, *) { return .codabar } else { return .init(rawValue: "unknown") }
        case .upca:
            if #available(iOS 15.0, *) { return .upca } else { return .init(rawValue: "unknown") }
        case .unknown: return .init(rawValue: "unknown")
        }
    }
}
