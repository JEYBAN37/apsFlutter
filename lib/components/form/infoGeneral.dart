import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart'; // Validadores
import 'package:aps/constants/enumerations.dart'; // Ruta para las enumeraciones // Validadores

class InfoGeneral extends StatefulWidget {
  const InfoGeneral({super.key});

  @override
  State<InfoGeneral> createState() => _InfoGeneralState();
}

class _InfoGeneralState extends State<InfoGeneral> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario con FormBuilder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20,),
                  // Dropdown para Departamento
                  FormBuilderDropdown<String>(
                    name: 'departament',
                    decoration: InputDecoration(
                      labelText: 'Departamento',
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blueGrey,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                    ),
                    items: departaments.map((dept) {
                      return DropdownMenuItem<String>(
                        value: dept['code'],
                        child: Text(
                          dept['name']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                    validator: FormBuilderValidators.required(
                      errorText: 'Selecciona un departamento',
                    ),
                    dropdownColor: Colors.white,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blueGrey,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Dropdown para Municipio
                  FormBuilderDropdown<String>(
                    name: 'municipality',
                    decoration: InputDecoration(
                      labelText: 'Municipio',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blueGrey,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                    ),
                    items: municipality.map((muni) {
                      return DropdownMenuItem<String>(
                        value: muni['code'],
                        child: Text(muni['name']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                    validator: FormBuilderValidators.required(
                      errorText: 'Selecciona un municipio',
                    ),
                    dropdownColor: Colors.white,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blueGrey,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Dropdown para Barrio
                  FormBuilderDropdown<int>(
                    name: 'nameBranding',
                    decoration: InputDecoration(
                      labelText: 'Barrio',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blueGrey,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                    ),
                    items: nameBranding.map((map) {
                      final key = map.keys.first;
                      final value = map.values.first;
                      return DropdownMenuItem<int>(
                        value: key,
                        child: Text(value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        
                      );
                    }).toList(),
                    validator: FormBuilderValidators.required(
                      errorText: 'Selecciona un barrio',
                    ),
                    dropdownColor: Colors.white,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blueGrey,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Campo Dirección
                  FormBuilderTextField(
                    name: 'address',
                    decoration: const InputDecoration(
                      labelText: 'Dirección',
                      border: OutlineInputBorder(),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.maxLength(
                        200,
                        errorText: 'La dirección no puede tener más de 200 caracteres',
                      ),
                    ]),
                    maxLength: 200,
                  ),

                  const SizedBox(height: 16),

                  // Campo Referencia Dirección
                  FormBuilderTextField(
                    name: 'homeLocation',
                    decoration: const InputDecoration(
                      labelText: 'Punto de Referencia (Si no hay nomenclatura)',
                      border: OutlineInputBorder(),
                    ),
                    validator: FormBuilderValidators.compose([
                      // Valida solo si el campo tiene contenido
                      (value) {
                        if (value != null && value.isNotEmpty) {
                          return FormBuilderValidators.maxLength(200)(
                            value,
                          );
                        }
                        return null; // No mostrar error si está vacío
                      },
                    ]),
                    maxLength: 200,
                  ),

                  const SizedBox(height: 16),

                  // Dropdown para Estrato
                  FormBuilderDropdown<int>(
                    name: 'estratum',
                    decoration: InputDecoration(
                      labelText: 'Estrato',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blueGrey,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                    ),
                    dropdownColor: Colors.white,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.blueGrey,
                      ),
                    items: optionSTR.map((option) {
                      return DropdownMenuItem<int>(
                        value: option.keys.first,
                        child: Text(option.values.first,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Selecciona un estrato',
                        
                      ),
                      (value) {
                        if (value == 0) {
                          return 'Por favor selecciona un estrato válido';
                        }
                        return null;
                      },
                      
                    ]),
                  ),

                  const SizedBox(height: 16),
                  
                  // Dropdown para Prestador Primario
                  FormBuilderDropdown<String>(
                    name: 'idPrimaryProvider',
                    decoration: InputDecoration(
                      labelText: 'Prestador Primario',
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blueGrey,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                    ),
                    items: optionsESE.map((map) {
                      final key = map.keys.first;
                      final value = map.values.first;
                      return DropdownMenuItem<String>(
                        value: key,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                    validator: FormBuilderValidators.required(
                      errorText: 'Selecciona un prestador primario',
                    ),
                    dropdownColor: Colors.white,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blueGrey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botón para guardar
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        final formData = _formKey.currentState?.value;
                        print('Datos del formulario: $formData');
                        // Aquí puedes guardar en la base de datos
                      } else {
                        print('Formulario no válido');
                      }
                    },
                    child: const Text('Guardar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}