import 'dart:convert';

class Citizen {
  final String? birthDate;
  final String? citizenPid;
  final String? dateProvide;
  final String? ethnic;
  final String? fatherName;
  final String? fullName;
  final String? gender;
  final String? homeTown;
  final String? identifyCharacteristics;
  final String? motherName;
  final String? nationality;
  final String? oldIdentify;
  final String? outOfDate;
  final String? regPlaceAddress;
  final String? religion;
  final String? sodBase64;
  final String? photoBase64;
  const Citizen({
    this.birthDate,
    this.citizenPid,
    this.dateProvide,
    this.ethnic,
    this.fatherName,
    this.fullName,
    this.gender,
    this.homeTown,
    this.identifyCharacteristics,
    this.motherName,
    this.nationality,
    this.oldIdentify,
    this.outOfDate,
    this.regPlaceAddress,
    this.religion,
    this.sodBase64,
    this.photoBase64,
  });

  Citizen copyWith({
    String? birthDate,
    String? citizenPid,
    String? dateProvide,
    String? ethnic,
    String? fatherName,
    String? fullName,
    String? gender,
    String? homeTown,
    String? identifyCharacteristics,
    String? motherName,
    String? nationality,
    String? oldIdentify,
    String? outOfDate,
    String? regPlaceAddress,
    String? religion,
    String? sodBase64,
    String? photoBase64,
  }) {
    return Citizen(
      birthDate: birthDate ?? this.birthDate,
      citizenPid: citizenPid ?? this.citizenPid,
      dateProvide: dateProvide ?? this.dateProvide,
      ethnic: ethnic ?? this.ethnic,
      fatherName: fatherName ?? this.fatherName,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      homeTown: homeTown ?? this.homeTown,
      identifyCharacteristics:
          identifyCharacteristics ?? this.identifyCharacteristics,
      motherName: motherName ?? this.motherName,
      nationality: nationality ?? this.nationality,
      oldIdentify: oldIdentify ?? this.oldIdentify,
      outOfDate: outOfDate ?? this.outOfDate,
      regPlaceAddress: regPlaceAddress ?? this.regPlaceAddress,
      religion: religion ?? this.religion,
      sodBase64: sodBase64 ?? this.sodBase64,
      photoBase64: photoBase64 ?? this.photoBase64,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'birthDate': birthDate,
      'citizenPid': citizenPid,
      'dateProvide': dateProvide,
      'ethnic': ethnic,
      'fatherName': fatherName,
      'fullName': fullName,
      'gender': gender,
      'homeTown': homeTown,
      'identifyCharacteristics': identifyCharacteristics,
      'motherName': motherName,
      'nationality': nationality,
      'oldIdentify': oldIdentify,
      'outOfDate': outOfDate,
      'regPlaceAddress': regPlaceAddress,
      'religion': religion,
      'sodBase64': sodBase64,
      'photoBase64': photoBase64,
    };
  }

  factory Citizen.fromMap(Map<String, dynamic> map) {
    return Citizen(
      birthDate: map['birthDate'] != null ? map['birthDate'] as String : null,
      citizenPid:
          map['citizenPid'] != null ? map['citizenPid'] as String : null,
      dateProvide:
          map['dateProvide'] != null ? map['dateProvide'] as String : null,
      ethnic: map['ethnic'] != null ? map['ethnic'] as String : null,
      fatherName:
          map['fatherName'] != null ? map['fatherName'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      homeTown: map['homeTown'] != null ? map['homeTown'] as String : null,
      identifyCharacteristics: map['identifyCharacteristics'] != null
          ? map['identifyCharacteristics'] as String
          : null,
      motherName:
          map['motherName'] != null ? map['motherName'] as String : null,
      nationality:
          map['nationality'] != null ? map['nationality'] as String : null,
      oldIdentify:
          map['oldIdentify'] != null ? map['oldIdentify'] as String : null,
      outOfDate: map['outOfDate'] != null ? map['outOfDate'] as String : null,
      regPlaceAddress: map['regPlaceAddress'] != null
          ? map['regPlaceAddress'] as String
          : null,
      religion: map['religion'] != null ? map['religion'] as String : null,
      sodBase64: map['sodBase64'] != null ? map['sodBase64'] as String : null,
      // photoBase64:
      //     map['photoBase64'] != null ? map['photoBase64'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Citizen.fromJson(String source) =>
      Citizen.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Citizen(birthDate: $birthDate, citizenPid: $citizenPid, dateProvide: $dateProvide, ethnic: $ethnic, fatherName: $fatherName, fullName: $fullName, gender: $gender, homeTown: $homeTown, identifyCharacteristics: $identifyCharacteristics, motherName: $motherName, nationality: $nationality, oldIdentify: $oldIdentify, outOfDate: $outOfDate, regPlaceAddress: $regPlaceAddress, religion: $religion, sodBase64: $sodBase64, photoBase64: $photoBase64)';
  }

  @override
  bool operator ==(covariant Citizen other) {
    if (identical(this, other)) return true;

    return other.birthDate == birthDate &&
        other.citizenPid == citizenPid &&
        other.dateProvide == dateProvide &&
        other.ethnic == ethnic &&
        other.fatherName == fatherName &&
        other.fullName == fullName &&
        other.gender == gender &&
        other.homeTown == homeTown &&
        other.identifyCharacteristics == identifyCharacteristics &&
        other.motherName == motherName &&
        other.nationality == nationality &&
        other.oldIdentify == oldIdentify &&
        other.outOfDate == outOfDate &&
        other.regPlaceAddress == regPlaceAddress &&
        other.religion == religion &&
        other.sodBase64 == sodBase64 &&
        other.photoBase64 == photoBase64;
  }

  @override
  int get hashCode {
    return birthDate.hashCode ^
        citizenPid.hashCode ^
        dateProvide.hashCode ^
        ethnic.hashCode ^
        fatherName.hashCode ^
        fullName.hashCode ^
        gender.hashCode ^
        homeTown.hashCode ^
        identifyCharacteristics.hashCode ^
        motherName.hashCode ^
        nationality.hashCode ^
        oldIdentify.hashCode ^
        outOfDate.hashCode ^
        regPlaceAddress.hashCode ^
        religion.hashCode ^
        sodBase64.hashCode ^
        photoBase64.hashCode;
  }
}
