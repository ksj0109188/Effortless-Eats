<img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/49672a35-d4d2-406c-89b8-52d20dddcd27" width="50" alt="앱아이콘" />

## RandomDine
#### "뭘 먹어야 하지?" 고민부터 시작해 탄생한 앱입니다.
#### 내 주변 음식점을 무작위로 추천하여 선택 장애를 해결합니다.
#### Kakao API를 활용해 내 위치 중심으로 설정한 거리에 따라 무작위 음식점 정보를 제공합니다.

#### Download : [<img src="https://img.shields.io/badge/apple-%23000000.svg?&style=for-the-badge&logo=apple&logoColor=white" />](https://apps.apple.com/kr/app/randomdine/id6477853120) 
#### Targets : iPad:17.1, iOS:17.1 이상

<Table align = "center">
  <tr>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/061c9eb5-8f2c-4a4c-983d-33bb86894877" width="200" alt="추천받기" /></td>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/f20a37e5-60f4-4b66-88da-e5cba9bc34f9" width="200" alt="즐겨찾기" /></td>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/94871d10-f72f-428a-ba68-cdc5b11ccd9c" width="200" alt="가게정보 표출" /></td>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/02e48b30-2d70-4d03-a8f5-459e6691c9f0" width="200" alt="설정" /></td>
  </tr>
  <tr align="center">
    <td>추천받기</td>
    <td>즐겨찾기</td>
    <td>가게정보 보기</td>
    <td>설정</td>
  </tr>
</Table>

## Skills
- SwiftUI
- MVVM 
- Cobmine 
- KaKaoMap Local API 
- Swift Lint 
- CoreData
- Git Flow
- Xcode Cloud

## Functions
  <Table>
  <tr>
    <td align = "center">
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/fba17168-d9d2-4c05-a537-231d76d66aa8" width="150" alt="설정" />
    </td>
    <td valign= "top">
      <p>
        <h2> 홈 </h2>
        <li> 메인 화면으로 추천받기 버튼 및 저장된 즐겨찾기 리스트가 출력됩니다. </li>
        <li> 오른쪽 상단위 톱니 Symbol을 터치해 환경설정뷰로 이동됩니다. </li>
      </p>
    </td>
  </tr>
  
  <tr>
    <td align = "center">
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/061c9eb5-8f2c-4a4c-983d-33bb86894877" width="150" alt="추천받기" />
    </td>
    <td valign= "top">
      <p>
       <h2> 추천받기</h2>
       <li> 사용자 위치 기준으로 설정된 거리에 따라 랜덤하게 가게정보를 받아옵니다.</li>
       <li> Combine으로 비동기 핸들링 기능을 구현했습니다 </li>
       <li> 사용 API는 KaKao Local API를 사용했습니다.</li>
       <li> UX를 고려해 API통신이 끝나기 전까지 음식 아이콘이 표출됩니다. Combine Publisher Scheduler를 이용했습니다.</li>
      </p>
    </td>
  </tr>

  <tr>
    <td align = "center">
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/f20a37e5-60f4-4b66-88da-e5cba9bc34f9" width="150" alt="즐겨찾기" />
    </td>
    <td valign= "top">
      <p>
       <h2> 즐겨찾기 </h2>
       <li> 추천받은 가게정보를 사용자가 별아이콘 터치만으로 즐겨찾기에 추가할 수 있습니다.</li>
       <li> 삭제의 경우 별아이콘을 다시 터치하거나 홈 화면에서 스와이프 동작으로 제거할 수 있습니다. </li>
       <li> CoreData를 활용해 데이터 Persistence를 구축했습니다.</li>
      </p>
    </td>
  </tr>

  <tr>
    <td align = "center">
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/94871d10-f72f-428a-ba68-cdc5b11ccd9c" width="150" alt="가게정보 보기" />
    </td>
    <td align="left" valign="top">
      <p>
       <h2> 가게정보 보기</h2>
       <li> 홈 화면에서 즐겨찾기 항목을 터치하거나, 추천받기뷰에 출력된 아이템에서 이동 가능합니다. </li>
       <li> SafarWebView에 추천된 가게 URL이 전달되며 카카오맵 웹 페이지로 가게정보를 볼 수 있습니다. </li>
      </p>
    </td>
  </tr>

  <tr align = "center">
    <td>
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/02e48b30-2d70-4d03-a8f5-459e6691c9f0" width="150" alt="설정" />
    </td>
   <td align="left" valign="top">
      <p>
       <h2> 설정 </h2>
       <li> 사용자가 설정한 거리에따라 음식춤이 됩니다. </li>
       <li> 사용자의 설정 거리에따른 정보가 API request parameter로 전달 됩니다.</li> 
       <li> 사용자가 위치정보를 제공 여부 설정을 쉽게 할 수 있게 기능을 제공하고 있습니다. </li>
      </p>
    </td>
  </tr>
</Table>

## 트러블 슈팅
<details>
<summary> 카카오, Naver, Google API 선택이슈</summary>
<span>
  
  #### RandomDine의 추천받기 기능은 위치기반 서비스 API가 필요했고 다음과 같은 고려사항이 있었습니다.
  
  <li>무료 사용량</li>
  <li>위치 좌표계를 전달해 데이터 핸들링</li>
  <li>음식점 데이터만 필터링해 fetch가 가능한가</li>
  
  #### 프로젝트 개발 2024.01일 기준으로 무료 호출 횟수와 데이터 필터링 지원 범위를 고려해 KaKao를 선택했습니다. 
  #### 네이버가 가장 무료 사용량이 많았지만, 사전에 필터할 카테고리(음식점 카테고리), 위치반경 조건 등 데이터 필터링 가능해 카카오API를 선택했습니다.(구글은 무료사용량이 적어 후보에 제외했습니다. RandomDine이 글로벌 서비스로 변경시 사용 고려중입니다.)
</span>
</details>


<details>
  <Summary>
    과도한 API요청
  </Summary>
  
  #### 추천받기 기능을 터치할 때 마다 API호출이 발생하게 됩니다. 과도한 API요청으로 이어질 수 있어 사용자 UX를 고려해 너무 길지 않는 시간(초당 request 1번)제한을 설정했습니다.
  <details>
    <summary>
      소스보기
    </summary>
  
  ```swift
       struct RecommendView: View {
        // Publisher
        let clickedButtonSubject = PassthroughSubject<Void, Never>()
        @State private var showingResultView: Bool = true
        var recommendViewModel: RecommendViewModel
        let searchDistance: Double
          
        var body: some View {
            HStack {
                Spacer()
                Button("다시 받기") {
                    showingResultView = false
                    clickedButtonSubject.send()
                }
                .onReceive(clickedButtonSubject.throttle(for: .seconds(1), scheduler: DispatchQueue.main, latest: true)) { _ in
                    recommendViewModel.fetchRandomStore(radius: Int(searchDistance))
                }
            }
        }
    }  
  ```
  </details>
</details>


<details>
  <summary id="apiModule">
  확장성과 재사용성을 고려한 API 모듈
  </summary>
  
  #### KaKao Local API외 다른 API(KaKao Map API)사용을 고려해야 했습니다. 재사용성이나 유지보수 측면에서 용이하게 설계의 초점을 두었습니다.
  #### KaKao API 종류별 endPoint를 생성 하고 응답받은 data들을 ViewModel의 책임을 전가할 수 있게 Combine을 활용한 코드를 구현했습니다.
  
  <details>
      <summary>
        소스보기
      </summary>
    
  ```swift
//요약한 코드입니다.
struct KaKaoAPI {
    let locationManager = LocationManager()

    enum KakaoAPIError: Error, CustomStringConvertible {
        case overflowRadius, invalidURL, invalidResponse, decodeError

        var description: String {
            switch self {
            case .overflowRadius: return "radius 파라미터 값이 유효하지 않습니다. 범위는 0~200000"
            case .invalidURL: return "유효하지 않는 URL 발생"
            case .invalidResponse: return "유효하지 않는 응답."
            case .decodeError: return "Parsing 에러 발생"
            }
        }
    }

    enum EndPoint {
        static let apiProtocol = "https"
        static let domain = "dapi.kakao.com"
        static let restAPIKey = "YOUR_REST_API_KEY"
        static let restAPIMethod = "KakaoAK"

        case kakaoLocalAPI

        var baseURL: URL { URL(string: "\(apiProtocol)://\(domain)")! }

        var request: URLRequest {
            switch self {
            case .kakaoLocalAPI:
                let url = baseURL.appendingPathComponent("/v2/local/search/category.json")
                var request = URLRequest(url: url)
                request.addValue("\(restAPIMethod) \(restAPIKey)", forHTTPHeaderField: "Authorization")
                request.httpMethod = "GET"
                return request
            }
        }
    }

    enum KaKaoLocalAPICategory: String {
        case Supermarket = "MT1", ConvenienceStore = "CS2", Restaurant = "FD6"
        // Additional categories...
    }

    func requestStores(distance radius: Int, coordinate: CLLocationCoordinate2D?) -> AnyPublisher<KaKaoLocalAPIDTO, KakaoAPIError> {
        guard (0...20000).contains(radius) else {
            return Fail(error: KakaoAPIError.overflowRadius).eraseToAnyPublisher()
        }

        var request = EndPoint.kakaoLocalAPI.request
        // Append additional query items here...

        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError { _ in KakaoAPIError.invalidURL }
            .flatMap { URLSession.shared.dataTaskPublisher(for: $0.request).mapError { _ in KakaoAPIError.invalidResponse } }
            .decode(type: KaKaoLocalAPIDTO.self, decoder: JSONDecoder())
            .mapError { _ in KakaoAPIError.decodeError }
            .eraseToAnyPublisher()
    }
}

    
    /// 내주위 음식점 정보 가지고오기
    /// - Parameters:
    ///   - radius: 내 중심점 위도 경도 기준 반경 설정 파라미터(m단위).
    /// - Returns: URL session data task publihser for a given request
    func requestStores(distance radius: Int, coordinate: CLLocationCoordinate2D?) -> AnyPublisher<KaKaoLocalAPIDTO, KakaoAPIError> {
        guard (0...20000).contains(radius) else {
            return Empty<KaKaoLocalAPIDTO, KakaoAPIError>()
                .mapError { _ in KakaoAPIError.overflowRadius}
                .eraseToAnyPublisher()
        }
        
        var request = EndPoint.kakaoLocalAPI.request
        request.url?.append(queryItems: [ .init(name: "radius", value: "\(radius)")])
        if let coordinate = coordinate {
            request.url?.append(queryItems: [ .init(name: "x", value: "\(coordinate.longitude)")])
            request.url?.append(queryItems: [ .init(name: "y", value: "\(coordinate.latitude)")])
        }
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
            .tryMap { output in
                return try JSONDecoder().decode(KaKaoLocalAPIDTO.self, from: output.data)
            }
            .mapError { error -> KakaoAPIError in
                switch error {
                case is URLError:
                    return KakaoAPIError.invalidURL
                case is DecodingError:
                    return KakaoAPIError.decodeError
                default: return KakaoAPIError.invalidResponse
                }
            }
            .eraseToAnyPublisher()
    }
}
  ```
  </details>
</details>


<details>
  <summary>
    UI/UX
  </summary>
  
  #### API요청의 응답이 늦으면 사용자가 기다리는 시간에 심심하지 않을까에 고민을 했습니다.
  #### SwiftUI에서 제공하는 ProgressView대신 커스텀한 View를 생성했고 GCD scheduler를 사용해 이미지가 계속 바뀌게 구현했습니다.
  
 <details>
  <summary>소스보기</summary>
   
   ```swift
//요약한 코드입니다.
struct LoadingView: View {
    @State private var subsciprionts = Set<AnyCancellable>()
    @State private var pages: Int = 0
    @State private var images = [Image("Bun"), Image("Burger1"), Image("Burger2"), Image("Hotdog"), Image("Noodle2"), Image("Pizza")]

    var body: some View {
        VStack(spacing: 2) {
            images[pages]
            Text("로딩중")
        }
        .onAppear(perform: {
            setTimer()
        })
    }

    func setTimer() {
        let queue = DispatchQueue.global()
        var counter = 0

        queue.schedule(
            after: queue.now,
            interval: .seconds(0.5),
            tolerance: .milliseconds(100)
        ) {
            if images.count <= counter + 1 {
                counter = 0
            } else {
                counter += 1
            }
            DispatchQueue.main.async {
                self.pages = counter
            }
        }
        .store(in: &subsciprionts)
    }
}
  ```
  </details>
</details>

## File tree
<details>
  <summary>자세히</summary>
  
```
sources
├─ RandomDine
│  ├─ Application
│  ├─ Data
│  │  ├─ DTO
│  │  ├─ Network
│  │  └─ Persistence
│  ├─ Extension
│  ├─ Presentation
│  │  ├─ Components
│  │  ├─ RecommendFoodStoreScene
│  │  │  ├─ View
│  │  │  └─ ViewModel
│  │  └─ SettingScene
│  ├─ Resource
│  └─ Utility
├─ ci_scripts
└─ .swiftlint.yml
```

</details>
