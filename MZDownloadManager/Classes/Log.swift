//
//  Log.swift
//  MZDownloadManager
//
//  Created by thunderbirds66 on 2018/08/02.
//

import UIKit


public func DBG(_ text: String, _ fileName: String = #file, _ funcName: String = #function, _ lineNumber: Int = #line) {
	#if DEBUG
	print("\(Thread.current.description):" + (fileName as NSString).lastPathComponent + ":" + funcName + ":" + String(format: "%d", lineNumber) + ":" + text)
	#endif
}

public func ERR(_ text: String, _ fileName: String = #file, _ funcName: String = #function, _ lineNumber: Int = #line) {
	print("ERROR:" + (fileName as NSString).lastPathComponent + ":" + String(format: "%d", lineNumber) + ":" + text)
}
