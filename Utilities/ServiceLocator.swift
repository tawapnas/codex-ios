import Foundation
import Swinject

final class ServiceLocator {
    static let shared = ServiceLocator()
    private let container = Container()

    private init() {}

    func addService<T>(_ service: T) {
        container.register(T.self) { _ in service }
            .inObjectScope(.container)
    }

    func getService<T>() -> T {
        guard let service = container.resolve(T.self) else {
            fatalError("No registered service for type \(T.self)")
        }
        return service
    }
}
