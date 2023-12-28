import 'package:apis_test2/api/request_data.dart';
import 'package:apis_test2/providers/news_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/newsModel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context ,WidgetRef ref) {
    final news = ref.watch(newsListProvider);
    return Scaffold(
      body: news.when(
          data: (news){
            return SafeArea(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image:  DecorationImage(
                                image: NetworkImage(
                                  '${news[index].urlToImage}'
                                ),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${news[index].description}',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  '${news[index].publishedAt}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 10,
                )
            );
          }, error: (error , stack){
            print(error.toString());
            print(error.runtimeType);
      }, loading: ()=>Center(child: const CircularProgressIndicator())

      )
    );
  }
}
