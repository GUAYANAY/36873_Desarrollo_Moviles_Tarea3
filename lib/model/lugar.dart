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

// Datos de ejemplo (las imágenes son de relleno, luego se cambian por reales)
final List<Lugar> lugaresEjemplo = [
  const Lugar(
    nombre: 'Mitad del Mundo',
    descripcion: 'Monumento y ciudad mitad del mundo donde pasa la línea ecuatorial.',
    ubicacion: 'San Antonio de Pichincha, Quito',
    imagenes: [
      'https://picsum.photos/seed/mitad1/800/500',
      'https://picsum.photos/seed/mitad2/800/500',
      'https://picsum.photos/seed/mitad3/800/500',
    ],
  ),
  const Lugar(
    nombre: 'Quilotoa',
    descripcion: 'Laguna volcánica de aguas verdes dentro de un cráter.',
    ubicacion: 'Cotopaxi, Ecuador',
    imagenes: [
      'https://picsum.photos/seed/quilotoa1/800/500',
      'https://picsum.photos/seed/quilotoa2/800/500',
      'https://picsum.photos/seed/quilotoa3/800/500',
    ],
  ),
  const Lugar(
    nombre: 'Baños de Agua Santa',
    descripcion: 'Ciudad de aventura con cascadas, termas y la Casa del Árbol.',
    ubicacion: 'Tungurahua, Ecuador',
    imagenes: [
      'https://picsum.photos/seed/banos1/800/500',
      'https://picsum.photos/seed/banos2/800/500',
      'https://picsum.photos/seed/banos3/800/500',
    ],
  ),
  const Lugar(
    nombre: 'Islas Galápagos',
    descripcion: 'Archipiélago único en el mundo, hogar de especies exóticas.',
    ubicacion: 'Océano Pacífico, Ecuador',
    imagenes: [
      'https://picsum.photos/seed/galapagos1/800/500',
      'https://picsum.photos/seed/galapagos2/800/500',
      'https://picsum.photos/seed/galapagos3/800/500',
    ],
  ),
  const Lugar(
    nombre: 'Cotopaxi',
    descripcion: 'Uno de los volcanes activos más altos del mundo.',
    ubicacion: 'Parque Nacional Cotopaxi',
    imagenes: [
      'https://picsum.photos/seed/cotopaxi1/800/500',
      'https://picsum.photos/seed/cotopaxi2/800/500',
      'https://picsum.photos/seed/cotopaxi3/800/500',
    ],
  ),
];