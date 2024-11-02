import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pet.dart';
import '../providers/pet_provider.dart';

class AddEditPetScreen extends StatefulWidget {
  final Pet? pet;
  AddEditPetScreen({this.pet});

  @override
  _AddEditPetScreenState createState() => _AddEditPetScreenState();
}

class _AddEditPetScreenState extends State<AddEditPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.pet != null) {
      _nomeController.text = widget.pet!.nome;
      _descricaoController.text = widget.pet!.descricao;
    }
  }

  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pet == null ? 'Adicionar Pet' : 'Editar Pet'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe a descrição' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final pet = Pet(
                      id: widget.pet?.id ?? '',
                      nome: _nomeController.text,
                      descricao: _descricaoController.text,
                    );
                    if (widget.pet == null) {
                      petProvider.addPet(pet);
                    } else {
                      petProvider.updatePet(pet);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.pet == null ? 'Adicionar' : 'Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
