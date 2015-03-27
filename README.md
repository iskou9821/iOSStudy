# マニュアルフォーカスでカメラを動かすテスト

## 概要
Swiftもくもく勉強会で作成した、iOSのカメラをマニュアルフォーカスで動かすテストです。

基本的には**AVCaptutrDevice.setFocusModeLockedWithLensPosition**というメソッドで実現できるようです。

＊ちょっとフォームの位置がズレているとか、いろいろ基本的な問題残っています。。。

## 参考
[こちらのサイト](http://swift-salaryman.com/avcapture.1.php)を参考にしました。

あとは[こちら(アップル公式ドキュメント)](https://developer.apple.com/library/ios/documentation/AVFoundation/Reference/AVCaptureDevice_Class/index.html)