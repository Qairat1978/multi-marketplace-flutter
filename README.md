# 🚀 Multi-Vendor Marketplace App (Flutter + AWS)

A scalable full-stack marketplace application built with **Flutter** and **AWS Serverless Architecture**.
This project demonstrates real-world backend integration, cloud storage, and modern mobile UI development.

---

## 🧠 Overview

This application simulates a **multi-vendor eCommerce platform**, where:

* Vendors can upload product images
* Users can browse banners and products
* Backend handles image storage, APIs, and scalability

---

## 🛠 Tech Stack

### 📱 Frontend

* Flutter
* Dart

### ☁️ Backend (AWS)

* AWS Lambda
* API Gateway
* DynamoDB
* S3 (Image Storage)
* Presigned URLs (secure upload)

---

## ⚙️ Features

### 🖼️ Banner System

* Upload banner images to S3
* Store image keys in DynamoDB
* Fetch and display banners dynamically in Flutter

### 📦 Product System (in progress)

* Product creation API
* Product listing

### 🔐 Authentication (planned)

* AWS Cognito integration

---

## 🔥 Key Highlights

* ✅ Image upload using **S3 presigned URLs**
* ✅ Fully serverless backend (no servers)
* ✅ Clean Flutter UI with modular structure
* ✅ Real production-like architecture
* ✅ Scalable and cost-efficient design

---

## 🏗 Architecture

```
Flutter App
     ↓
API Gateway
     ↓
AWS Lambda
     ↓
DynamoDB + S3
```

---

## 📸 Screenshots

> Add your screenshots here

```
assets/screenshots/home.png
```

---

## 🚀 Getting Started

### 1. Clone the repo

```
git clone https://github.com/Qairat1978/multi-marketplace-flutter.git
cd multi-marketplace-flutter
```

### 2. Install dependencies

```
flutter pub get
```

### 3. Run the app

```
flutter run
```

---

## 🔗 API Example

### Get Banners

```
GET /ads
```

### Upload Image

```
POST /upload-url
```

---

## 📂 Project Structure

```
lib/
 ├── models/
 ├── services/
 ├── views/
 │    ├── main/
 │    ├── auth/
 │    └── widgets/
 └── main.dart

assets/
 ├── icons/
 └── images/
```

---

## 🎯 What I Learned

* Building real-world apps with Flutter
* Designing serverless architecture on AWS
* Working with S3 and presigned URLs
* Managing state and API integration
* Debugging real production issues (CORS, S3 permissions, etc.)

---

## 🚀 Future Improvements

* 🛒 Cart & Order system
* 💳 Payment integration (Stripe / Kaspi)
* 👤 User authentication (Cognito)
* 🧑‍💼 Vendor dashboard
* ⚡ CloudFront CDN for image optimization

---

## 👨‍💻 Author

**Kairat Tulegenov**

---

## ⭐️ Notes

This project is part of my journey to becoming a **Full Stack AWS Engineer**.
