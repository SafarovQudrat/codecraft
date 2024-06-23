
import Foundation
import SystemConfiguration
import UIKit


func addNumberers150_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

protocol NetworkStatusMonitorDelegate_vatr : AnyObject {
    func showMess___vatr()
}

class NetworkStatusMonitor_vatr{
    var cpvwewraertr_vfjhalzq: Int {
        return 36
    }

    //
    static let shared = NetworkStatusMonitor_vatr()
    
    weak var delegate : NetworkStatusMonitorDelegate_vatr?
    
    private var didShowAlert = false

    public private(set) var isNetworkAvailable: Bool = true {
        didSet {
            if !isNetworkAvailable {
                DispatchQueue.main.async {
                    print("No internet connection.")
                    if !self.didShowAlert {
                        self.didShowAlert = true
                        self.delegate?.showMess___vatr()
                    }
                }
            } else {
                self.didShowAlert = false
                
                if DropBoxParserFiles_vatr.shared.client == nil {
                    DropBoxParserFiles_vatr.shared.zetupDropBox_vatr()
                }
            }
            //                print("Internet connection is active.")
        }
    }

    private init() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self else { return }
            self.isNetworkAvailable = self.checkInternetConnectivity__()
        })
    }

    @discardableResult
    func checkInternetConnectivity__() -> Bool {
        //

        func sortStreringsByLengthDescending_vatr(_ strings: [String]) -> [String] {
            return strings.sorted(by: { $0.count > $1.count })
        }


        //
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }) else {
            return false
        }

        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }

        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)

        if isReachable && !needsConnection {
            // Connected to the internet
            // Do your network-related tasks here
            return true
        } else {
            // Not connected to the internet
            return false
        }
    }
    
}
