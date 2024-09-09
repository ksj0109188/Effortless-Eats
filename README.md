<img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/49672a35-d4d2-406c-89b8-52d20dddcd27" width="50" alt="앱아이콘" />

## RandomDine
#### "뭘 먹어야 하지?" 고민부터 시작해 탄생한 앱입니다.
#### 내 주변 음식점을 무작위로 추천하여 선택 장애를 해결합니다.
#### Kakao API를 활용해 내 위치 중심으로 설정한 거리에 따라 무작위 음식점 정보를 제공합니다.

#### Download : [<img src="https://img.shields.io/badge/apple-%23000000.svg?&style=for-the-badge&logo=apple&logoColor=white" />](https://apps.apple.com/kr/app/randomdine/id6477853120) 
#### Targets : iPad:17.1, iOS:17.1 이상

<Table align = "center">
  <tr>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/061c9eb5-8f2c-4a4c-983d-33bb86894877" width="100" alt="추천받기" /></td>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/f20a37e5-60f4-4b66-88da-e5cba9bc34f9" width="100" alt="즐겨찾기" /></td>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/94871d10-f72f-428a-ba68-cdc5b11ccd9c" width="100" alt="가게정보 표출" /></td>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/02e48b30-2d70-4d03-a8f5-459e6691c9f0" width="100" alt="설정" /></td>
    <td><img src="https://github.com/user-attachments/assets/73863223-eb9a-4f61-957f-e5fbdabb8edb" width="100" alt="장소검색" /></td>
    <td><img src="https://github.com/user-attachments/assets/49dfe881-a689-4120-a113-31dace7960bd" width="100" alt="맵을 활용한 위치설정" /></td>
  </tr>
  <tr align="center">
    <td>추천받기</td>
    <td>즐겨찾기</td>
    <td>가게정보 보기</td>
    <td>설정</td>
    <td>장소검색</td>
    <td>맵 위치표시</td>
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


  <tr align = "center">
    <td>
      <img src="https://github.com/user-attachments/assets/73863223-eb9a-4f61-957f-e5fbdabb8edb" width="150" alt="장소검색" />
    </td>
   <td align="left" valign="top">
      <p>
       <h2> 장소검색 </h2>
       <li> 사용자가 특정 장소를 검색 </li>
       <li> 검색 결과 선택에 따라 Map과 위치가 동기화됩니다.</li> 
      </p>
    </td>
  </tr>

  <tr align = "center">
    <td>
      <img src="https://github.com/user-attachments/assets/49dfe881-a689-4120-a113-31dace7960bd" width="150" alt="맵 위치표시" />
    </td>
   <td align="left" valign="top">
      <p>
       <h2> 맵 위치표시 </h2>
       <li> 사용자가 맵 Tap시 해당 위치로 랜덤음식점이 추첨됩니다. </li>
        <li> Tap시점에 따라 위경도 값을 이용했습니다. </li>
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

<details>
  <Summary>
    KaKaoMap 위치표시 트러블 슈팅
  </Summary>
  
#### 카카오맵 클릭시 좌표에 따른 위치 표시 기능을 구현했었고 탭 이벤트가 발생한 위치 기준 200Point 아래 마커가 표시되는 버그가 있었습니다.
<table>
  <tr align = "left">
    <td><img src="https://github.com/user-attachments/assets/05927677-3035-4ef3-a5d4-1bf458faa62e" width="200" alt="카카오맵 버그" /></td>
    <td>맵 터치시 가로방향은 정상이지만 높이 계산에서 버그발생, 의도한 위치가 아닌 200Pint 아래 마커가 표시되는 그림입니다.</td>
  </tr>
</table>

### 원인분석
#### 가장 먼저 kakaoMap Container에서의 viewFrame을 확인 했습니다.
1. 터치 이벤트를 활용한 viewFrame 출력 확인
```swift
// 클릭 이벤트시 Delegate 패턴으로 실행되는 이벤트 메소드
func kakaoMapDidTapped(kakaoMap: KakaoMap, point: CGPoint) {
      let position = kakaoMap.getPosition(point)
      let latitude = position.wgsCoord.latitude
      let longtitude = position.wgsCoord.longitude
      print("point", point) //디바이스에서  최하단 클릭시(height = 716.333)
      let location = viewModel.dependency.locationManager.transToCLLocation(latitude: latitude, longitude: longtitude)
      viewModel.dependency.locationManager.kaKaoSettingLocation = location
      drawPoi(location: location)
  }
```
2. Xcode Debug View Hierarchy로 설정된 Frame확인
<img width="225" alt="debugHieararchy" src="https://github.com/user-attachments/assets/76a57636-67e3-4597-a914-154a6271bef3">

3. kakaoMap Container를 포함하는 ViewController Root UIView 프레임 확인
```swift
func addViewSucceeded(_ viewName: String, viewInfoName: String) {
      print("OK") //추가 성공. 성공시 추가적으로 수행할 작업을 진행한다.
      canDraw = true
      
      print(view.frame.width) // 393.0 출력
      print(view.frame.height) // 852.0 출력

      containerDidResized(CGSize(width: view.frame.width, height: view.frame.height)) // Viewcontroller UIView로 초기화시점에 frame값 설정 코드
      drawPoi(location: viewModel.getLocation())
  }
```
#### view.frame.height 가 852 Point, 실제 KaKaoMap View는 최대 716.333 Point를 사용하는 걸 확인했고 좌표계 값은 정상적으로 받아오지만 852Point기준으로 작동되는 걸 추측할 수 있었습니다.
#### 852Point는 해당 화면의 전체크기로, SwiftUI UIView
### 해결방법
Combine을 활용해 ViewController Frame이 결정된 후 Kakaomap Frame을 설정하도록 변경해 해당 이슈를 처리했습니다.
```swift
override func viewDidLoad() {
  super.viewDidLoad()
  prepareEngine()
  activateEngine()
}

private func prepareEngine() {
  let container = KMViewContainer()
  self.view = container
  self.container = container

  controller = KMController(viewContainer: container)
  controller?.delegate = self
  controller?.prepareEngine()
}

override func viewDidLayoutSubviews() {
  super.viewDidLayoutSubviews()
  isMapViewAdded.sink { [weak self] isAdded in
    if isAdded {
      if let self = self {
      self.containerResize(CGSize(width: self.view.frame.width, height: self.view.frame.height))
      }
    }
  }
.store(in: &subsciprionts)
}

private func containerResize(_ size: CGSize) {
let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
mapView?.viewRect = CGRect(origin: .zero, size: size)
}
```

### 인사이트
#### KaKaoMap은 UIKit 기반으로 되어 있었습니다. SwiftUI에서 UIViewControllerRepresentable 활용해 브릿징 해서 사용할 때 View Frame결정 사이클에 대해 생각할 수 있었습니다.
#### 초기화 시점에는 해당 화면 프레임 전체로 초기화 되므로 

   
</details>

<details>
  <summary>
    DIContainer를 활용한 관심사 분리
  </summary>
  
  #### 기존 View 코드에 CoreData를 사용하는 영역이 존재했습니다. 해당 프로젝트에선 MVVM을 채택해 사용하고 있었고 View가 아닌 ViewModel에 CoreData를 의존성 주입 하는 방식으로 변경했습니다.
  ```swift
// 기존 코드
struct RecommendView: View {
@Environment(\.managedObjectContext) private var viewContext
@FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \RecommendedList.date, ascending: true)],
        animation: .default)
private var items: FetchedResults<RecommendedList>

var body: some View {
...

//---------------------개선된 코드 ---------------------
//---------------------ViewModel---------------------
final class RecommendViewModel: ObservableObject {
    @Published var recommendedStore: Document?
    @Published var isEmptyRecommendStore: Bool = true
    @Published var isFavorite: Bool = false
    
    struct Dependencies {
        let repository: FoodStoreDBRepository
        let locationManager: LocationManager
        let kakaoAPI: KaKaoAPI
    }
    
    let dependency: Dependencies
    private var subsciprionts = Set<AnyCancellable>()
    
    init() {
        self.dependency = AppDIContainer.makeRecommendViewModel()
    }
    ...
}

//---------------------DIContainer---------------------
final class AppDIContainer {
  static let config = AppConfiguration()
  static let locationManager =  LocationManager()
  
  static func makeRecommendViewModel() -> RecommendViewModel.Dependencies {
      let persistence = CoreDataStack()
      let db = RealFoodStoreDBRepository(persistentStore: persistence)
      let kakaoAPI = KaKaoAPI()
      
      return RecommendViewModel.Dependencies(repository: db, locationManager: locationManager, kakaoAPI: kakaoAPI)
}
    ...

//---------------------CoreData---------------------
protocol PersistentStore {
typealias DBOperation<Result> = (NSManagedObjectContext) throws -> Result
func count<T>(_ fetchRequest: NSFetchRequest<T>) -> AnyPublisher<Int, Error>
func fetch<T: NSManagedObject>(_ fetchRequest: NSFetchRequest<T>) -> AnyPublisher<[T], Error>
func update<Result>(_ operation: @escaping DBOperation<Result>) -> AnyPublisher<Result, Error>
}

struct CoreDataStack: PersistentStore {
private let container: NSPersistentContainer

init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "Model")
    
    if inMemory {
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    
    container.loadPersistentStores(completionHandler: { (_, error) in
        if let error = error as NSError? {
            debugPrint("Unresolved error \(error), \(error.userInfo)")
        }
    })
}

func count<T>(_ fetchRequest: NSFetchRequest<T>) -> AnyPublisher<Int, Error> {
    return Future<Int, Error> { [weak container] promise in
        let context = container?.viewContext
        do {
            let count = try context?.count(for: fetchRequest) ?? 0
            promise(.success(count))
        } catch {
            promise(.failure(error))
        }
    }
    .eraseToAnyPublisher()
}
...
}
  ```
</details>
  
<details>
  <summary>
    UI/UX
  </summary>
  
  #### API요청의 응답이 늦으면 사용자가 기다리는 시간에 심심하지 않을까에 고민을 했습니다.
  #### SwiftUI에서 제공하는 ProgressView대신 커스텀한 View를 생성했고 GCD scheduler를 사용해 이미지가 계속 바뀌게 구현했습니다.
  
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

## File tree
<details>
  <summary>자세히</summary>

  #### 화면영역 (Presentation), Data영역(Data)을 분리했습니다. 
  
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
