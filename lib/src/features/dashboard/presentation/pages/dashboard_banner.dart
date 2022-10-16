import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../injector.dart';
import '../../../../core/response_classify.dart';
import '../../../../widget_utilities/index.dart';
import '../../../news/presentation/manager/news_controller.dart';

class DashboardBanner extends StatefulWidget {
  const DashboardBanner({Key? key}) : super(key: key);

  @override
  State<DashboardBanner>createState() => _DashboardBannerState();
}

class _DashboardBannerState extends State<DashboardBanner> {
  final NewsController controller = Get.put(NewsController(getNewsUseCases: sl()));
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    // return loadingData();
    return GetBuilder<NewsController>(
      builder: (value) {
        if (value.newsList.status == Status.loading){
          return loadingData();
        } else if (value.newsList.status == Status.completed){
          return Column(
            children: <Widget>[
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.20,
                  aspectRatio: 2,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),

                itemCount: value.newsList.data!.articles!.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: value.newsList.data!.articles![index].urlToImage.toString(),
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 32,
                                  child: Shimmer.fromColors(
                                    baseColor: Color(0xffE5E5E6),
                                    highlightColor: Colors.white,
                                    direction: ShimmerDirection.ltr,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: Container(
                                        decoration:
                                        BoxDecoration(color: Color(0xffE5E5E6)),
                                      ),
                                    ),
                                  ),
                                )),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              AppDimens.verticalSpace4,
              Container(
                width: double.infinity,
                height: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(value.newsList.data!.articles!.length, (index) {
                    return Container(
                        width: _current == index ? 8.0 : 5.0,
                        height: _current == index ? 8.0 : 5.0,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                            _current == index ? blueCore : Color(0xffE5E5E6)));
                  }),
                ),
              ),
            ],
          );
          return Container();
        } else {
          return Container();
        }
      },
    );
  }

  Widget loadingData () {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Shimmer.fromColors(
            baseColor: grey_one,
            highlightColor: Colors.white,
            direction: ShimmerDirection.ltr,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                color: blueCore,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
