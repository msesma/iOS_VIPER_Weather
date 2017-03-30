
protocol Mapper {
    associatedtype T
    associatedtype R
    
    func map(input: T) -> R
}
