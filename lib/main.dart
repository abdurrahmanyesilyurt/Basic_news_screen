import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'HaberDetay.dart';  // Doğru paket adı

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
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: child,
      ),
      child: const MyHomePage(title: "Haberler"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> newsData = [
    {
      "title": "Haber Başlığı bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
      "description": "Haber açıklaması burada yer alacakkkkkkkkkkkkkkk.",
      "date": "12 Nisan 2024",
      "imageUrl": "https://via.placeholder.com/150"
    },
    {
      "title": "Haber Başlığı 2",
      "description": "Haber açıklaması burada yer alackkkkkkkkkk.",
      "date": "13 Nisan 2024",
      "imageUrl": "https://via.placeholder.com/150"
    },
    {
      "title": "Haber Başlığı bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
      "description": "Haber açıklaması burada yer alacakkkkkkkkkkkkkkk.",
      "date": "12 Nisan 2024",
      "imageUrl": "https://via.placeholder.com/150"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h, left: 10.w),
            child: Row(
              children: [
                IconButton(
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
                SizedBox(width: 105.w),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Container(
              width: 325.w,
              height: 53.h,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    size: 29.h,
                  ),
                  hintText: '  Haberlerde Ara',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: newsData.length,
              itemBuilder: (context, index) {
                final news = newsData[index];
                return Column(
                  children: [
                    NewsCard(
                      title: news['title']!,
                      description: news['description']!,
                      date: news['date']!,
                      imageUrl: news['imageUrl']!,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        color: Colors.grey,
                        height: 1,
                        width: double.infinity,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom:10.h ),
            child: Image.asset(
              'resimler/img.png',
              width: 150.w,
              height: 30.h,

            ),
          ),
        ],
      ),
    );
  }
}


class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String imageUrl;

  const NewsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HaberDetay()));
        },
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 11.w,right: 10.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Text(
                        description,
                        style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      date,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 10.h,),
                  ],
                ),
              ),
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.w),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

