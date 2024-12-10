import Foundation
import Alamofire

public struct User: Decodable, Sendable {
    let id: Int?
    let title: String?
    let price: Double?
}

public class NetworkManager {
 
    public static func fetchData(completion:@Sendable @escaping (Result< [User], AFError>) -> Void ) {
        
        let url = URL(string: "https://fakestoreapi.com/products")!
        
        AF.request(url).responseDecodable(of: [User].self) { response in
            completion(response.result)
        }
    }
}
