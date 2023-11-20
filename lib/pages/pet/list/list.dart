import 'package:flutter/material.dart';
import 'package:pet_health/models/pet.dart';

import '../../../dao/pet_dao.dart';
import '../../../services/pet.service.dart';
import '../create/create.i18n.dart';

class PetsListWidget extends StatefulWidget {
  const PetsListWidget({super.key});

  @override
  State<PetsListWidget> createState() => _PetsListWidgetState();
}

class _PetsListWidgetState extends State<PetsListWidget> {
  PetDao? dao;
  List<Pet> pets = [];

  @override
  void initState() {
    super.initState();
    _initializDatabase();
  }

  _initializDatabase() async {
    dao = await PetService.getDAO();

    await _findAllPets();
  }

  _findAllPets() async {
    if (dao != null) {
      final result = await dao!.findAllPets();
      setState(() {
        pets = result;
      });
    }
  }

  _deletePet(Pet pet) {
    if (dao != null) {
      dao!.deletePet(pet);
      ScaffoldMessenger.of(context)
          .showSnackBar(_getSnackBar(Text(createWithSuccess.i18n)));
      _findAllPets();
    }
  }

  SnackBar _getSnackBar(Text message) {
    return SnackBar(content: message);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 80),
      child: ListView.builder(
          itemBuilder: (context, index) => _buildItem(index),
          itemCount: pets.length),
    );
  }

  Widget _buildItem(index) {
    Pet pet = pets[index];
    return Card(
      child: ListTile(
        leading: Text(pet.id != null ? pet.id!.toString() : ""),
        title: Text(pet.name),
        subtitle: Text(pet.name),
        trailing: const Icon(Icons.arrow_right_alt_outlined),
        onTap: () {
          Navigator.pushNamed(context, pet.id?.toString() ?? "");
        },
        onLongPress: () {
          _deletePet(pet);
        },
      ),
    );
  }
}
