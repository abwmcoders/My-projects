import 'package:flutter/material.dart';
import 'package:sports_news/helper/data.dart';
import 'package:sports_news/helper/news.dart';
import 'package:sports_news/model/article_model.dart';
import 'package:sports_news/model/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getnews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Sports",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "App",
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // categories
                    Container(
                      height: 70,
                      color: Colors.black26,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) => CategoryTile(
                              categoryName: categories[index].categoryName,
                              imageUrl: getCategories()[index].imageToUrl)),
                    ),

                    // blog

                    // Container(
                    //   height: 700,
                    //   padding: const EdgeInsets.only(top: 20),
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //       itemCount: articles.length,
                    //       itemBuilder: (context, index) {
                    //         return BlogTile(
                    //           imageUrl: articles[index].urlImage,
                    //           title: articles[index].title,
                    //           desc: articles[index].description,
                    //         );
                    //       }),
                    // )
                  ],
                )),
          ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  const CategoryTile(
      {Key? key, required this.categoryName, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: CachedNetworkImage(
                imageUrl:
                  imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;

  const BlogTile(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(imageUrl),
        Text(title),
        Text(desc),
      ],
    );
  }
}
