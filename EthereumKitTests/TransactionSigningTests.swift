import XCTest
import CryptoSwift
@testable import EthereumKit

class TransactionSigningTests: XCTestCase {
    
    let mainWallet = Wallet(network: .main, privateKey: "db173e58671248b48d2494b63a99008be473268581ca1eb78ed0b92e03b13bbc")
    let testWallet = Wallet(network: .ropsten, privateKey: "db173e58671248b48d2494b63a99008be473268581ca1eb78ed0b92e03b13bbc")
    
    func testTransactionSigning() {
        let rawTransaction = RawTransaction(
            value: Wei("1000000000000000000")!,
            to: Address(string: "0x91c79f31De5208fadCbF83f0a7B0A9b6d8aBA90F"),
            gasLimit: 21000,
            gasPrice: 99000000000,
            nonce: 5
        )
        
        let hash = try! testWallet.sign(rawTransaction: rawTransaction)
        
        XCTAssertEqual(
            hash, "0xf86c0585170cdc1e008252089491c79f31de5208fadcbf83f0a7b0a9b6d8aba90f880de0b6b3a76400008029a076da637d6a2fa3197c0a1b7c9bc2a4326c9a1dbe94c4eb8449bf59919f89b762a00887bcdd883f2cc2c892e55665419fad6522d4e7e1f7c226282078de98f4069c"
        )
    }
    
    func testTransactionSigning2() {
        let rawTransaction = RawTransaction(
            value: Wei("100000000000000000")!,
            to: Address(string: "0x3B958949EfCc8362Dd05179cCE8eB5e16BefeBdA"),
            gasLimit: 21000,
            gasPrice: 99000000000,
            nonce: 5
        )
        
        let hash = try! testWallet.sign(rawTransaction: rawTransaction)
        
        XCTAssertEqual(
            hash, "0xf86c0585170cdc1e00825208943b958949efcc8362dd05179cce8eb5e16befebda88016345785d8a00008029a022ab35848cce6ddf0ef76ea6ab25cebe449d822073492c6e2b90a2707bd061d0a0414e6f152f66a62158a59a9ffe095bd1beacf0d2510b9204aec8a8cacbcbdf31"
        )
    }
    
    func testTransactionSigning3() {
        let rawTransaction = RawTransaction(
            value: Wei("500000000000000000")!,
            to: Address(string: "0xfc9d3987f7fcd9181393084a94814385b28cEf81"),
            gasLimit: 200000,
            gasPrice: 99000000000,
            nonce: 5
        )
        
        let hash = try! testWallet.sign(rawTransaction: rawTransaction)
        
        XCTAssertEqual(
            hash, "0xf86d0585170cdc1e0083030d4094fc9d3987f7fcd9181393084a94814385b28cef818806f05b59d3b200008029a096479bbc675f9ae3bdc23f6fa22adf5bc009c1661b6336bdeaa2959dce6d55dba0302981091abc6dc4736676b93c24fde68d11bad45741a2d8c5bfdfb633039863"
        )
    }
    
    func testTransactionSigning4() {
        let rawTransaction = RawTransaction(
            value: Wei("1000000000000000000")!,
            to: Address(string: "0x91c79f31De5208fadCbF83f0a7B0A9b6d8aBA90F"),
            gasLimit: 21000,
            gasPrice: 99000000000,
            nonce: 0
        )
        
        let hash = try! mainWallet.sign(rawTransaction: rawTransaction)
        
        XCTAssertEqual(
            hash, "0xf86c8085170cdc1e008252089491c79f31de5208fadcbf83f0a7b0a9b6d8aba90f880de0b6b3a76400008025a0f62b35ed65db13b02ccab29eeea2d29990a690a8620f8bee56b765c5357c82b8a05c266f2d429c87f8c903f7089870aa169638518c5c3a56ade8ce66ffcb5c3991"
        )
    }
    
    func testTransactionSigning5() {
        let rawTransaction = RawTransaction(
            value: Wei("1000000000000000000")!,
            to: Address(string: "0x3B958949EfCc8362Dd05179cCE8eB5e16BefeBdA"),
            gasLimit: 21000,
            gasPrice: 99000000000,
            nonce: 0
        )
        
        let hash = try! mainWallet.sign(rawTransaction: rawTransaction)
        
        XCTAssertEqual(
            hash, "0xf86c8085170cdc1e00825208943b958949efcc8362dd05179cce8eb5e16befebda880de0b6b3a76400008025a0134a7e77c95c5839bd931788f1b7a3ff15567d9a79ef0b00cfe4baedf33c60d8a00123a678f76e288a0180ef3248c90608365bf95d20d1a16b9b3d23edbe420408"
        )
    }
    
    func testTransactionSigning6() {
        let rawTransaction = RawTransaction(
            value: Wei("5000000000000000000")!,
            to: Address(string: "0xfc9d3987f7fcd9181393084a94814385b28cEf81"),
            gasLimit: 200000,
            gasPrice: 99000000000,
            nonce: 0
        )
        
        let hash = try! mainWallet.sign(rawTransaction: rawTransaction)
        
        XCTAssertEqual(
            hash, "0xf86d8085170cdc1e0083030d4094fc9d3987f7fcd9181393084a94814385b28cef81884563918244f400008025a07f47866c109ce1fbc0b4c9d4c5825bcd9be13903a082256d70c8cf6c05a59bfca045f6b0407996511b30f72fbb567e0b0dbaa367b9b920f73ade435f8e0e2776b6"
        )
    }
}
