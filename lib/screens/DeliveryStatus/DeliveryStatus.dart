import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/screens/DeliveryStatus/DeliveryStatusProvider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DeliveryStatusScreen extends StatefulWidget {
  @override
  _DeliveryStatusScreenState createState() => _DeliveryStatusScreenState();
}

class _DeliveryStatusScreenState extends State<DeliveryStatusScreen> {
  DeliveryStatusProvider deliveryStatusProvider;
  int currentStep = 2;
  List appSteps = [
    'Configure',
    'Code',
    'Test',
    'Deploy',
    'Scale',
  ];

  List deliverySteps = [
    'Take your phone',
    'Choose a restaurant',
    'Order the food',
    'Wait for delivery',
    'Pay',

  ];

  //....................

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const currentStep = 3;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(currentStep * 120.0);
    });


    return ChangeNotifierProvider<DeliveryStatusProvider>(
      create: (_) => DeliveryStatusProvider()..setView(context),
      child: Consumer<DeliveryStatusProvider>(builder: (context, model, child) {
        deliveryStatusProvider = model;
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.arrow_back,
                color: textColor,
              ),
              title: Text(
                'Delivery status',
                style: TextStyle(color: textColor, fontSize: 18),
              )),
          backgroundColor: bgColor,
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                constraints: const BoxConstraints(maxHeight: 120),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.blue),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: appSteps.length,
                  itemBuilder: (BuildContext context, int index) {
                    var beforeLineStyle = const LineStyle(
                      thickness: 20,
                      color: Color(0xFFD4D4D4),
                    );

                    LineStyle afterLineStyle;
                    if (index <= currentStep) {
                      beforeLineStyle = const LineStyle(
                        thickness: 20,
                        color: Color(0xFF9F92E2),
                      );
                    }

                    if (index == currentStep) {
                      afterLineStyle = const LineStyle(
                        thickness: 20,
                        color: Color(0xFFD4D4D4),
                      );
                    }

                    final isFirst = index == 0;
                    final isLast = index == appSteps.length - 1;
                    var indicatorX = 0.5;
                    if (isFirst) {
                      indicatorX = 0.3;
                    } else if (isLast) {
                      indicatorX = 0.7;
                    }

                    return TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.manual,
                      lineXY: 0.8,
                      isFirst: isFirst,
                      isLast: isLast,
                      beforeLineStyle: beforeLineStyle,
                      afterLineStyle: afterLineStyle,
                      hasIndicator: index <= currentStep || isLast,
                      indicatorStyle: IndicatorStyle(
                        width: 20,
                        height: 20,
                        indicatorXY: indicatorX,
                        color: const Color(0xFFD4D4D4),
                        indicator: index <= currentStep ? const _IndicatorApp() : null,
                      ),
                      startChild: Container(
                        constraints: const BoxConstraints(minWidth: 120),
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/horizontal/$index.png',
                              height: 40,
                              color: primaryColor,
                            ),
                            SizedBox(width: 8),
                            Text(
                              appSteps[index],
                              style: TextStyle(color: primaryColor),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              //......................
              Container(
                margin: const EdgeInsets.all(8),
                constraints: const BoxConstraints(maxHeight: 210),
                color: const Color(0xFF5D6173),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: deliverySteps.length,
                  itemBuilder: (BuildContext context, int index) {
                    final step = deliverySteps[index];
                    var indicatorSize = 30.0;
                    var beforeLineStyle = LineStyle(
                      color: Colors.white.withOpacity(0.8),
                    );

                    _DeliveryStatus status;
                    LineStyle afterLineStyle;
                    if (index < currentStep) {
                      status = _DeliveryStatus.done;
                    } else if (index > currentStep) {
                      status = _DeliveryStatus.todo;
                      indicatorSize = 20;
                      beforeLineStyle = const LineStyle(color: Color(0xFF747888));
                    } else {
                      afterLineStyle = const LineStyle(color: Color(0xFF747888));
                      status = _DeliveryStatus.doing;
                    }

                    return TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.manual,
                      lineXY: 0.6,
                      isFirst: index == 0,
                      isLast: index == deliverySteps.length - 1,
                      beforeLineStyle: beforeLineStyle,
                      afterLineStyle: afterLineStyle,
                      indicatorStyle: IndicatorStyle(
                        width: indicatorSize,
                        height: indicatorSize,
                        indicator: _IndicatorDelivery(status: status),
                      ),
                      startChild: _StartChildDelivery(index: index),
                      endChild: _EndChildDelivery(
                        text: step,
                        current: index == currentStep,
                      ),
                    );
                  },
                ),
              )

            ],
          ),
        );
      }),
    );
  }
}

enum _DeliveryStatus { done, doing, todo }

class _StartChildDelivery extends StatelessWidget {
  const _StartChildDelivery({Key key, this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset('assets/images/horizontal/$index.png', height: 64),
      ),
    );
  }
}

class _EndChildDelivery extends StatelessWidget {
  const _EndChildDelivery({
    Key key,
    @required this.text,
    @required this.current,
  }) : super(key: key);

  final String text;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 150),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sniglet(
                    fontSize: 16,
                    color: current ? const Color(0xFF2ACA8E) : Colors.white,
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

class _IndicatorDelivery extends StatelessWidget {
  const _IndicatorDelivery({Key key, this.status}) : super(key: key);

  final _DeliveryStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case _DeliveryStatus.done:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Center(
            child: Icon(Icons.check, color: Color(0xFF5D6173)),
          ),
        );
      case _DeliveryStatus.doing:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2ACA8E),
          ),
          child: const Center(
            child: SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        );
      case _DeliveryStatus.todo:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF747888),
          ),
          child: Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF5D6173),
              ),
            ),
          ),
        );
    }
    return Container();
  }
}

class _IndicatorApp extends StatelessWidget {
  const _IndicatorApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
      ),
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
