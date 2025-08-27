# 학원 관리 시스템 - **수료증 테이블 설계**

## 1️⃣ **개요**
학원에서 강의를 수료한 학생들에게 **수료증을 발급**할 수 있도록, `CERTIFICATE` 테이블을 설계합니다.  
수료증 발급 기준은 출석률과 성적을 고려하여 발급

---

## 2️⃣ **수료증 테이블 (`CERTIFICATE`) 상세 설계**

| 논리명 | 물리명 | 데이터 타입 | 필드명 | 설명 |
|--------|--------|--------|--------|--------|
| **수료증 번호** | `CERT_NO` | `INT (PK)` | `CERT_NO` | 수료증 고유번호 (기본키) |
| **학생 번호** | `STDNT_NO` | `INT (FK)` | `STDNT_NO` | 수료증을 발급받은 학생 (외래키) |
| **강의 번호** | `LECT_NO` | `INT (FK)` | `LECT_NO` | 수료한 강의 (외래키) |
| **수료 상태** | `CERT_STATUS` | `VARCHAR(10)` | `CERT_STATUS` | 수료 여부 (`COMPLETED`, `PENDING`, `FAILED`) |
| **수료 일자** | `CERT_DATE` | `DATE` | `CERT_DATE` | 수료증 발급일 |
| **강사 이름** | `INST_NAME` | `VARCHAR(50)` | `INST_NAME` | 수료증을 발급한 강사 이름 |
| **수료증 파일 URL** | `CERT_URL` | `VARCHAR(255)` | `CERT_URL` | 수료증 파일 다운로드 URL |
| **평균 성적** | `AVG_GRADE` | `FLOAT` | `AVG_GRADE` | 수업 성적 (예: 90.5) |
| **출석률** | `ATTEND_RATE` | `FLOAT` | `ATTEND_RATE` | 출석률 (예: 95.0%) |

---

## 3️⃣ **수료 상태 (`CERT_STATUS`) 값 정의**
수료증의 상태는 **3가지 값**을 지정 함.

| 상태 값 | 설명 |
|---------|------|
| `COMPLETED` | 수료 완료 |
| `PENDING` | 수료 대기 중 |
| `FAILED` | 수료 실패 |

---

## 4️⃣ **ERD 다이어그램 예시**
아래는 **`CERTIFICATE` 테이블이 `STUDENT`, `LECTURE` 테이블과 연결된 ERD 예시**입니다.

```plaintext
+-------------+       +-----------+       +------------+
| STUDENT     |       | LECTURE   |       | CERTIFICATE|
|-------------|       |-----------|       |------------|
| STDNT_NO (PK)| <--- | LECT_NO (PK)| <-- | CERT_NO (PK)|
| NAME        |       | TITLE      |      | STDNT_NO (FK)|
| EMAIL       |       | INST_NO (FK)|      | LECT_NO (FK)|
+-------------+       +-----------+      | CERT_STATUS |
                                         | CERT_DATE   |
                                         | CERT_URL    |
                                         | AVG_GRADE   |
                                         | ATTEND_RATE |
                                         +------------+
```

---

## 5️⃣ **테이블 생성 SQL (`CREATE TABLE`)**
아래는 `CERTIFICATE` 테이블을 생성하는 SQL 문입니다.

```sql
CREATE TABLE CERTIFICATE (
    CERT_NO      INT PRIMARY KEY AUTO_INCREMENT, -- 수료증 번호 (PK)
    STDNT_NO     INT NOT NULL, -- 학생 번호 (FK)
    LECT_NO      INT NOT NULL, -- 강의 번호 (FK)
    CERT_STATUS  VARCHAR(10) NOT NULL, -- 수료 상태 (COMPLETED, PENDING, FAILED)
    CERT_DATE    DATE NOT NULL, -- 수료 일자
    INST_NAME    VARCHAR(50), -- 강사 이름
    CERT_URL     VARCHAR(255), -- 수료증 파일 URL
    AVG_GRADE    FLOAT, -- 평균 성적
    ATTEND_RATE  FLOAT, -- 출석률
    FOREIGN KEY (STDNT_NO) REFERENCES STUDENT(STDNT_NO),
    FOREIGN KEY (LECT_NO) REFERENCES LECTURE(LECT_NO)
);
```

---

## 6️⃣ **활용 예시**
### 📌 **1) 수료증 데이터 삽입 (`INSERT`)**
```sql
INSERT INTO CERTIFICATE (STDNT_NO, LECT_NO, CERT_STATUS, CERT_DATE, INST_NAME, CERT_URL, AVG_GRADE, ATTEND_RATE)
VALUES (1001, 2001, 'COMPLETED', '2024-06-01', '김강사', 'https://academy.com/certificates/1001.pdf', 92.5, 98.0);
```

### 📌 **2) 특정 학생의 수료증 조회 (`SELECT`)**
```sql
SELECT * FROM CERTIFICATE WHERE STDNT_NO = 1001;
```

### 📌 **3) 출석률이 80% 이상이고 성적이 70점 이상인 학생 수료 처리**
```sql
UPDATE CERTIFICATE
SET CERT_STATUS = 'COMPLETED'
WHERE ATTEND_RATE >= 80 AND AVG_GRADE >= 70;
```

---

## 🔥 **마무리**
- `CERTIFICATE` 테이블을 활용하면 **수료증을 발급 및 관리**할 수 있습니다.  
- 출석률과 성적을 기준으로 **자동 발급 시스템**을 구현할 수도 있습니다.  
- `CERT_URL` 컬럼을 활용하면 **온라인으로 수료증을 다운로드**할 수 있습니다.  
