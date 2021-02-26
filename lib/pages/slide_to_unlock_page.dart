import 'package:flutter/material.dart';
import 'package:slide_to_do_action_widget/widgets/SlideToUnlockWidget.dart';

class SlideToUnlockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Container()),
            SlideToUnlockWidget(
              callBack: () {
                showAlertDialog(context);
              },
              colorBase: Colors.yellow,
              colorAlDeslizar: Colors.yellow,
              colorFondo: Colors.blue,
              texto: 'Mueve para aumentar el tamaño',
              colorTexto: Colors.yellow,
              iconoBase: Icons.zoom_in,
              iconoAlDeslizar: Icons.zoom_out,
              sizeIconoBase: 27.0,
              sizeIconoAlDeslizar: 27.0,
              sizeTexto: 17,
            ),
            Container(
              height: 10,
            ),
            SlideToUnlockWidget(
              callBack: () {
                showAlertDialog(context);
              },
              colorBase: Colors.grey,
              colorAlDeslizar: Colors.grey,
              colorFondo: Colors.cyan,
              texto: '',
              colorTexto: Colors.grey,
              sizeIconoBase: 27.0,
              sizeIconoAlDeslizar: 27.0,
              sizeTexto: 17,
            ),
            Container(
              height: 10,
            ),
            SlideToUnlockWidget(
              callBack: () {
                showAlertDialog(context);
              },
              colorBase: Colors.white,
              colorAlDeslizar: Colors.white,
              colorFondo: Colors.red,
              texto: 'Desliza para finalizar',
              colorTexto: Colors.white,
              iconoBase: Icons.arrow_forward_rounded,
              iconoAlDeslizar: Icons.arrow_back_rounded,
              sizeIconoBase: 27.0,
              sizeIconoAlDeslizar: 27.0,
              sizeTexto: 25,
            ),
            Container(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
