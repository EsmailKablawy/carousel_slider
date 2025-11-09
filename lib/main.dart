import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'عرض الشرائح',
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar', 'EG'),
          supportedLocales: const [Locale('ar', 'EG')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
            fontFamily: 'Cairo',
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عرض الشرائح'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'اسحب يمين أو يسار',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20.h),
            const CarouselSliderWidget(height: 400, padding: 20),
          ],
        ),
      ),
    );
  }
}

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    super.key,
    required this.height,
    required this.padding,
  });
  final double height;
  final double padding;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int activeIndex = 0;
  double dragStartX = 0;

  final List<Color> colors = [
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
  ];

  void _onHorizontalDragStart(DragStartDetails details) {
    dragStartX = details.globalPosition.dx;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    double delta = details.globalPosition.dx - dragStartX;

    // تحديد اتجاه اللغة
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    // لو عربي (RTL): سحب يمين = قدام، سحب شمال = ورا
    // لو إنجليزي (LTR): سحب يمين = ورا، سحب شمال = قدام

    if (isRTL) {
      // عربي: سحب يمين (→) يروح لل card اللي بعده
      if (delta > 50 && activeIndex < colors.length - 1) {
        setState(() {
          activeIndex++;
        });
        dragStartX = details.globalPosition.dx;
      }
      // عربي: سحب شمال (←) يرجع لل card اللي قبله
      else if (delta < -50 && activeIndex > 0) {
        setState(() {
          activeIndex--;
        });
        dragStartX = details.globalPosition.dx;
      }
    } else {
      // إنجليزي: سحب يمين (→) يرجع لل card اللي قبله
      if (delta > 50 && activeIndex > 0) {
        setState(() {
          activeIndex--;
        });
        dragStartX = details.globalPosition.dx;
      }
      // إنجليزي: سحب شمال (←) يروح لل card اللي بعده
      else if (delta < -50 && activeIndex < colors.length - 1) {
        setState(() {
          activeIndex++;
        });
        dragStartX = details.globalPosition.dx;
      }
    }
  }

  double _getWidth(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (index == activeIndex) {
      return screenWidth - 128.w - widget.padding.w;
    } else if (index < activeIndex - 1 || index > activeIndex + 2) {
      return 0;
    } else {
      return 50.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      child: Container(
        height: widget.height.h,
        padding: EdgeInsetsDirectional.only(start: widget.padding.w),
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(colors.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                width: _getWidth(index),
                height: widget.height.h,
                margin: EdgeInsets.symmetric(
                  horizontal: _getWidth(index) == 0 ? 0 : 4.w,
                ),
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(34.r),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: index == activeIndex
                      ? Center(
                          child: Text(
                            'بطاقة ${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
