import Foundation

protocol INetworkService {
    func request<T: Codable>(type: T.Type, url: URL) async throws -> T?
}

public class NetworkService: INetworkService {
    let decoder = JSONDecoder()

    private lazy var urlSession: URLSession = {
        return URLSession.shared
    }()
    
    public init() {}
    
    public func request<T: Codable>(type: T.Type, url: URL) async throws -> T? {
        print("do your request")
        let request = URLRequest(url: url)
        return try await withCheckedThrowingContinuation { continuation in
            let task = urlSession.dataTask(with: request) { [weak self] data, _, error in
                if let error = error { continuation.resume(with: .failure(error)) }
                else {
                    if let data = data {
                        if let content = try? self?.decoder.decode(T.self, from: data) {
                            continuation.resume(with: .success(content))
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
