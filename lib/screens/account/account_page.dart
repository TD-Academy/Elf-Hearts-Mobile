import 'package:flutter/material.dart';
import 'package:users/services/storage_service.dart';
import '../loading/loading_page.dart';

LocalStorageService storageService = LocalStorageService();

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String userName = '';
  String userCoins = "12398";
  String userHearts = "21365";
  bool isLoading = true;

  Future<void> _readFromStorage() async {
    userName = (await storageService.readData(StorageKey.userName)).toString();
    print(userName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _readFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const LoadingPage();
    } else {
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage("assets/img2.jpg"),
                      fit: BoxFit.fitWidth))),
          SafeArea(
            child: ListView(children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 74.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Card(
                            color: Colors.white,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: .0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 85.0, bottom: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                  vertical: 8.0),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 25.0),
                                        Align(
                                          child: Text('$userName',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      50, 50, 93, 1),
                                                  fontSize: 28.0)),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Text('$userCoins 💲',
                                                    style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            82, 95, 127, 1),
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                const Text("ElfCoins",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            50, 50, 93, 1),
                                                        fontSize: 12.0))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text("$userHearts ❤",
                                                    style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            82, 95, 127, 1),
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                const Text("ElfHearts",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            50, 50, 93, 1),
                                                        fontSize: 12.0))
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 40.0),
                                        const SizedBox(height: 10.0),
                                        const Align(
                                          child: Text("Some Text if needed",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      50, 50, 93, 1),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w200)),
                                        ),
                                        const Divider(
                                          height: 40.0,
                                          thickness: 1.5,
                                          indent: 32.0,
                                          endIndent: 32.0,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 32.0, right: 32.0),
                                          child: Align(
                                            child: Text("More text if needed",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        82, 95, 127, 1),
                                                    fontSize: 17.0,
                                                    fontWeight:
                                                        FontWeight.w200)),
                                          ),
                                        ),
                                        const SizedBox(height: 15.0),
                                        const Align(
                                            child: Text("Show more",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        94, 114, 228, 1.0),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0))),
                                        SizedBox(height: 25.0),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 25.0, left: 25.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                "Album",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,
                                                    color: Color.fromRGBO(
                                                        50, 50, 93, 1.0)),
                                              ),
                                              Text(
                                                "View All",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        94, 114, 228, 1.0),
                                                    fontSize: 13.0,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      FractionalTranslation(
                          translation: Offset(0.0, -0.3),
                          child: Align(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[900],
                              radius: 82.0,
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/img1.jpg"),
                                radius: 80,
                              ),
                              // maxRadius: 200.0,
                            ),
                            alignment: FractionalOffset(0.5, 0.0),
                          ))
                    ]),
                  ],
                ),
              ),
            ]),
          ),
        ]),
      );
    }
  }
}
