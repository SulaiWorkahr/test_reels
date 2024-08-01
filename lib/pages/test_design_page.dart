import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../service/test_service.dart';

class TestDesignPage extends StatefulWidget {
  const TestDesignPage({Key? key}) : super(key: key);

  @override
  State<TestDesignPage> createState() => _TestDesignPageState();
}

class _TestDesignPageState extends State<TestDesignPage> {
  final TestService apiService = TestService();
  late Map<String, dynamic> responseData;

    bool isLoading = true;
  String errorLoadingThumbnail = '';

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  Future<void> getJsonData() async {
    try {
      var result = await apiService.getData();
      setState(() {
        responseData = result;
        isLoading = false;
        print(responseData['thumbnail']);
      });
    } catch (error) {
      setState(() {
        errorLoadingThumbnail = 'Error loading thumbnail: $error';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Test Design"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : responseData != null
              ? ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    responseData['thumbnail'],
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      print('Error loading thumbnail: $exception');
                      return Text('Error loading thumbnail');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    responseData['title'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    responseData['description'],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                    items: responseData['images'].map<Widget>((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.network(
                            image,
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
