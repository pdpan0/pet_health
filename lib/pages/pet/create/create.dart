import 'package:flutter/material.dart';
import 'package:pet_health/constants/colors.dart';
import 'package:pet_health/models/pet.dart';
import 'package:pet_health/pages/home/home.dart';
import 'package:provider/provider.dart';

import '../../../constants/routes.dart';
import '../../../dao/pet_dao.dart';
import '../../../services/pet.service.dart';
import '../../../state/navigation.state.dart';
import 'create.i18n.dart';

class PetFormWidget extends StatefulWidget {
  const PetFormWidget({super.key});

  @override
  State<PetFormWidget> createState() => _PetFormWidgetState();
}

class _PetFormWidgetState extends State<PetFormWidget> {
  PetDao? dao;
  late PetHealthApp home;

  final _formKey = GlobalKey<FormState>();

  // Name Input
  final _nameController = TextEditingController();

  // Breed Input
  String _selectedBreed = 'Labrador Retriever';
  void _changeBreed(breed) {
    setState(() {
      _selectedBreed = breed;
    });
  }

  // List of dog breeds
  List<String> dogBreeds = [
    'Labrador Retriever',
    'German Shepherd',
    'Golden Retriever',
    'Bulldog',
    'Beagle',
  ];

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

  _createPet(Pet pet, BuildContext context) {
    dao?.insertPet(pet);
    ScaffoldMessenger.of(context)
        .showSnackBar(_getSnackBar(Text(createWithSuccess.i18n)));
    Provider.of<NavigationState>(context, listen: false).navigate(1);
    //Navigator.pushReplacementNamed(context, home.currentPage);
  }

  SnackBar _getSnackBar(Text message) {
    return SnackBar(content: message);
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
                items: dogBreeds
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
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
                      final newPet =
                          Pet(null, _nameController.text, _selectedBreed);
                      _createPet(newPet, context);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
