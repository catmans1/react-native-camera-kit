package com.rncamerakit

import android.annotation.SuppressLint
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import com.google.mlkit.vision.barcode.BarcodeScanning
import com.google.mlkit.vision.common.InputImage

class BarcodeObject(var codeValue: String, var codeType: String)

private fun convertToFormat(format: Int): String {
    when(format) {
        -1 -> {
            return "FORMAT_UNKNOWN"
        }
        0 -> {
            return "FORMAT_ALL_FORMATS"
        }
        1 -> {
            return "FORMAT_CODE_128"
        }
        2 -> {
            return "FORMAT_CODE_39"
        }
        4 -> {
            return "FORMAT_CODE_93"
        }
        8 -> {
            return "FORMAT_CODABAR"
        }
        16 -> {
            return "FORMAT_DATA_MATRIX"
        }
        32 -> {
            return "FORMAT_EAN_13"
        }
        64 -> {
            return "FORMAT_EAN_8"
        }
        128 -> {
            return "FORMAT_ITF"
        }
        256 -> {
            return "FORMAT_QR_CODE"
        }
        512 -> {
            return "FORMAT_UPC_A"
        }
        1024 -> {
            return "FORMAT_UPC_E"
        }
        2048 -> {
            return "FORMAT_PDF417"
        }
        4096 -> {
            return "FORMAT_AZTEC"
        }
    }
    return "FORMAT_UNKNOWN"
}

class QRCodeAnalyzer (
    private val onQRCodesDetected: (qrCodes: List<BarcodeObject>) -> Unit
) : ImageAnalysis.Analyzer {
    @SuppressLint("UnsafeExperimentalUsageError", "UnsafeOptInUsageError")
    override fun analyze(image: ImageProxy) {
        val inputImage = InputImage.fromMediaImage(image.image!!, image.imageInfo.rotationDegrees)

        val scanner = BarcodeScanning.getClient()
        scanner.process(inputImage)
            .addOnSuccessListener { barcodes ->
                val strBarcodes = mutableListOf<BarcodeObject>()
                barcodes.forEach { barcode ->
                    var barCodeObject = BarcodeObject(barcode.rawValue ?: return@forEach, convertToFormat(barcode.format))
                    //strBarcodes.add(barcode.rawValue ?: return@forEach)
                    strBarcodes.add(barCodeObject)
                }
                onQRCodesDetected(strBarcodes)
            }
            .addOnCompleteListener{
                image.close()
            }
    }
}