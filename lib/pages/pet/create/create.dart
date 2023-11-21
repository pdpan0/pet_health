import 'package:flutter/material.dart';
import 'package:pet_health/constants/colors.dart';
import 'package:pet_health/models/pet.dart';
import 'package:pet_health/models/breed.dart';
import 'package:pet_health/state/NavigationState.dart';
import 'package:provider/provider.dart';

import '../../../constants/routes.dart';
import '../../../dao/pet_dao.dart';
import '../../../services/pet.service.dart';
import '../list/list.i18n.dart';

class PetFormWidget extends StatefulWidget {
  const PetFormWidget({super.key});

  @override
  State<PetFormWidget> createState() => _PetFormWidgetState();
}

class _PetFormWidgetState extends State<PetFormWidget> {
  PetDao? dao;
  final _formKey = GlobalKey<FormState>();

  // Name Input
  final _nameController = TextEditingController();

  // Breed Input
  Breed? _selectedBreed = Breed.dog;
  void _changeBreed(Breed? breed) {
    setState(() {
      _selectedBreed = breed;
    });
  }

  // Validators
  String? _nameValidator(value) =>
      value == null || value.isEmpty ? nameValidatorError.i18n : null;
  String? _breedValidator(value) =>
      value == null ? breedValidatorError.i18n : null;

  @override
  void initState() {
    super.initState();
    _initializDatabase();
  }

  _initializDatabase() async {
    dao = await PetService.getDAO();
  }

  _createPet(Pet pet) {
    dao?.insertPet(pet);
    Provider.of<NavigationState>(context, listen: false).navigate(1);
    // Navigator.of(context).pushNamed(petList);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 80),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(hintText: namePlaceholder.i18n),
                  controller: _nameController,
                  validator: _nameValidator),
              const SizedBox(height: 18),
              DropdownButtonFormField(
                value: _selectedBreed,
                items: Breed.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                dropdownColor: primary.shade50,
                decoration: InputDecoration(
                  labelText: breedPlaceholder.i18n,
                  prefixIcon: const Icon(Icons.accessibility_new_rounded,
                      color: primary),
                ),
                isExpanded: true,
                onChanged: _changeBreed,
                validator: _breedValidator,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: Text(saveButton.i18n),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final newPet = Pet(null, _nameController.text);
                      _createPet(newPet);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
