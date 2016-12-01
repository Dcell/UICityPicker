# UICityPicker

A simple city selector
一个简单的城市选择器


##Requirements

- iOS 8.0+
- Swift 3

##Installing with [CocoaPods](https://cocoapods.org)

```ruby
use_frameworks!
pod 'UICityPicker', '~> 1.0.0'
pod 'UICityPicker' , :git => "https://github.com/dingqili/UICityPicker.git", :tag => "1.0.0"
```

##Usage

At first, import UICityPicker:

```swift
import UICityPicker
```

then

```swift
let cityPick =  UICityPicker()
let cityPickView = cityPick.presentCityPicker(viewController: self)
cityPickView.cityPickerDelegate = self
```

![image](https://github.com/dingqili/UICityPicker/blob/master/Screenshots/thumb_IMG_0575_1024.jpg)


Have fun! :)



## License

	The MIT License (MIT)

	Copyright © 2015 ding_qili

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.

