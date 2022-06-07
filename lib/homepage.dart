import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> l1 = ["", "", "", "", "", "", "", "", ""];

  bool iscross = true;
  void play(int i) {
    if (l1[i] == "") {
      if (iscross) {
        setState(() {
          l1[i] = "X";
        });
        iscross = false;
      } else {
        setState(() {
          l1[i] = "O";
        });
        iscross = true;
      }
      checkwin();
    }
  }

  reset() {
    setState(() {
      l1 = ["", "", "", "", "", "", "", "", ""];
    });
  }

  _showWinDialog(String j) {
    if (j == "Match Draw") {
      showDialog(
          context: context,
          builder: (context) {
            return (AlertDialog(
              title: Text("Result"),
              content: Text("${j}"),
              actions: [
                MaterialButton(
                  onPressed: (() {
                    reset();
                    Navigator.pop(context);
                  }),
                  child: Text("Play again"),
                )
              ],
            ));
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return (AlertDialog(
              title: Text("Congrats!!"),
              content: Text("Player ${j} wins"),
              actions: [
                MaterialButton(
                  onPressed: (() {
                    reset();
                    Navigator.pop(context);
                  }),
                  child: Text("Play again"),
                )
              ],
            ));
          });
    }
  }

  void checkwin() {
    if (l1[0] == l1[1] && l1[0] == l1[2] && l1[0] != '') {
      _showWinDialog(l1[0]);
    }

    // checks 2nd row
    else if (l1[3] == l1[4] && l1[3] == l1[5] && l1[3] != '') {
      _showWinDialog(l1[3]);
    }

    // checks 3rd row
    else if (l1[6] == l1[7] && l1[6] == l1[8] && l1[6] != '') {
      _showWinDialog(l1[6]);
    }

    // checks 1st column
    else if (l1[0] == l1[3] && l1[0] == l1[6] && l1[0] != '') {
      _showWinDialog(l1[0]);
    }

    // checks 2nd column
    else if (l1[1] == l1[4] && l1[1] == l1[7] && l1[1] != '') {
      _showWinDialog(l1[1]);
    }

    // checks 3rd column
    else if (l1[2] == l1[5] && l1[2] == l1[8] && l1[2] != '') {
      _showWinDialog(l1[2]);
    }

    // checks diagonal
    else if (l1[6] == l1[4] && l1[6] == l1[2] && l1[6] != '') {
      _showWinDialog(l1[6]);
    }

    // checks diagonal
    else if (l1[0] == l1[4] && l1[0] == l1[8] && l1[0] != '') {
      _showWinDialog(l1[0]);
      // } else if (filledBoxes == 9) {
      //   _showDrawDialog();
      // }
    } else if (!l1.contains("")) {
      _showWinDialog("Match Draw");
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
          title: Text("TIC TAC TOE", textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.pink),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(

                margin: EdgeInsets.only(bottom: 20,top: 20),
                height: 30,
                width: 150,
                child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "TIC TAC TOE",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      )),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      )

              )),
          Expanded(
            flex: 10,
            child: Center(
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => play(index),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Container(
                            child: Center(
                                child: Text(
                              l1[index],
                              textDirection: TextDirection.ltr,
                              style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
                            )),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ))),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
              flex: 2,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    reset();
                  },
                  child: Container(
                      height: 50,
                      width: 150,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "RESET",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      )),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      )),
                ),
              )),
        ],
      ),
    ));
  }
}
