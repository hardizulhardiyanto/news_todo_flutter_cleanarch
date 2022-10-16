import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/src/component/base_loading.dart';

import '../../../../../injector.dart';
import '../../../../core/response_classify.dart';
import '../../../../widget_utilities/index.dart';
import '../../../news/presentation/manager/news_controller.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  State<DashboardBody>createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final NewsController controller = Get.put(NewsController(getNewsUseCases: sl()));

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;

    return Container(
      child: RefreshIndicator(
          displacement: 200,
          strokeWidth: 3,
          color: white,
          backgroundColor: greenDoctor,
          key: _refreshIndicatorKey,
          onRefresh: () async {},
          child: Container(
            height: MediaQuery.of(context).size.height * 0.61,
            padding: const EdgeInsets.only(
                left: 14.0,
                right: 14.0,
                bottom: 12.0
            ),
            child: GetBuilder<NewsController>(
              builder: (value){
                if (value.newsListEverything.status == Status.error) {
                  return Center(
                    child: Text(value.newsListEverything.error!),
                  );
                } else if (value.newsListEverything.status == Status.completed){
                  if (value.newsListEverything.data != null &&
                      value.newsListEverything.data!.articles != null &&
                      value.newsListEverything.data!.articles!.isNotEmpty) {
                    return Stack(
                      children: [
                        ListView.builder(
                          itemCount: value.newsListEverything.data!.articles!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7),
                              child: Card(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: SizedBox(
                                          height: size.height *
                                              ((orientation == Orientation.landscape ? 0.25 : 0.15)),
                                          width: size.width * 0.3,
                                          child: value.newsListEverything.data!.articles![index].urlToImage ==
                                              null
                                              ? ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              bottomLeft: Radius.circular(4),
                                            ),
                                            child: Image.asset(
                                              "assets/images/news-placeholder.png",
                                            ),
                                          )
                                              : ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4),
                                                bottomLeft: Radius.circular(4)),
                                            child: FadeInImage(
                                              fit: BoxFit.cover,
                                              fadeInDuration: Duration(milliseconds: 200),
                                              fadeOutDuration: Duration(milliseconds: 100),
                                              placeholder: AssetImage(
                                                  "assets/images/news-placeholder.png"),
                                              image: NetworkImage(
                                                value.newsListEverything.data!.articles![index].urlToImage
                                                    .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(right: 7),
                                          height: size.height *
                                              (orientation == Orientation.landscape ? 0.24 : 0.14),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                value.newsListEverything.data!.articles![index].title
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: size.height > 700 ? 15 : 13,
                                                ),
                                                maxLines: 2,
                                              ),
                                              Text(
                                                value.newsListEverything.data!.articles![index].source!.name!
                                                    .length >
                                                    20
                                                    ? value
                                                    .newsListEverything.data!.articles![index].source!.name!
                                                    .substring(0, 20)
                                                    : value
                                                    .newsListEverything.data!.articles![index].source!.name
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: size.height > 700 ? 12 : 10,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                    );
                  } else {
                    return Center(
                      child: Text("There is not any articles now."),
                    );
                  }
                } else {
                  return BaseLoading() ;
                }
              },
            ),  
          )
      ),
    );
  }
}
