Java에서 `call by value`와 `call by reference`에 대한 개념은 조금 헷갈릴 수 있지만, 핵심은 **Java는 모든 값을 'call by value'(값에 의한 호출)로 전달한다**는 것입니다. 그러나 전달되는 값이 **객체의 참조값(reference)** 인 경우, 객체 내부 상태를 변경할 수 있어 마치 참조에 의한 호출처럼 보일 수 있음

---

## 🔹 1. 기본 개념

### ✅ Call by Value (값에 의한 호출)

* **메서드에 인자로 전달된 변수의 값을 복사해서 사용하는 방식**
* 메서드 안에서 값을 변경해도 **원본 변수에는 영향을 주지 않음

### ✅ Call by Reference (참조에 의한 호출) - Java에서는 직접적으로 존재하지 않음

* 변수 자체가 아닌 **메모리 주소(참조)를 넘겨서** 원본 데이터를 직접 변경하는 방식
* Java는 엄밀히 말하면 call by reference가 없음
* 객체의 **참조값(주소)** 을 value로 전달하기 때문에 객체 내부의 값은 바뀔 수 있습니다.

---

## 🔹 2. 자료형별 예제와 동작 분석

---

### ✅ `int` (기본형, primitive type)

```java
public class Example {
    public static void changeInt(int x) {
        x = 10;
    }

    public static void main(String[] args) {
        int a = 5;
        changeInt(a);
        System.out.println(a); // 5
    }
}
```

* `int`는 기본형이므로 값만 복사됨 → `main`의 `a`는 **변하지 않음**

---

### ✅ `Object` (참조형)

```java
class MyObject {
    int value = 1;
}

public class Example {
    public static void changeObject(MyObject obj) {
        obj.value = 100;
    }

    public static void main(String[] args) {
        MyObject mo = new MyObject();
        changeObject(mo);
        System.out.println(mo.value); // 100
    }
}
```

* `obj`는 객체 주소를 복사해서 전달받았고, 내부 필드를 바꾸었기 때문에 실제 객체가 **변경됨**

---

### ✅ `String` (불변 객체, Immutable)

```java
public class Example {
    public static void changeString(String s) {
        s = "changed";
    }

    public static void main(String[] args) {
        String str = "original";
        changeString(str);
        System.out.println(str); // original
    }
}
```

* `String`은 불변(immutable)이기 때문에 `s`에 새로운 문자열을 할당해도 **원본은 변하지 않음**

---

### ✅ `StringBuilder` (가변 객체, Mutable)

```java
public class Example {
    public static void changeBuilder(StringBuilder sb) {
        sb.append(" world");
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder("Hello");
        changeBuilder(sb);
        System.out.println(sb.toString()); // Hello world
    }
}
```

* `StringBuilder`는 가변 객체이므로, 참조된 인스턴스의 내부 상태 변경이 **영향을 줌**

---

### ✅ `Array` (배열, 참조형)

```java
public class Example {
    public static void changeArray(int[] arr) {
        arr[0] = 999;
    }

    public static void main(String[] args) {
        int[] nums = {1, 2, 3};
        changeArray(nums);
        System.out.println(nums[0]); // 999
    }
}
```

* 배열도 객체이므로, 배열의 요소를 변경하면 **원본에도 영향이 있음**

---

## 🔹 3. 정리 표

| 자료형             | 변경 여부      | 이유                         |
| --------------- | ---------- | -------------------------- |
| `int`           | ❌ 변경 안됨    | 값 복사만 전달됨                  |
| `Object`        | ✅ 내부 값 변경됨 | 참조값이 복사되어 내부 상태 변경 가능      |
| `String`        | ❌ 변경 안됨    | 불변 객체, 새로운 값 할당은 원본에 영향 없음 |
| `StringBuilder` | ✅ 변경됨      | 가변 객체, 참조된 인스턴스 내용 변경 가능   |
| `Array`         | ✅ 변경됨      | 참조형이며 내부 요소 변경 가능          |

---

## 🔹 4. 추가 설명: 참조 자체를 변경해도 원본엔 영향이 없음

```java
public class Example {
    public static void reassignObject(MyObject obj) {
        obj = new MyObject();
        obj.value = 999;
    }

    public static void main(String[] args) {
        MyObject mo = new MyObject();
        mo.value = 100;
        reassignObject(mo);
        System.out.println(mo.value); // 100
    }
}
```

* `obj = new MyObject()`는 **로컬 변수의 참조값만 변경한 것** → 원래의 `mo`에는 영향 없음

---

## 🔚 결론

* Java는 **항상 call by value**만 사용한다.
* 그러나 객체를 넘길 때는 **참조값을 value로 넘기므로**, 내부 상태는 바뀔 수 있다.
* **불변 객체인지 가변 객체인지**, 그리고 **내부를 바꾸는지 참조 자체를 바꾸는지**에 따라 결과가 달라짐
