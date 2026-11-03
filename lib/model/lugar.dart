class Lugar {
  final String nombre;
  final String descripcion;
  final List<String> imagenes;
  final String ubicacion;

  //constructor
  const Lugar({
    required this.nombre,
    required this.descripcion,
    required this.imagenes,
    required this.ubicacion,
  });
}

final List<Lugar> lugaresEjemplo = [
  const Lugar(
    nombre: 'Mitad del Mundo',
    descripcion:
        'Monumento y ciudad mitad del mundo donde pasa la línea ecuatorial.',
    ubicacion: 'San Antonio de Pichincha, Quito',
    imagenes: [
      'assets/images/mitad_1.jpg',
      'assets/images/mitad_2.jpg',
      'assets/images/mitad_3.jpg',
    ],
  ),
  const Lugar(
    nombre: 'Quilotoa',
    descripcion: 'Laguna volcánica de aguas verdes dentro de un cráter.',
    ubicacion: 'Cotopaxi, Ecuador',
    imagenes: [
      'assets/images/quilotoa_1.jpg',
      'assets/images/quilotoa_2.jpg',
      'assets/images/quilotoa_3.jpg',
    ],
  ),
  const Lugar(
    nombre: 'Baños de Agua Santa',
    descripcion: 'Ciudad de aventura con cascadas, termas y la Casa del Árbol.',
    ubicacion: 'Tungurahua, Ecuador',
    imagenes: [
      'assets/images/banos_1.jpg',
      'assets/images/banos_2.jpg',
      'assets/images/banos_3.jpg',
    ],
  ),
  const Lugar(
    nombre: 'Islas Galápagos',
    descripcion: 'Archipiélago único en el mundo, hogar de especies exóticas.',
    ubicacion: 'Océano Pacífico, Ecuador',
    imagenes: [
      'assets/images/galapagos_1.jpg',
      'assets/images/galapagos_2.jpg',
      'assets/images/galapagos_3.jpg',
    ],
  ),
  const Lugar(
    nombre: 'Cotopaxi',
    descripcion: 'Uno de los volcanes activos más altos del mundo.',
    ubicacion: 'Parque Nacional Cotopaxi',
    imagenes: [
      'assets/images/cotopaxi_1.jpg',
      'assets/images/cotopaxi_2.jpg',
      'assets/images/cotopaxi_3.jpg',
    ],
  ),
];
