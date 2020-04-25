import 'package:ecpv2/Views/ECPV/commercant/commercant_form_file.dart';
import 'package:ecpv2/Views/ECPV/client/client_form_file.dart';
import 'package:flutter/material.dart';
import 'package:ecpv2/Views/ECPV/util/button.dart';
final List<String> _buttonText=const ["Je suis commerçant !","Je suis client !"];
final String _titlePage="Emballé, c'est pesé";

/// The function that is called when main.dart is run.
void main() {
  runApp(Choice());
}

/// Class qui propose le choix entre "Commerçant" et "Client"
/// Les constantes composants le texte sont définies plus haut dans la List "_buttonText"
class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainRoute(_titlePage,_buttonText);
  }
}
class MainRoute extends StatelessWidget{

  /// Permet de créer l'écran (route) principal qui va accueillir la pile de sous-écran.
  const MainRoute(this._titlePage,this._buttonText):assert(_titlePage != null),assert(_buttonText!=null);
  final String _titlePage;
  final List<String> _buttonText;

  /// Fonction qui renvoie une ligne de lignes -> boutons "Je suis commerçant" ou "Je suis client" (voir commentaires dans la fonction Build)
  /// Pour l'instant nous n'avons que deux boutons à l'affichage, j'ai donc evité de faire une boucle pour passer plus facilement en argument les
  /// fonctions de navigation
  List<Widget> _rowBuilder(BuildContext context) {
    List<Widget> _lineList=[];
    _lineList.add(Line(Text(_buttonText[0],style: TextStyle(color: Colors.white,fontSize: 18)),Colors.lightGreen,_navigateToCommercant));
    _lineList.add(Line(Text(_buttonText[1],style: TextStyle(color: Colors.white,fontSize: 18)),Colors.green[700],_navigateToClient));
    return _lineList;
  }

  /// Organisation générale de la page (fond blanc, placement des boutons etc...)
  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
        title: this._titlePage,
        home: Scaffold
        (
          appBar: AppBar
          (
                title: Center(child:Text(this._titlePage,style: TextStyle(fontSize: 30.0,color: Colors.black))),
                elevation: 0.0,
                backgroundColor: Colors.white,
          ),
          body:Center
          (
                child:Column
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _rowBuilder(context) /// CONSTRUCTION DES LIGNES ICI
                )
          ),
          backgroundColor: Colors.white,
        ),
    );
  }

  /// Fonctions de navigation
  ///
  /// Navigation vers l'écran (route) commerçant
  // TODO: Commerçant scaffold
  void _navigateToCommercant(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return FormulaireCommercant();
      },
    ));
  }

  /// Navigation vers l'écran (route) client
  void _navigateToClient(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Formulaire();
      },
    ));
  }
}