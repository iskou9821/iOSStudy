//
//  ViewController.swift
//  CameraTest
//
//  Created by 石川光佑 on 2015/03/26.
//  Copyright (c) 2015年 local.iskou9821. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let captureSession = AVCaptureSession()
    var previewLayer : AVCaptureVideoPreviewLayer?
    var captureDevice : AVCaptureDevice?
    
    @IBOutlet weak var focusLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        //カメラの初期化
        var camera = getBackCamera()
        if (camera != nil) {
            onCameraFound(camera!)
        }
    }
    
    @IBAction func focusPositionChanged(sender: AnyObject) {
        //スライダでフォーカス位置を変更
        let slider = sender as UISlider
        let str = NSString(format:"%.2f", slider.value)
        focusLabel.text = "フォーカス位置：" + str
        focusTo(slider.value)
    }
    
    /*
     *背面カメラの取得
     */
    func getBackCamera()->AVCaptureDevice? {
        let devices = AVCaptureDevice.devices()
        for device in devices {
            if (device is AVCaptureDevice &&
                device.hasMediaType(AVMediaTypeVideo) &&
                device.position == AVCaptureDevicePosition.Back) {
                    return (device as AVCaptureDevice)
            }
        }
        return nil
    }
    
    /*
     * カメラの初期化
     */
    func onCameraFound(device : AVCaptureDevice) {
        //カメラの設定
        device.lockForConfiguration(nil)
        device.focusMode = .Locked
        device.unlockForConfiguration()
        
        captureDevice = device;
        var err : NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
            
        if err != nil {
            println("エラー: \(err?.localizedDescription)")
        }
        
        //カメラをビューに表示
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        baseView.layer.addSublayer(previewLayer)
        previewLayer?.frame = baseView.layer.frame
        captureSession.startRunning()
    }
    
    /*
     * フォーカスの変更
     */
    func focusTo(value : Float) {
        if let device = captureDevice {
            if(device.lockForConfiguration(nil)) {
                device.setFocusModeLockedWithLensPosition(value, completionHandler: { (time) -> Void in
                    
                })
                device.unlockForConfiguration()
            }
        }
    }
    
    //自動生成されたメソッド(特に使っていない)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

