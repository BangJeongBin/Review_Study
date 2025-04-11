아래는 `QueryString.txt` 파일의 내용을 마크다운 파일 형식으로 변환한 결과입니다:

```markdown
# Query String과 Path Variable

Query String과 Path Variable은 웹 애플리케이션에서 클라이언트가 서버로 데이터를 전달하는 방식이지만, 사용 목적과 방식이 다르다.

---

## 1. Query String

### 형태
`?key1=value1&key2=value2`

### 특징
- `GET` 요청에서 주로 사용됨
- 필터링, 검색, 페이징, 정렬 등과 같이 선택적인 데이터를 전달할 때 적합함
- 다수의 파라미터를 손쉽게 추가 가능
- URL에 포함되므로 보안에 취약 (노출됨)

### 사용 예시

#### (1) 상품 목록을 필터링할 때
```bash
GET /products?category=electronics&minPrice=10000&maxPrice=50000
```
- `category=electronics`: 전자제품 카테고리만 조회
- `minPrice=10000, maxPrice=50000`: 가격 범위 내 상품 조회

#### (2) 페이지네이션 (페이징)
```bash
GET /products?page=2&size=20
```
- `page=2`: 두 번째 페이지
- `size=20`: 한 페이지에 20개씩

### Spring Boot 코드
```java
@GetMapping("/products")
public List<Product> getProducts(
    @RequestParam String category,
    @RequestParam(required = false) Integer minPrice,
    @RequestParam(required = false) Integer maxPrice,
    @RequestParam(defaultValue = "1") int page,
    @RequestParam(defaultValue = "10") int size
) {
    // 상품 조회 로직
}
```

---

## 2. Path Variable

### 형태
`/{value}`

### 특징
- `GET`, `DELETE`, `PUT`, `PATCH` 등의 요청에서 리소스를 식별할 때 주로 사용됨
- URL 구조에 포함되어 의미가 명확함
- 계층적인 리소스 구조 표현에 적합

### 사용 예시

#### (1) 특정 상품 상세 조회
```bash
GET /products/123
```
- `123` → 특정 상품의 ID를 전달하여 조회

#### (2) 특정 유저의 주문 조회
```bash
GET /users/5/orders
```
- `5` → 특정 유저의 ID

### Spring Boot 코드
```java
@GetMapping("/products/{productId}")
public Product getProductById(@PathVariable Long productId) {
    // 특정 상품 조회 로직
}
```

---

## 🚀 언제 사용해야 할까?

| Query String                           | Path Variable                     |
|----------------------------------------|------------------------------------|
| **목적** 검색, 필터링, 정렬, 페이징 등 | 특정 리소스 조회, 수정, 삭제       |
| **HTTP Method** `GET`                  | `GET`, `PUT`, `DELETE`, `PATCH`   |
| **예시** `/products?category=electronics&sort=price` | `/products/123` |

---

## ✅ 정리

- **Query String**: 검색, 필터링, 정렬, 페이징 등 선택적인 데이터 전달
- **Path Variable**: 특정 리소스 식별 (ID, 고유 값)
```
