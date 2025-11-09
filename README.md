# 🎨 Carousel Slider Widget

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)

**مكون سلايدر احترافي بتأثيرات حركية سلسة | Professional carousel with smooth animations**

[Demo](#-demo) • [Features](#-features) • [Installation](#-installation) • [Usage](#-usage)

</div>

---

## ✨ Features

- 🎯 **RTL/LTR Support** - دعم كامل للعربي والإنجليزي
- 🎨 **Smooth Animations** - تأثيرات حركية سلسة
- 👆 **Gesture Control** - تحكم بالسحب (Swipe)
- 📱 **Responsive** - متجاوب مع جميع الشاشات
- ⚡ **Performance** - أداء عالي وسريع
- 🎭 **Customizable** - قابل للتخصيص بالكامل

---

## 🎬 Demo

```
┌─────────────────────────────────────┐
│  ┌──┐  ┌────────────────┐  ┌──┐   │
│  │ 1│  │   Card 2       │  │ 3│   │  ← اسحب يمين/شمال
│  └──┘  └────────────────┘  └──┘   │
└─────────────────────────────────────┘
```

---

## 📦 Installation

### 1. أضف الـ dependencies في `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  flutter_screenutil: ^5.9.0
```

### 2. نزل الـ packages:

```bash
flutter pub get
```

---

## 🚀 Usage

### Basic Example

```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSliderWidget(
          height: 400,
          padding: 20,
        ),
      ),
    );
  }
}
```

### Customization

```dart
CarouselSliderWidget(
  height: 300,        // ارتفاع البطاقات
  padding: 20,        // المسافة من البداية
)
```

---

## 🎨 How It Works

### العربي (RTL)
- **سحب يمين** ← = البطاقة التالية
- **سحب شمال** → = البطاقة السابقة

### English (LTR)
- **Swipe right** → = Previous card
- **Swipe left** ← = Next card

الاتجاه يتغير **تلقائياً** حسب لغة التطبيق! 🎯

---

## 🏗️ Project Structure

```
lib/
├── main.dart                  # نقطة البداية
├── screens/
│   └── home_screen.dart      # الشاشة الرئيسية
└── widgets/
    └── carousel_slider_widget.dart  # مكون السلايدر
```

---

## ⚙️ Configuration

### ScreenUtil Setup

```dart
ScreenUtilInit(
  designSize: const Size(375, 812),  // حجم الشاشة المرجعي
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, child) {
    return MaterialApp(
      // ... your app
    );
  },
)
```

### Arabic Support

```dart
MaterialApp(
  locale: const Locale('ar', 'EG'),
  supportedLocales: const [
    Locale('ar', 'EG'),
    Locale('en', 'US'),
  ],
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
)
```

---

## 🎯 Key Features Breakdown

### 1. **Gesture Detection**
```dart
GestureDetector(
  onHorizontalDragStart: _onHorizontalDragStart,
  onHorizontalDragUpdate: _onHorizontalDragUpdate,
  // ...
)
```

### 2. **Smart Width Calculation**
```dart
double _getWidth(int index) {
  if (index == activeIndex) {
    return screenWidth - 128.w - widget.padding.w;  // البطاقة النشطة
  } else if (index < activeIndex - 1 || index > activeIndex + 2) {
    return 0;  // البطاقات البعيدة مخفية
  } else {
    return 50.w;  // البطاقات المجاورة صغيرة
  }
}
```

### 3. **Smooth Animations**
```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 350),
  curve: Curves.easeInOut,
  // ...
)
```

---

## 🛠️ Customization Options

يمكنك تخصيص:
- ✅ الألوان (`colors` list)
- ✅ الارتفاع (`height` parameter)
- ✅ المسافات (`padding` parameter)
- ✅ سرعة الانيميشن (`duration`)
- ✅ عدد البطاقات (`colors.length`)

---

## 📱 Tested On

- ✅ iOS
- ✅ Android
- ✅ Different screen sizes
- ✅ RTL & LTR layouts

---

## 🤝 Contributing

المساهمات مرحب بها! إذا عندك فكرة أو تحسين:

1. Fork المشروع
2. أنشئ branch جديد (`git checkout -b feature/AmazingFeature`)
3. Commit التغييرات (`git commit -m 'Add some AmazingFeature'`)
4. Push للـ branch (`git push origin feature/AmazingFeature`)
5. افتح Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Your Name**

- Youtube: [@esmail_elkablawy](https://www.youtube.com/@esmail_elkablawy)
- LinkedIn: [@Esmail Elkablawy](https://www.linkedin.com/in/esmail-elkablawy-a75048265/)

---

## 🌟 Show Your Support

لو عجبك المشروع، متنساش تدي ⭐️!

---

<div align="center">

**Made with ❤️ and Flutter**

[⬆ Back to Top](#-carousel-slider-widget)

</div>
