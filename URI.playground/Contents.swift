import UIKit

/*
 ### URI (Uniform Resource Identifier) is a string of characters used to identify a name or abstract / physical resource.
 
 * 인터넷의 자원을 식별하기 위한 통합 자원 식별자.
 * URL(상대적 경로?)과 URN(절대적 경로?)을 포함하며 상위 개념.
 
 ### URL (Uniform Resource Locator) is a specific character string that constitues a reference to a resource.
 
 * 어떤 자원의 위치에 대한 절대경로값을 지닌 문자열.
 * 어떤 특정 주소 또는 파일 리소스에 접근하기 위한 주소값으로 흔히 HTTP로 시작하는 웹 주소로 인식하는 경우가 많지만, URL의 한 형태에 해당하는 것으로 컴퓨터 네트워크상의 자원을 모두 나타낼 수 있음.
 
 *scheme:[//[user[:password]@]host[:port]][/path][?query][#fragment]*
 
 > ex) http://www.someDomain.kr/index.php
 >
 > ex) https://search.naver.com/search.naver?where=post&ie=utf8&query=url
 >
 > ex) ftp://id:pw@someHost.com:21
 
 ### URN (Uniform Resource Name) is persistent, location-independent identifiers for resources.
 
 * 위치에 독립적이고, 지속되는 형태의 자원을 가리키기 위한 유일한 식별자
 * IETF에서 표준 규격을 업데이트
 
 *urn:<namespace identifier>:<namespace-specific string>*
 
 > ex) urn:isbn:9788971991060 (국제 표준 도서번호)
 >
 > ex) urn:ietf:rfc:2648 (RFC 문서번호)
 >
 > ex) urn:uuid:6e8bc430-9c3a-11d9-9669-0800200c9a66 (UUID)
 
 ### URL vs URN
 
 *URL - 주소 / URN - 주민등록증*
 
 * URN - resource identification by name. ex) teacher: "Student Jim!"
 * URL - resource identification as location. ex) teacher: "Student who seats in the 2nd row and 3rd column.
 
 ### IRI (International Resource Identifier) is defined by the IETF in 2005 as a new internet standard to extend upon the existing URI
 
 * IRI는 URI를 포함하며 상위 개념으로 확장된 버전
 * URI - ASCII character set
 * IRI - fully supports international characters, mostly UTF-8
 * 비슷해 보이는 문자를 이용한 악의적인 공격이 있을 수 있다는 점이 단점
 
 > ex) http://www.paypal.com
 >
 > ex) http://www.päypal.com
 */

// BigEndian and LittleEndian

let number: UInt32 = 0x12345678             // 305419896
let convertedToBig = number.bigEndian       // 20189154346

if number == convertedToBig {
    print("BigEndian \(number)")
} else {
    print("LittleEndian \(number)")
}
// 출력값: LittleEndian 305419896

/*
 ### TCP/IP Protocol Suite
 
 * 인터넷 프로토콜 스위트(Protocol Suite)는 인터넷 네트워크에 쓰이는 프로토콜의 모음
 * TCP/IP가 가장 많이 사용되기에 TCP/IP 프로토콜 스위트 또는 프로토콜 스택이라고도 함
 * HTTP, FTP, Telnet 등이 TCP/IP 기반
 
 TCP (Transmission Control Protocol): 패킷 전송 여부와 순서 보장의 특징
 
 IP (Internet Protocol): 비신뢰성(패킷 전송 보장 x)과 비연결성의 특징 (IPv4, IPv6)
 */
