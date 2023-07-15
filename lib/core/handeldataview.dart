import 'package:flutter/material.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';

class HandelHomedataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandelHomedataview(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 175.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black.withOpacity(.15),
                            spreadRadius: 0.08,
                            offset: const Offset(0, 4),
                          )
                        ],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(12)),
                    /////////////////
                  ),
                ),
              );
            },
          )

        //     LoadingAnimationWidget.discreteCircle(
        //  color: const Color.fromRGBO(226, 33, 38, 1),
        //            secondRingColor:   const Color.fromARGB(255, 192, 192, 192),
        //     thirdRingColor: Colors.white,
        //       size: 50,
        //     ),
        : statusRequest == StatusRequest.noInternet
            ? const Center(
                child: Image(
                    image: AssetImage(
                  'images/404 errorr-bro.png',
                )),
              )
            : statusRequest == StatusRequest.nodata
                ? const Center(
                    child: Image(
                        image: AssetImage(
                      'images/404 errorr-bro.png',
                    )),
                  )
                : statusRequest == StatusRequest.serverfailure
                    ? const Center(child: Text("serverfailure"))
                    : widget;
  }
}

class HandeldataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandeldataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: const Color.fromRGBO(226, 33, 38, 1),
              secondRingColor: const Color.fromARGB(255, 192, 192, 192),
              thirdRingColor: Colors.white,
              size: 50,
            ),
          )
        : widget;
  }
}

class HandelSliderdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandelSliderdataview(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?
        // ListView.builder(
        //                         scrollDirection: Axis.horizontal,

        //   itemCount: 1,
        //                 itemBuilder: (context, index) {
        //                   return
        Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                width: 500,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black.withOpacity(.15),
                        spreadRadius: 0.08,
                        offset: const Offset(0, 4),
                      )
                    ],
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12)),
                /////////////////
              ),
            ),
          )
        : widget;
  }
}

class Handeldataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handeldataview(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              Center(
                child: LoadingAnimationWidget.discreteCircle(
                  color: const Color.fromRGBO(226, 33, 38, 1),
                  secondRingColor: const Color.fromARGB(255, 192, 192, 192),
                  thirdRingColor: Colors.white,
                  size: 50,
                ),
              )
            ],
          )
        : statusRequest == StatusRequest.noInternet
            ? const Center(
                child: Image(
                    image: AssetImage(
                  'images/404 errorr-bro.png',
                )),
              )
            : statusRequest == StatusRequest.nodata
                ? const Center(
                    child: Image(
                        image: AssetImage(
                      'images/404 errorr-bro.png',
                    )),
                  )
                : statusRequest == StatusRequest.serverfailure
                    ? const Center(child: Text("serverfailure"))
                    : widget;
  }
}

class HandelOrdersdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandelOrdersdataview(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 220,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black.withOpacity(.15),
                            spreadRadius: 0.08,
                            offset: const Offset(0, 4),
                          )
                        ],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24)),
                    /////////////////
                  ),
                ),
              );
            })
        : statusRequest == StatusRequest.noInternet
            ? const Center(
                child: Image(
                    image: AssetImage(
                  'images/404 errorr-bro.png',
                )),
              )
            : statusRequest == StatusRequest.nodata
                ? const Center(
                    child: Image(
                        image: AssetImage(
                      'images/404 errorr-bro.png',
                    )),
                  )
                : statusRequest == StatusRequest.serverfailure
                    ? const Center(child: Text("serverfailure"))
                    : widget;
  }
}

class HandelOrderDetailsdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandelOrderDetailsdataview(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.66,
                height: 420,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black.withOpacity(.15),
                        spreadRadius: 0.08,
                        offset: const Offset(0, 4),
                      )
                    ],
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(24)),
                /////////////////
              ),
            ),
          )
        : statusRequest == StatusRequest.noInternet
            ? const Center(
                child: Image(
                    image: AssetImage(
                  'images/404 errorr-bro.png',
                )),
              )
            : statusRequest == StatusRequest.nodata
                ? const Center(
                    child: Image(
                        image: AssetImage(
                      'images/404 errorr-bro.png',
                    )),
                  )
                : statusRequest == StatusRequest.serverfailure
                    ? const Center(child: Text("serverfailure"))
                    : widget;
  }
}

class HandelPrductsdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandelPrductsdataview(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.03,
              mainAxisExtent: 260,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 175.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black.withOpacity(.15),
                            spreadRadius: 0.08,
                            offset: const Offset(0, 4),
                          )
                        ],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(12)),
                    /////////////////
                  ),
                ),
              );
            })
        : statusRequest == StatusRequest.noInternet
            ? const Center(
                child: Image(
                    image: AssetImage(
                  'images/404 errorr-bro.png',
                )),
              )
            : statusRequest == StatusRequest.nodata
                ? const Center(
                    child: Image(
                        image: AssetImage(
                      'images/404 errorr-bro.png',
                    )),
                  )
                : statusRequest == StatusRequest.serverfailure
                    ? const Center(child: Text("serverfailure"))
                    : widget;
  }
}

class HandelBottomBar extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandelBottomBar(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 1,
          )
        : widget;
  }
}

class HandelBottomcheckout extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandelBottomcheckout(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            color: Colors.white,
          )
        : widget;
  }
}
