import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaberDetay extends StatefulWidget {
  const HaberDetay({super.key});

  @override
  _HaberDetayState createState() => _HaberDetayState();
}

class _HaberDetayState extends State<HaberDetay> {
  late String fullText;
  late String firstPart;
  late String secondPart;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    fullText = 'Burada haberin detaylı içeriği yer alacak. Detayları kullanıcıya sunmak için bu alana uzun bir metin ekleyebilirsiniz. Buraya ekleyeceğiniz metin oldukça uzun olabilir ve Flutter\'da bu tarz metinlerin yönetimi için çeşitli widget ve yaklaşımlar kullanılabilir. Örneğin, metin uzunsa bir "Devamını Oku" butonu ile kullanıcıya tam metni gösterme seçeneği sunabilirsiniz. Bu, özellikle haber uygulamalarında sıkça karşımıza çıkan bir durumdur. tam metni gösterme seçeneği sunabilirsiniz. Bu, özellikle haber uygulamalarında sıkça karşımıza çıkan bir durumdur. tam metni gösterme seçeneği sunabilirsiniz. Bu, özellikle haber uygulamalarında sıkça karşımıza çıkan bir durumdur. tam metni gösterme seçeneği sunabilirsiniz. Bu, özellikle haber uygulamalarında sıkça karşımıza çıkan bir durumdur. tam metni gösterme seçeneği sunabilirsiniz. Bu, özellikle haber uygulamalarında sıkça karşımıza çıkan bir durumdur. tam metni gösterme seçeneği sunabilirsiniz. Bu, özellikle haber uygulamalarında sıkça karşımıza çıkan bir durumdur. tam metni gösterme seçeneği sunabilirsiniz. Bu, özellikle haber uygulamalarında sıkça karşımıza çıkan bir durumdur.';
    firstPart = fullText;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 25.h,
                          ),
                          onPressed: () {
                            if (Navigator.canPop(context)) {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 85.w),
                      Text(
                        "Haber Detay",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      final style = TextStyle(fontSize: 16.sp);
                      final textSpan = TextSpan(text: fullText, style: style);
                      final textPainter = TextPainter(
                        text: textSpan,
                        textDirection: TextDirection.ltr,
                        maxLines: 10,
                      );
                      textPainter.layout(maxWidth: constraints.maxWidth - 30.w);
                      if (textPainter.didExceedMaxLines) {
                        firstPart = fullText.substring(0, textPainter.getPositionForOffset(Offset(constraints.maxWidth - 30.w, 10 * textPainter.preferredLineHeight)).offset);
                        secondPart = fullText.substring(firstPart.length);
                        return Column(
                          children: [
                            Text(firstPart, style: style),
                            if (!isExpanded)
                              Padding(
                                padding: EdgeInsets.only(left: 25.w,right: 25.w,top: 10.h),
                                child: ElevatedButton(
                                  onPressed: () => setState(() => isExpanded = true),
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 48)), // Butonu genişlet
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.w), // Az yuvarlak köşe
                                            side: BorderSide(color: Colors.black) // Siyah çerçeve ekle
                                        )
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Butonun arka planını beyaz yap
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Yazı rengini siyah yap
                                  ),
                                  child: Text('Devamını Oku', style: TextStyle(fontSize: 16)),
                                ),
                              ),
                            if (isExpanded)
                              Text(secondPart, style: style),
                          ],
                        );
                      } else {
                        return Text(fullText, style: style);
                      }
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding:  EdgeInsets.only(bottom: 10.h),
                  child: Center(
                    child: Image.asset(
                      'resimler/img.png',
                      width: 130.w,
                      height: 40.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
