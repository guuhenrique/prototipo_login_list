import 'package:flutter/material.dart';

class ColabModel {
   String _nome;
   String _cargo;
   String _local;
   Icon _icon;

   ColabModel(this._nome, this._cargo, this._local, this._icon);

   String get nome => _nome;

   String get cargo => _cargo;

   String get local => _local;

   Icon get icon => _icon;



}
