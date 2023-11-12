import 'package:flutter/material.dart';
import 'package:pet_health/constants/colors.dart';
import 'package:pet_health/floor/dao/pet_dao.dart';
import 'package:pet_health/floor/database/app_database.dart';
import 'package:pet_health/floor/services/pet_service.dart';
import 'package:pet_health/models/pet.dart';
import 'package:pet_health/models/race.dart';
import 'package:pet_health/pages/pet_form/pet_form.i18n.dart';

class PetFormWidget extends StatefulWidget {
  const PetFormWidget({super.key});

  @override
  State<PetFormWidget> createState() => _PetFormWidgetState();
}

class _PetFormWidgetState extends State<PetFormWidget> {
  final _formKey = GlobalKey<FormState>();

  // Name Input
  final _nameController = TextEditingController();

  // Race Input
  Race? _selectedRace = Race.dog;
  void _changeRace(Race? race) {
    setState(() {
      _selectedRace = race;
    });
  }

  // Validators
  String? _nameValidator(value) => value == null || value.isEmpty ? nameValidatorError.i18n : null;
  String? _raceValidator(value) => value == null ? raceValidatorError.i18n : null;

  PetDAO? petDAO;

  Future<int> _savePet(Pet pet) async{
    return await petDAO!.insertPet(pet);
  }

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async{
    petDAO = await PetService.getDAO();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: namePlaceholder.i18n),
                controller: _nameController,
                validator: _nameValidator
            ),
              const SizedBox(height: 18),
              DropdownButtonFormField(
                value: _selectedRace,
                items: Race.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                dropdownColor: primary.shade50,
                decoration: InputDecoration(
                  labelText: racePlaceholder.i18n,
                  prefixIcon: const Icon(Icons.accessibility_new_rounded,
                      color: primary),
                ),
                isExpanded: true,
                onChanged: _changeRace,
                validator: _raceValidator,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: Text(saveButton.i18n),
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      final Pet pet = Pet(_nameController.text, _selectedRace!);

                      await _savePet(pet);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
