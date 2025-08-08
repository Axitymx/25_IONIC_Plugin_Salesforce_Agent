import Foundation
import UIKit
import SMIClientCore
import SMIClientUI

@objc public class SalesforceChat: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
    
    func presentChat(from presenter: UIViewController?, with params: ChatParams) throws {
            guard let presenter = presenter else {
                throw ChatError.missingPresenter
            }
            
            guard let url = URL(string: params.serviceUrl!) else {
                throw ChatError.invalidURL
            }

            guard let uuidObj = UUID(uuidString: params.conversationId!) else {
                throw ChatError.invalidUUID
            }
            
            guard #available(iOS 14.1, *) else {
                throw ChatError.unsupportedVersion
            }
            
            
            DispatchQueue.main.async {
                let config = UIConfiguration(
                    serviceAPI: url,
                    organizationId: params.organizationId!,
                    developerName: params.developerName!,
                    conversationId: uuidObj
                )
                
                let chatVC = ModalInterfaceViewController(config)
                self.configurePresentationStyle(for: chatVC, presenter: presenter)
                
                presenter.present(chatVC, animated: true, completion: nil)
            }
        }
        
    private func configurePresentationStyle(for chatVC: ModalInterfaceViewController, presenter: UIViewController) {
        DispatchQueue.main.async {
            if UIDevice.current.userInterfaceIdiom == .pad {
                chatVC.modalPresentationStyle = .popover
                if let popover = chatVC.popoverPresentationController {
                    popover.sourceView = presenter.view
                    popover.sourceRect = CGRect(
                        x: presenter.view.bounds.midX,
                        y: presenter.view.bounds.midY,
                        width: 0,
                        height: 0
                    )
                    popover.permittedArrowDirections = []
                }
            } else {
                chatVC.modalPresentationStyle = .pageSheet
            }
        }
    }
    
    func validate(params: ChatParams) -> String? {
        if params.serviceUrl?.isEmpty ?? true ||
            params.organizationId?.isEmpty ?? true ||
            params.conversationId?.isEmpty ?? true ||
            params.developerName?.isEmpty ?? true {
            return ChatError.missingParameters.localizedDescription
        }
        
        guard URL(string: params.serviceUrl!) != nil else {
            return ChatError.invalidURL.localizedDescription
        }
        
        return nil
    }
}
