import Foundation
import Alamofire

public struct User: Decodable, Sendable {
    let id: Int?
    let title: String?
    let price: Double?
}

public struct Category: Decodable, Sendable {
    let id: Int?
    let userId: Int?
    let date: String?
}

public class NetworkManager {
 
    public static func fetchProducts(completion: @Sendable @escaping (Result< [User], AFError>) -> Void ) {
        
        let url = URL(string: "https://fakestoreapi.com/products")!
        
        AF.request(url).responseDecodable(of: [User].self) { response in
            completion(response.result)
        }
    }
    
    public static func fetchAllCategories(completion: @Sendable @escaping (Result< [Category], AFError>) -> Void ) {
        let url = URL(string: "https://fakestoreapi.com/carts")!
        
        AF.request(url).responseDecodable(of: [Category].self) { response in
            completion(response.result)
        }
    }
    
}
