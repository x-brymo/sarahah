import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;
  final String imageUrl;

  UserModel(
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.address,
    this.imageUrl,
  );
  
  @override
  List<Object> get props {
    return [
      name,
      email,
      password,
      phoneNumber,
      address,
      imageUrl,
    ];
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? address,
    String? imageUrl,
  }) {
    return UserModel(
      name ?? this.name,
      email ?? this.email,
      password ?? this.password,
      phoneNumber ?? this.phoneNumber,
      address ?? this.address,
      imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'address': address,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['name'] ?? '',
      map['email'] ?? '',
      map['password'] ?? '',
      map['phoneNumber'] ?? '',
      map['address'] ?? '',
      map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, password: $password, phoneNumber: $phoneNumber, address: $address, imageUrl: $imageUrl)';
  }
}
