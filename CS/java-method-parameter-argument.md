
---

## ✅ 차이점 요약

| 용어                  | 설명                   | 사용 시점        |
| ------------------- | -------------------- | ------------ |
| **파라미터(parameter)** | 메서드를 정의할 때 사용하는 변수   | 메서드 **정의** 시 |
| **아규먼트(argument)**  | 메서드를 호출할 때 전달하는 실제 값 | 메서드 **호출** 시 |

---

## ✅ 자바 예시로 설명

```java
public class Calculator {

    // 파라미터: a, b는 이 메서드를 정의할 때 사용하는 변수
    public int add(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        Calculator calc = new Calculator();

        // 아규먼트: 10, 20은 add 메서드를 호출할 때 전달하는 실제 값
        int result = calc.add(10, 20);

        System.out.println("결과: " + result);  // 결과: 30
    }
}
```

### 📌 위 예시에서:

* `int a`, `int b`: **파라미터**
  → 메서드 `add`를 정의할 때 사용된 변수입니다.

* `10`, `20`: **아규먼트**
  → `add(10, 20)`처럼 메서드를 호출할 때 전달하는 실제 값입니다.

---

## 🔁 쉽게 기억하는 팁

* **Parameter**는 **메서드 선언** 시 사용하는 이름.
* **Argument**는 **메서드 호출** 시 넘기는 값.

---
