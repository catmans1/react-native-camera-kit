//
//  CodeFormat.swift
//  ReactNativeCameraKit
//
//  Created by Imdad on 2023-12-22.
//

import Foundation
import AVFoundation

enum CodeFormat: String {
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
    case unknown = "unknown"

    // iOS 15.4+ format
    @available(iOS 15.4, *)
    case codabar = "codabar"

    // Custom allCases since CaseIterable isn't allowed with availability restrictions
    static var allCases: [CodeFormat] {
        var cases: [CodeFormat] = [
            .aztec, .code128, .code39, .code39Mod43, .code93, .dataMatrix,
            .ean13, .ean8, .interleaved2of5, .itf14, .pdf417, .qr, .upce, .unknown
        ]

        if #available(iOS 15.4, *) {
            cases.append(.codabar)
        }

        return cases
    }

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
        default:
            if #available(iOS 15.4, *), type == .codabar {
                return .codabar
            }
            return .unknown
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
        case .unknown:
            return .code128
        case .codabar:
            if #available(iOS 15.4, *) {
                return .codabar
            } else {
                return .code128
            }
        }
    }

    // Get supported formats based on iOS version
    static func getSupportedFormats() -> [CodeFormat] {
        var formats: [CodeFormat] = [
            .aztec, .code128, .code39, .code39Mod43, .code93, .dataMatrix,
            .ean13, .ean8, .interleaved2of5, .itf14, .pdf417, .qr, .upce
        ]

        if #available(iOS 15.4, *) {
            formats.append(.codabar)
        }

        return formats
    }
}
