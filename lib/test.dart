import 'dart:ui';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final ScrollController _scrollController = ScrollController();
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  double _scrollPercent = 0.0;
  double _scrollExtent = 0.2;
  bool show = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NotificationListener<DraggableScrollableNotification>(
        onNotification: ((notification) {
          setState(() {
            _scrollExtent = notification.extent;
            _scrollPercent = 1.65 * notification.extent - 0.32;
          });

          return true;
        }),
        child: Stack(
          children: [
            SingleChildScrollView(
              reverse: true,
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    child: BackdropFilter(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Opacity(
                            opacity: _scrollExtent > 0.75
                                ? 0
                                : 1 - (_scrollExtent - 0.2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MaterialButton(
                                  minWidth: 10,
                                  color: Colors.green.shade600,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: const Text(
                                      'ON SALE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Eiffel Tower',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Paris, France',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                )
                              ],
                            ),
                          ),
                        ),
                        filter: ImageFilter.blur(
                            sigmaX: 2 * (_scrollPercent),
                            sigmaY: 2 * (_scrollPercent))),
                    height: size.height * 0.8,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/eiffel.jpeg',
                            ),
                            fit: BoxFit.fill)),
                  ),
                  AnimatedContainer(
                    duration: Duration(microseconds: 100),
                    height: size.height * (_scrollExtent - 0.1),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DraggableScrollableSheet(
                  controller: _draggableScrollableController,
                  initialChildSize: 0.25,
                  maxChildSize: 0.85,
                  minChildSize: 0.25,
                  expand: false,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: ListView(
                            physics: const BouncingScrollPhysics(
                                parent: ClampingScrollPhysics()),
                            controller: scrollController,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  // controller: scrollController,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    cards(),
                                    cards(),
                                    cards(),
                                    cards(),
                                    cards(),
                                    cards(),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      width: size.width * 0.9,
                                      child: Text(
                                        'Eiffel Tower, French Tour Eiffel, Parisian landmark that is also a technological masterpiece in building-construction history. When the French government was organizing the International Exposition ',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 14),
                                      )),
                                  Text(
                                    'READ MORE',
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple.shade400,
                                        fontSize: 15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      child: Center(
                                        child: Icon(
                                          Icons.play_circle_outline_rounded,
                                          color: Colors.white.withOpacity(0.7),
                                          size: 70,
                                        ),
                                      ),
                                      height: 170,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                              'assets/images/effiel.jpeg',
                                            ),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Top Sights',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade400,
                                            fontSize: 25),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                            height: 100,
                                            width: 160,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/effiel.jpeg',
                                                  ),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Parisian landmark',
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.visible,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade400,
                                                  fontSize: 16),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              width: size.width * 0.4,
                                              child: Text(
                                                'Eiffel Tower, French Tour Eiffel, Parisian landmark that is also a technological masterpiece in',
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey.shade400,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 5,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                            size: 30,
                          ),
                          Opacity(
                            opacity: _scrollExtent > 0.8
                                ? 1
                                : _scrollExtent < 0.3
                                    ? 0
                                    : (_scrollExtent - 0.12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Eiffel Tower',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Paris, France',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.favorite_outline_rounded,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _scrollExtent > 0.7 ? 0 : 60,
                  width: 60,
                  child: const Center(
                    child: Icon(
                      Icons.airplanemode_active,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple.shade900),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 0),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 60,
                  onEnd: () {
                    show = show ? false : true;
                    setState(() {});
                  },
                  width: size.width * 0.9,
                  child: _scrollExtent > 0.6
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              const Icon(
                                Icons.airplanemode_active,
                                color: Colors.white,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'SEARCH FLIGHTS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.green.shade600),
                                child: const Text(
                                  'ON SALE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ])
                      : Container(),
                  decoration: _scrollExtent > 0.7
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.deepPurple.shade900)
                      : null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget cards() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 120,
        width: 110,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/effiel.jpeg',
              ),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
