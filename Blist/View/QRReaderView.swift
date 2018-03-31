

import Foundation
import UIKit
import AVFoundation

protocol barcodeReaderDelegate: class {
    func didDetection(isbn: String)
}

class QRReaderView: UIView, AVCaptureMetadataOutputObjectsDelegate {
    
    lazy var listButton: UIButton = {
        let button = UIButtonX()
        button.isRound = true
        button.backgroundColor = UIColor.hex(hexStr: "#52ACFF", alpha: 1.0)
        button.setImage(UIImage(named: "list_48pt"), for: .normal)
        return button
    }()
    
    // ビデオ表示のためにCALayerのサブクラスを定義
    var videoLayer: AVCaptureVideoPreviewLayer?
    private let session = AVCaptureSession()
    
    weak var delegate: barcodeReaderDelegate?
    
 //    required init(model: QRReaderModel) {
    required init() {
        super.init(frame: .zero)
        backgroundColor = .blue
        addSubview(listButton)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
//        layout()
        // カメラやマイクのデバイスそのものを管理するオブジェクトを生成（ここではワイドアングルカメラ・ビデオ・背面カメラを指定）
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera],
                                                                mediaType: .video,
                                                                position: .back)
        let devices = discoverySession.devices // ワイドアングルカメラ・ビデオ・背面カメラに該当するデバイスを取得
        
        //　該当するデバイスのうち最初に取得したものを利用する
        if let backCamera = devices.first {
            do {
                let deviceInput = try AVCaptureDeviceInput(device: backCamera) // QRコードの読み取りに背面カメラの映像を利用するための設定
                if self.session.canAddInput(deviceInput) {
                    self.session.addInput(deviceInput)
                    let metadataOutput = AVCaptureMetadataOutput() // 背面カメラの映像からQRコードを検出するための設定
                    if self.session.canAddOutput(metadataOutput) {
                        self.session.addOutput(metadataOutput)
                        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                        metadataOutput.metadataObjectTypes = [.ean13]
                        let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)  // 背面カメラの映像を画面に表示するためのレイヤーを生成
                        previewLayer.frame = bounds
                        previewLayer.videoGravity = .resizeAspectFill
                        layer.addSublayer(previewLayer)
                        self.session.startRunning() // 読み取り開始
                    }
                }
            } catch {
                print("Error occured while creating video device input: \(error)")
            }
        }
        bringSubview(toFront: listButton)
        start()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//        for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {
//            if metadata.type != .ean13 && metadata.type != .ean8 { continue }  // QRコードのデータかどうかの確認
//            guard let value = metadata.stringValue else { continue } // QRコードの内容が空かどうかの確認
//            delegate?.didDetection(isbn: value)
//        }
        if metadataObjects.count > 0 {
            let metaDataArray = metadataObjects as! [AVMetadataMachineReadableCodeObject]
            let metadata = metaDataArray[0]
            if metadata.type != .ean13 { return }
            guard let value = metadata.stringValue else { return }
            delegate?.didDetection(isbn: value)
            stop()
        }

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activateConstraints()
        videoLayer?.frame = frame
    }
    
    func layout() {
        // デバイス情報の取得とセッションの作成
        let videoDevice = AVCaptureDevice.default(for: .video)
        let videoInput = try! AVCaptureDeviceInput.init(device: videoDevice!)
        
        if session.inputs.isEmpty {
            session.addInput(videoInput)
            // 出力(Output)をMeta情報に
            let myMetadataOutput: AVCaptureMetadataOutput! = AVCaptureMetadataOutput()
            // 画像を表示するレイヤーを生成.
            videoLayer = AVCaptureVideoPreviewLayer.init(session: session)
            // カメラのサイズを設定
            videoLayer?.frame = frame
            // プレイヤーの表示サイズを指定(全画面表示へリサイズ画、面を引き延ばし)
            videoLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoLayer?.backgroundColor = UIColor.red.cgColor
    
            layer.addSublayer(videoLayer!)
            if session.canAddOutput(myMetadataOutput) {
                // セッションに追加.
                session.addOutput(myMetadataOutput)
                // Meta情報を取得した際のDelegateを設定.
                myMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                // 判定するMeta情報にQRCodeを設定.
                myMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            }
            myMetadataOutput.rectOfInterest = CGRect(x: 1, y: 1, width: 1, height: 1)
        }

    }
    
    // QrコードのMeta情報を検出時に実行
//    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

    func start() {
        session.startRunning()
    }
    
    func stop() {
        print("stop")
        session.stopRunning()
    }
    
    private func activateConstraints() {
        listButton.translatesAutoresizingMaskIntoConstraints = false
        listButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15).isActive = true
        listButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 15).isActive = true
        listButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        listButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

