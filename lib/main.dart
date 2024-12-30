import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Project',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  static const _black = Colors.black;
  static const _green = Color.fromRGBO(0, 255, 0, 1);
  static const String _fontFamily = "Monospace";
  int pageIndex = 0;
  // final pages = [const Mainpage(), _Editor()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: _black,
          body: Stack(
            children: <Widget>[
              // ignore: sized_box_for_whitespace
              const TabBarView(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                // onPageChanged: (value) => pageIndex = value,
                children: [Mainpage(), EditorTab()],
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: _black,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(0, 0, 0, 0),
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(0, 5))
                      ]),
                  child: customBar(context),
                ),
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: _black,
            elevation: 1,
            shadowColor: _black,
            surfaceTintColor: _black,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: _green, borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(bottom: 20, left: 20, top: 150),
                  child: const Text(
                    "Useless Drawer",
                    style: TextStyle(color: _black, fontSize: 40, fontFamily: _fontFamily),
                  ),
                ),
              ],
            ),
          ),
          drawerEdgeDragWidth: 100,
        ));
  }

  Container customBar(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 1),
          borderRadius: BorderRadius.circular(30),
          border:
              Border.all(color: Color.fromRGBO(0, 0, 0, 1), width: 0, style: BorderStyle.solid)),
      child: TabBar(
        dividerHeight: 0,
        dividerColor: _black,
        indicator: BoxDecoration(
            color: const Color.fromARGB(66, 0, 255, 0), borderRadius: BorderRadius.circular(30)),
        automaticIndicatorColorAdjustment: false,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: _green,
        indicatorPadding: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(10),
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        tabs: const [
          Tab(
              icon: Icon(
            Icons.home_outlined,
            color: _green,
          )),
          Tab(
              icon: Icon(
            Icons.edit_note_sharp,
            color: _green,
          )),
          Tab(
              icon: Icon(
            Icons.format_paint_rounded,
            color: _green,
          )),
          Tab(
              icon: Icon(
            Icons.settings,
            color: _green,
          )),
        ],
      ),
    );
  }

  // Route _createRoute() {
  //   return PageRouteBuilder(
  //       pageBuilder: (context, animation, secondAnimation) => pages[pageIndex],
  //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //         var begin = const Offset(1, 0);
  //         var end = Offset.zero;
  //         var curve = Curves.ease;

  //         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //         return SlideTransition(
  //           position: animation.drive(tween),
  //         );
  //       });
  // }
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});
  static const _black = Colors.black;
  static const _green = Color.fromRGBO(0, 255, 0, 1);
  static const String _fontFamily = "Monospace";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      _black,
                      // Colors.grey,
                      Color.fromRGBO(10, 10, 10, 1)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(0)),
                child: Container(
                  margin: const EdgeInsets.only(top: 200, left: 20),
                  child: const Text(
                    "The Project is an simple Text Editor .",
                    style: TextStyle(color: _green, fontSize: 22, fontFamily: _fontFamily),
                  ),
                ))),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 300,
          child: Container(
            margin: const EdgeInsets.only(top: 0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [_black, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(30),
              // boxShadow: const [
              // BoxShadow(
              // color: _black, spreadRadius: 15, blurRadius: 20, offset: Offset(0, 50))
              // ]
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: ListView(
                  shrinkWrap: true,
                  // gridDelegate:
                  // const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                  children: const [
                    Text(
                      "Hi there,",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 35, color: _green, fontFamily: _fontFamily),
                    ),
                    Text(
                      "Welcome to the project",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: _fontFamily),
                    )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}

class EditorTab extends StatefulWidget {
  const EditorTab({super.key});

  @override
  Editor createState() => Editor();
}

class Editor extends State<EditorTab> {
  static const _green = Color.fromRGBO(0, 255, 0, 1);
  final TextEditingController _controller = TextEditingController();
  int lineCount = 1;
  final ScrollController _scrollController = ScrollController();
  final ScrollController _textScrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  static const double _fontsize = 16;
  // static bool _barVisible = true;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(handleFocusChange);
    _controller.addListener(_count);
    _textScrollController.addListener(() {
      _scrollController.jumpTo(_textScrollController.offset);
    });
  }

  void handleFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        // _barVisible = false;
      });
    } else {
      setState(() {
        _focusNode.descendantsAreFocusable = false;
        // _barVisible = true;
      });
    }
  }

  void offsetFocus() {
    // double offset = _scrollController.offset;
  }

  void _count() {
    setState(() {
      lineCount = '\n'.allMatches(_controller.text).length + 1;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_count);
    _controller.dispose();
    _scrollController.dispose();
    _textScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        width: 40,
        padding: const EdgeInsets.only(bottom: 70),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Mainpage._black,
            // Colors.grey,
            Color.fromRGBO(10, 10, 10, 1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: lineCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: _green,
                  fontSize: _fontsize,
                  height: 1.2,
                  fontFamily: Mainpage._fontFamily,
                ),
              ),
            );
          },
        ),
      ),
      Expanded(
          child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 2,
              padding: const EdgeInsets.only(top: 35, bottom: 70),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color.fromRGBO(10, 10, 10, 1), Colors.black],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
              child: TextField(
                // textAlignVertical: TextAlignVertical(y: -1),
                controller: _controller,
                maxLength: null,
                minLines: null,
                maxLines: null,
                cursorHeight: 18,
                cursorWidth: 10,
                cursorColor: _green,
                keyboardType: TextInputType.multiline,
                enableSuggestions: true,
                focusNode: _focusNode,
                magnifierConfiguration:
                    const TextMagnifierConfiguration(shouldDisplayHandlesInMagnifier: true),
                decoration: const InputDecoration(
                    focusColor: Colors.grey,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0),
                    hintStyle: TextStyle(color: Color.fromARGB(171, 0, 106, 4)),
                    hintText: "Enter your Text here..."),
                style: const TextStyle(
                  color: _green,
                  fontSize: _fontsize,
                  height: 1.2,
                  letterSpacing: 2,
                  fontFamily: "Monospace",
                ),
                expands: true,
                scrollController: _textScrollController,
              )))
    ]);
  }
}
