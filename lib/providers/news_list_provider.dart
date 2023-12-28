import 'package:apis_test2/model/newsModel.dart';
import 'package:apis_test2/providers/api_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsListProvider = FutureProvider<List<NewsModle>>((ref) async{
  return ref.watch(apiServiceProvider).getData();
}

);