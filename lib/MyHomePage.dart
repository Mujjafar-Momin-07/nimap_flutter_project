import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:post_project/Models/Post.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Post> getPostApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/207fa131-1ffb-4ea0-9036-5ea3ef8db534'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return Post.fromJson(data);
    } else {
      return Post.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<Post>(
                  future: getPostApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.data!.records!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 400,
                              width: 200,
                              child: Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.hardEdge,
                                fit: StackFit.loose,
                                children: [
                                  Positioned(
                                    child: Container(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data!.data!.records![index].mainImageURL!.length,
                                          itemBuilder: (context, position) {
                                            return Column(
                                              children: [
                                                Container(
                                                    height: MediaQuery.of(context).size.height * .3,
                                                    width: MediaQuery.of(context).size.width *.99,
                                                   child: CachedNetworkImage(
                                                     key:UniqueKey(),
                                            cacheManager:customCasheManager,
                                            imageUrl: snapshot.data!.data!.records![index].mainImageURL!.toString(),
                                            imageBuilder: (context, imageProvider) => Container(
                                            decoration: BoxDecoration(
                                            image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                           ),
                                            ),
                                            ),
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                            ),
                                                )],
                                            );
                                          }),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 200,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: 30,
                                          left: 30,
                                          right: 30,
                                          top: 30),
                                      //margin: EdgeInsets.all(20),
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.cyan[600]),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '\u{20B9}${snapshot.data!.data!.records![index].collectedValue.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'Roboto',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "FUNDED",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '\u{20B9}${snapshot.data!.data!.records![index].totalValue.toString()}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "GOALS",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                calculateDate(
                                                    snapshot
                                                        .data!
                                                        .data!
                                                        .records![index]
                                                        .startDate
                                                        .toString(),
                                                    snapshot.data!.data!
                                                        .records![index].endDate
                                                        .toString()),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "ENDS IN",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                              style: ButtonStyle(
                                                alignment: Alignment.center,
                                                padding:
                                                    MaterialStatePropertyAll(
                                                        EdgeInsets.all(20)),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.blue),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                'PLEDGE',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: -30,
                                    right: 80,
                                    top: 150,
                                    child: Container(
                                      height: 100,
                                      padding: EdgeInsets.only(top: 7),
                                      margin: const EdgeInsets.only(
                                          left: 40, right: 40, bottom: 15),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            trailing: Icon(Icons.favorite,
                                                color: Colors.pink, size: 30),
                                            title: Text(
                                              '${snapshot.data!.data!.records![index].title}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                                '${snapshot.data!.data!.records![index].shortDescription}'),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 270,
                                    right: -20,
                                    top: 150,
                                    child: Container(
                                      height: 100,
                                      child: Center(
                                          child: Text(
                                        "100%",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      margin: const EdgeInsets.only(
                                          left: 40, right: 40, bottom: 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.cyan[800]),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: LoadingAnimationWidget.threeRotatingDots(
                          color: Colors.cyan,
                          size: 50,
                        ),
                      );
                    }
                  }),
            )
          ],
        ));
  }

  static String calculateDate(String startDate, String endDate) {
    List<String> spltstr = startDate.split("/");
    List<String> spltend = endDate.split("/");

    String dateA = spltstr[2] + '-' + spltstr[1] + '-' + spltstr[0];
    String dateB = spltend[2] + '-' + spltend[1] + '-' + spltend[0];

    DateTime dateA1 = DateTime.parse(dateA);
    DateTime dateB1 = DateTime.parse(dateB);

    Duration diff = dateB1.difference(dateA1);
    return diff.inDays.toString();
  }

 static final customCasheManager=CacheManager(
 Config(
   'customCasheKey',
   stalePeriod: Duration(days: 7),
   maxNrOfCacheObjects: 20
 ),
 );


}
