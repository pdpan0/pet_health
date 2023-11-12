import 'package:flutter/material.dart';
import 'package:pet_health/constants/colors.dart';
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

  final _nameController = TextEditingController();

  Race? _selectedRace = Race.dog;

  void _changeRace(Race? race) {
    setState(() {
      _selectedRace = race;
    });
  }

  void _savePet(Pet pet) {}

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
                validator: (value) =>
                    value == null || value.isEmpty ? nameValidatorError.i18n : null,
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
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: Text(saveButton.i18n),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
              )
            ],
          ),
        ));
  }
}
