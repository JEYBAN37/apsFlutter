import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class InfoGeneral {
  final int? id;
  final int typeRegister;
  final int numberRegister;
  final int consent;
  final String departament;
  final String zonalUnit;
  final String municipality;
  final String territory;
  final String microterritory;
  final int nameBranding;
  final String? address;
  final double longitud;
  final double latitud;
  final String? homeLocation;
  final String idFamilia;
  final int estratum;
  final String households;
  final int numFamilies;
  final int people;
  final String basicTeam;
  final String idPrimaryProvider;
  final String pollster;
  final String idFicha;
  final String creationDate;

  InfoGeneral({
    this.id,
    required this.typeRegister,
    required this.numberRegister,
    required this.consent,
    required this.departament,
    required this.zonalUnit,
    required this.municipality,
    required this.territory,
    required this.microterritory,
    required this.nameBranding,
    this.address,
    required this.longitud,
    required this.latitud,
    this.homeLocation,
    required this.idFamilia,
    required this.estratum,
    required this.households,
    required this.numFamilies,
    required this.people,
    required this.basicTeam,
    required this.idPrimaryProvider,
    required this.pollster,
    required this.idFicha,
    required this.creationDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'typeRegister': typeRegister,
      'numberRegister': numberRegister,
      'consent': consent,
      'departament': departament,
      'zonalUnit': zonalUnit,
      'municipality': municipality,
      'territory': territory,
      'microterritory': microterritory,
      'nameBranding': nameBranding,
      'address': address,
      'longitud': longitud,
      'latitud': latitud,
      'homeLocation': homeLocation,
      'idFamilia': idFamilia,
      'estratum': estratum,
      'households': households,
      'numFamilies': numFamilies,
      'people': people,
      'basicTeam': basicTeam,
      'idPrimaryProvider': idPrimaryProvider,
      'pollster': pollster,
      'idFicha': idFicha,
      'creationDate': creationDate,
    };
  }
}