import 'package:flutter/material.dart';

class Line extends StatelessWidget{
  const Line(this._text,this._backgroundColor,this._navigationFunction):assert(_text!=null),assert(_backgroundColor!=null),assert(_navigationFunction!=null);
  final Widget _text;
  final Color _backgroundColor;
  final Function _navigationFunction;
  @override
  Widget build(BuildContext context) {
    return Padding
    (
          padding: EdgeInsets.all(8.0),
          child:Container
          (
              width: 220,
              height: 100,
              decoration: new BoxDecoration
                (
                  color: this._backgroundColor,
                  borderRadius: new BorderRadius.only
                    (
                      bottomLeft: const  Radius.circular(40.0),
                      bottomRight: const  Radius.circular(40.0),
                      topLeft:  const  Radius.circular(40.0),
                      topRight: const  Radius.circular(40.0)
                    )
                ),
                child:RaisedButton
                (
                  highlightColor: this._backgroundColor,
                  splashColor: this._backgroundColor,
                  color: this._backgroundColor,
                  child: this._text,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    _navigationFunction(context);
                  },
                ),
          ),
    );
  }
}