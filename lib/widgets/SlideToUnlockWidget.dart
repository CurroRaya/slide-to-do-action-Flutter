import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideToUnlockWidget extends StatelessWidget {
  final Function callBack;
  final Color colorBase;
  final Color colorAlDeslizar;
  final Color colorFondo;
  final Color colorTexto;
  final String texto;
  final IconData iconoAlDeslizar;
  final IconData iconoBase;
  final double sizeIconoBase;
  final double sizeIconoAlDeslizar;
  final double sizeTexto;

  SlideToUnlockWidget(
      {@required this.callBack,
      @required this.texto,
      @required this.colorTexto,
      @required this.sizeTexto,
      this.colorAlDeslizar = Colors.blue,
      this.colorBase = Colors.blue,
      this.colorFondo = Colors.white,
      this.iconoAlDeslizar = Icons.keyboard_arrow_left_rounded,
      this.iconoBase = Icons.keyboard_arrow_right_rounded,
      this.sizeIconoBase = 30.0,
      this.sizeIconoAlDeslizar = 30.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideToUnlockModel(),
      child: Container(
        width: double.infinity,
        height: 80,
        child: Builder(builder: (BuildContext context) {
          Provider.of<_SlideToUnlockModel>(context).callBack = this.callBack;
          Provider.of<_SlideToUnlockModel>(context).colorAlDeslizar =
              this.colorAlDeslizar;
          Provider.of<_SlideToUnlockModel>(context).colorBase = this.colorBase;
          Provider.of<_SlideToUnlockModel>(context).colorFondo =
              this.colorFondo;
          Provider.of<_SlideToUnlockModel>(context).colorTexto =
              this.colorTexto;
          Provider.of<_SlideToUnlockModel>(context).texto = this.texto;
          Provider.of<_SlideToUnlockModel>(context).iconoBase = this.iconoBase;
          Provider.of<_SlideToUnlockModel>(context).iconoAlDeslizar =
              this.iconoAlDeslizar;
          Provider.of<_SlideToUnlockModel>(context).sizeIconoBase =
              this.sizeIconoBase;
          Provider.of<_SlideToUnlockModel>(context).sizeIconoAlDeslizar =
              this.sizeIconoAlDeslizar;
          Provider.of<_SlideToUnlockModel>(context).sizeTexto = this.sizeTexto;

          return Stack(children: [
            _Contenedor(),
            _Slide(),
            _Destino(),
          ]);
        }),
      ),
    );
  }
}

class _Destino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function callback = Provider.of<_SlideToUnlockModel>(context).callBack;

    return Align(
      alignment: Alignment.topRight,
      child: DragTarget(
        builder: (context, List<String> candidateData, rejectedData) {
          return Padding(
            padding: EdgeInsets.only(top: 25, right: 25),
            child: Container(
              width: 30,
              height: 30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60)),
            ),
          );
        },
        onWillAccept: (data) {
          callback();
          return true;
        },
        onAccept: (data) {},
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sTUModel = Provider.of<_SlideToUnlockModel>(context);

    return Draggable(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 20),
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            sTUModel.iconoBase,
            size: sTUModel.sizeIconoBase,
          ),
          decoration: BoxDecoration(
              color: sTUModel.colorAlDeslizar,
              borderRadius: BorderRadius.circular(60),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 0,
                )
              ]),
        ),
      ),
      axis: Axis.horizontal,
      data: "prueba",
      feedback: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 20),
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            sTUModel.iconoAlDeslizar,
            size: sTUModel.sizeIconoAlDeslizar,
          ),
          decoration: BoxDecoration(
              color: sTUModel.colorBase,
              borderRadius: BorderRadius.circular(60),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 0,
                )
              ]),
        ),
      ),
      childWhenDragging: Container(),
    );
  }
}

class _Contenedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sTUModel = Provider.of<_SlideToUnlockModel>(context);

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: double.infinity,
        height: 80,
        child: Center(
            child: Text(
          sTUModel.texto,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: sTUModel.colorTexto,
              fontSize: sTUModel.sizeTexto,
              fontStyle: FontStyle.italic),
        )),
        decoration: BoxDecoration(
            color: sTUModel.colorFondo,
            borderRadius: BorderRadius.circular(70),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 1,
              )
            ]),
      ),
    );
  }
}

class _SlideToUnlockModel with ChangeNotifier {
  Function _callBack;
  String _texto;
  Color _colorAlDeslizar = Colors.blue;
  Color _colorBase = Colors.blue;
  Color _colorFondo = Colors.white;
  Color _colorTexto = Colors.black;
  IconData _iconoAlDeslizar = Icons.keyboard_arrow_left_rounded;
  IconData _iconoBase = Icons.keyboard_arrow_right_rounded;
  double _sizeIconoBase = 30.0;
  double _sizeIconoAlDeslizar = 30.0;
  double _sizeTexto = 20.0;

  Function get callBack => this._callBack;
  set callBack(Function callBack) {
    this._callBack = callBack;
  }

  Color get colorAlDeslizar => this._colorAlDeslizar;
  set colorAlDeslizar(Color color) {
    this._colorAlDeslizar = color;
  }

  Color get colorBase => this._colorBase;
  set colorBase(Color color) {
    this._colorBase = color;
  }

  Color get colorFondo => this._colorFondo;
  set colorFondo(Color color) {
    this._colorFondo = color;
  }

  Color get colorTexto => this._colorTexto;
  set colorTexto(Color color) {
    this._colorTexto = color;
  }

  String get texto => this._texto;
  set texto(String valor) {
    this._texto = valor;
  }

  IconData get iconoAlDeslizar => this._iconoAlDeslizar;
  set iconoAlDeslizar(IconData icon) {
    this._iconoAlDeslizar = icon;
  }

  IconData get iconoBase => this._iconoBase;
  set iconoBase(IconData icon) {
    this._iconoBase = icon;
  }

  double get sizeIconoBase => this._sizeIconoBase;
  set sizeIconoBase(double size) {
    this._sizeIconoBase = size;
  }

  double get sizeIconoAlDeslizar => this._sizeIconoAlDeslizar;
  set sizeIconoAlDeslizar(double size) {
    this._sizeIconoAlDeslizar = size;
  }

  double get sizeTexto => this._sizeTexto;
  set sizeTexto(double size) {
    this._sizeTexto = size;
  }
}
