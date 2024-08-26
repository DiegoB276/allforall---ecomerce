/*
  © All rights reserved.
  © By allforall - 2024
*/

List<List<String>> categorias = [
  ["Aseo", "assets/categories/aseo.png"],
  ["Automotriz", "assets/categories/cars.png"],
  ["Bebes", "assets/categories/baby.png"],
  ["Calzado", "assets/categories/shoes.png"],
  ["Celulares", "assets/categories/phone.png"],
  ["Cocina", "assets/categories/kitchen.png"],
  ["Computacion", "assets/categories/computer.png"],
  ["Construccion", "assets/categories/construction.png"],
  ["Deportes", "assets/categories/sports.png"],
  ["Electrodomesticos", "assets/categories/electrodomestic.png"],
  ["Ferreteria", "assets/categories/ferre.png"],
  ["Hogar", "assets/categories/home.png"],
  ["Juegos", "assets/categories/games.png"],
  ["Lacteos", "assets/categories/milks.png"],
  ["Libros", "assets/categories/books.png"],
  ["Licores", "assets/categories/drinks.png"],
  ["Loncheras", "assets/categories/snacks.png"],
  ["Mascotas", "assets/categories/pets.png"],
  ["Perfumes", "assets/categories/perfums.png"],
  ["Papeleria", "assets/categories/papper.png"],
  ["Relojes", "assets/categories/clocks.png"],
  ["Tablets", "assets/categories/tablet.png"],
  ["Tecnologia", "assets/categories/technology.png"],
];

List<String> promoImages = [
  "assets/img/promo1.jpg",
  "assets/img/promo2.jpg",
  "assets/img/promo3.jpg",
];

List<Map<String, dynamic>> products = [
  {
    'name': "Aspiradora 10 lts para el hogar",
    'marketer': "Ferretería García",
    'price': 1200000,
    'description':
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    'bought': 20,
    'amount': 120,
    'category': "Hogar",
    'images': [
      "assets/img/aspiradora.png",
      "assets/img/aspiradora.png",
      "assets/img/aspiradora.png",
      "assets/img/aspiradora.png",
    ]
  },
  {
    'name': "KIT profesional de herramientas Black & Decker",
    'marketer': "Ferretería García",
    'price': 600000,
    'description':
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    'bought': 15,
    'amount': 230,
    'category': "Ferreteria",
    'images': [
      "assets/img/kit_herra.png",
      "assets/img/kit_herra.png",
      "assets/img/kit_herra.png",
      "assets/img/kit_herra.png",
    ]
  },
  {
    'name': "Juego de almohadas + resposabrazos",
    'marketer': "Telas Colombia",
    'price': 450000,
    'description':
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    'bought': 23,
    'amount': 74,
    'category': "Hogar",
    'images': [
      "assets/img/almohadas.png",
      "assets/img/almohadas.png",
      "assets/img/almohadas.png",
      "assets/img/almohadas.png",
    ]
  },
  {
    'name': "Cocina a gas portatil de dos fogonoes",
    'marketer': "Ferretería García",
    'price': 1200000,
    'description':
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    'bought': 16,
    'amount': 27,
    'category': "Hogar",
    'images': [
      "assets/img/cocina_portatil.png",
      "assets/img/cocina_portatil.png",
      "assets/img/cocina_portatil.png",
      "assets/img/cocina_portatil.png",
    ]
  },
  {
    'name': "Microondas Samsung Modelo CHK7834IJ",
    'marketer': "Ferretería García",
    'price': 250000,
    'description':
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    'bought': 60,
    'amount': 250,
    'category': "Electrodomesticos",
    'images': [
      "assets/img/microondas.png",
      "assets/img/microondas.png",
      "assets/img/microondas.png",
      "assets/img/microondas.png",
    ]
  },
  {
    'name': "Ventilador portatil de 3 velocidades semi-automático",
    'marketer': "Electronica S.A.S",
    'price': 250000,
    'description':
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    'bought': 453,
    'amount': 1035,
    'category': "Electrodomesticos",
    'images': [
      "assets/img/ventilador.png",
      "assets/img/ventilador.png",
      "assets/img/ventilador.png",
      "assets/img/ventilador.png",
    ]
  },
  {
    'name':
        "Impresora Escanner Epson L3150 con wifi incorporado y juego de tintas",
    'marketer': "Compugamer Colombia",
    'price': 859900,
    'description':
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    'bought': 145,
    'amount': 12,
    'category': "Tecnologia",
    'images': [
      "assets/img/impresora.png",
      "assets/img/impresora.png",
      "assets/img/impresora.png",
      "assets/img/impresora.png",
    ]
  },
  {
    'name':
        "Smart TV de 45\" pulgadas de marca Infinix con androidTV incorporado",
    'marketer': "Electro Hogar",
    'price': 2049000,
    'description':
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    'bought': 107,
    'amount': 10,
    'category': "Electrodomesticos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Juego de utensilios de cocina antiadherentes",
    'marketer': "Cocina Fácil",
    'price': 450000,
    'description':
        "Un set completo de utensilios de cocina con recubrimiento antiadherente.",
    'bought': 80,
    'amount': 150,
    'category': "Cocina",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Set de pintura acrílica con 12 colores",
    'marketer': "Arte Creativo",
    'price': 70000,
    'description':
        "Pintura acrílica de alta calidad en un set de 12 colores vibrantes.",
    'bought': 40,
    'amount': 200,
    'category': "Papeleria",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Reloj inteligente Xiaomi Mi Watch",
    'marketer': "TecnoMovil",
    'price': 350000,
    'description':
        "Reloj inteligente con monitor de ritmo cardíaco y GPS incorporado.",
    'bought': 300,
    'amount': 100,
    'category': "Relojes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Lámpara LED de escritorio con regulador de intensidad",
    'marketer': "Ilumina Hogar",
    'price': 120000,
    'description':
        "Lámpara de escritorio con luz LED y regulador de intensidad.",
    'bought': 150,
    'amount': 350,
    'category': "Hogar",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Licuadora Oster 2 velocidades con vaso de vidrio",
    'marketer': "Cocina Fácil",
    'price': 320000,
    'description': "Licuadora de alta potencia con vaso de vidrio resistente.",
    'bought': 500,
    'amount': 200,
    'category': "Electrodomesticos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Set de herramientas mecánicas para automóviles",
    'marketer': "Ferretería García",
    'price': 900000,
    'description':
        "Set completo de herramientas para reparación de automóviles.",
    'bought': 25,
    'amount': 70,
    'category': "Automotriz",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Tablet Lenovo Tab M10 HD",
    'marketer': "TecnoMovil",
    'price': 850000,
    'description':
        "Tablet Lenovo con pantalla HD de 10 pulgadas y 32GB de almacenamiento.",
    'bought': 120,
    'amount': 40,
    'category': "Tablets",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Cafetera eléctrica con temporizador programable",
    'marketer': "Electro Hogar",
    'price': 260000,
    'description':
        "Cafetera eléctrica con temporizador y capacidad para 12 tazas.",
    'bought': 300,
    'amount': 80,
    'category': "Electrodomesticos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Juguete interactivo para gatos con plumas",
    'marketer': "Mascotas Felices",
    'price': 50000,
    'description':
        "Juguete interactivo para gatos con plumas y movimiento automático.",
    'bought': 200,
    'amount': 500,
    'category': "Mascotas",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Set de vasos de cristal templado",
    'marketer': "Cocina Fácil",
    'price': 80000,
    'description':
        "Set de 6 vasos de cristal templado, resistentes y elegantes.",
    'bought': 450,
    'amount': 300,
    'category': "Cocina",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Zapatos deportivos Nike Air Max",
    'marketer': "Deportes Mundo",
    'price': 380000,
    'description':
        "Zapatos deportivos Nike con amortiguación Air Max para mayor comodidad.",
    'bought': 250,
    'amount': 120,
    'category': "Calzado",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Perfume Calvin Klein Euphoria 100ml",
    'marketer': "Perfumería Delux",
    'price': 220000,
    'description':
        "Fragancia intensa y duradera para mujeres, con notas florales y orientales.",
    'bought': 380,
    'amount': 500,
    'category': "Perfumes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Set de loncheras térmicas para niños",
    'marketer': "Bebés Felices",
    'price': 55000,
    'description':
        "Set de loncheras térmicas para mantener los alimentos frescos durante más tiempo.",
    'bought': 150,
    'amount': 400,
    'category': "Loncheras",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Licuadora Hamilton Beach con vaso de plástico",
    'marketer': "Electro Hogar",
    'price': 180000,
    'description':
        "Licuadora compacta de 2 velocidades con vaso de plástico resistente.",
    'bought': 300,
    'amount': 180,
    'category': "Electrodomesticos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Casco para bicicleta con luz LED incorporada",
    'marketer': "Deportes Mundo",
    'price': 150000,
    'description':
        "Casco de bicicleta ligero con luz LED para mayor seguridad en la carretera.",
    'bought': 80,
    'amount': 150,
    'category': "Deportes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Camisa formal de algodón para hombres",
    'marketer': "Moda Plus",
    'price': 75000,
    'description': "Camisa formal de algodón 100% para ocasiones especiales.",
    'bought': 130,
    'amount': 200,
    'category': "Calzado",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Juego de cubiertos de acero inoxidable 24 piezas",
    'marketer': "Cocina Fácil",
    'price': 130000,
    'description':
        "Set de cubiertos de acero inoxidable para 6 personas, resistente y elegante.",
    'bought': 100,
    'amount': 250,
    'category': "Cocina",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Smartwatch deportivo resistente al agua",
    'marketer': "TecnoMovil",
    'price': 210000,
    'description':
        "Smartwatch con monitoreo de actividad física y resistente al agua.",
    'bought': 300,
    'amount': 120,
    'category': "Tecnologia",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Silla ergonómica para oficina con soporte lumbar",
    'marketer': "Muebles Oficina",
    'price': 480000,
    'description':
        "Silla ergonómica con soporte lumbar ajustable para largas horas de trabajo.",
    'bought': 50,
    'amount': 75,
    'category': "Hogar",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Batidora de mano con 5 velocidades",
    'marketer': "Electro Hogar",
    'price': 95000,
    'description':
        "Batidora de mano compacta con 5 velocidades para diversas preparaciones.",
    'bought': 500,
    'amount': 150,
    'category': "Electrodomesticos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Mochila escolar con compartimento para laptop",
    'marketer': "Papelería Escolar",
    'price': 120000,
    'description':
        "Mochila escolar con varios compartimentos, incluyendo uno para laptop.",
    'bought': 250,
    'amount': 300,
    'category': "Papeleria",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Cámara de seguridad WiFi con visión nocturna",
    'marketer': "TecnoSeguridad",
    'price': 180000,
    'description':
        "Cámara de seguridad con conexión WiFi, control remoto y visión nocturna.",
    'bought': 400,
    'amount': 80,
    'category': "Tecnologia",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Colchón ortopédico Queen Size",
    'marketer': "Hogar y Confort",
    'price': 950000,
    'description':
        "Colchón ortopédico con tecnología de enfriamiento y soporte lumbar.",
    'bought': 35,
    'amount': 50,
    'category': "Hogar",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Lápiz óptico para tabletas gráficas",
    'marketer': "TecnoMovil",
    'price': 45000,
    'description':
        "Lápiz óptico de alta precisión compatible con diversas tabletas gráficas.",
    'bought': 150,
    'amount': 500,
    'category': "Tablets",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Camiseta deportiva transpirable para running",
    'marketer': "Deportes Mundo",
    'price': 70000,
    'description':
        "Camiseta deportiva de material transpirable, ideal para running y entrenamiento.",
    'bought': 400,
    'amount': 300,
    'category': "Deportes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Taladro inalámbrico con batería de litio",
    'marketer': "Ferretería García",
    'price': 320000,
    'description':
        "Taladro inalámbrico con batería de litio de larga duración y cargador rápido.",
    'bought': 200,
    'amount': 120,
    'category': "Ferreteria",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Auriculares inalámbricos con cancelación de ruido",
    'marketer': "AudioWorld",
    'price': 450000,
    'description':
        "Auriculares inalámbricos de alta fidelidad con cancelación activa de ruido.",
    'bought': 320,
    'amount': 200,
    'category': "Tecnologia",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Zapatos formales de cuero para hombre",
    'marketer': "Calzado Elegante",
    'price': 280000,
    'description':
        "Zapatos formales de cuero auténtico, ideales para ocasiones especiales.",
    'bought': 220,
    'amount': 100,
    'category': "Calzado",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Escritorio modular con estantes ajustables",
    'marketer': "Muebles Oficina",
    'price': 350000,
    'description':
        "Escritorio modular con estantes ajustables para mayor funcionalidad.",
    'bought': 50,
    'amount': 100,
    'category': "Hogar",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Juego de cuchillos de cocina profesional",
    'marketer': "Cocina Fácil",
    'price': 220000,
    'description':
        "Juego de cuchillos de cocina profesional, incluye 8 piezas con soporte.",
    'bought': 170,
    'amount': 120,
    'category': "Cocina",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Guitarra acústica de madera con estuche",
    'marketer': "Musical Express",
    'price': 350000,
    'description':
        "Guitarra acústica de madera con estuche acolchado para protección.",
    'bought': 60,
    'amount': 45,
    'category': "Juegos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Refrigerador compacto de 120 litros",
    'marketer': "Electro Hogar",
    'price': 750000,
    'description':
        "Refrigerador compacto con bajo consumo energético y diseño elegante.",
    'bought': 85,
    'amount': 50,
    'category': "Electrodomesticos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Aceite para motor sintético 5W-30",
    'marketer': "AutoCare",
    'price': 45000,
    'description':
        "Aceite para motor sintético de alta calidad, ideal para vehículos modernos.",
    'bought': 150,
    'amount': 400,
    'category': "Automotriz",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Filtro de aire para vehículos sedán",
    'marketer': "AutoCare",
    'price': 25000,
    'description': "Filtro de aire de alto rendimiento para vehículos sedán.",
    'bought': 120,
    'amount': 300,
    'category': "Automotriz",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Líquido de frenos DOT 4",
    'marketer': "AutoCare",
    'price': 20000,
    'description':
        "Líquido de frenos de alta resistencia al calor, apto para todo tipo de vehículos.",
    'bought': 180,
    'amount': 500,
    'category': "Automotriz",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Limpiador de parabrisas concentrado",
    'marketer': "AutoCare",
    'price': 15000,
    'description':
        "Limpiador concentrado para parabrisas, garantiza visibilidad clara y sin manchas.",
    'bought': 220,
    'amount': 600,
    'category': "Automotriz",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Batería para auto 12V 60Ah",
    'marketer': "AutoCare",
    'price': 320000,
    'description':
        "Batería de alto rendimiento, ideal para vehículos de uso diario.",
    'bought': 50,
    'amount': 100,
    'category': "Automotriz",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Cera pulidora para carrocería",
    'marketer': "AutoCare",
    'price': 35000,
    'description':
        "Cera pulidora para carrocería, brinda brillo y protección duradera.",
    'bought': 200,
    'amount': 300,
    'category': "Automotriz",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Pañales desechables talla M",
    'marketer': "Bebés y Más",
    'price': 35000,
    'description':
        "Pañales desechables ultradelgados con máxima absorción para bebés.",
    'bought': 450,
    'amount': 1000,
    'category': "Bebes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Biberón anticólicos 240ml",
    'marketer': "Bebés y Más",
    'price': 20000,
    'description': "Biberón con sistema anticólicos, apto para recién nacidos.",
    'bought': 300,
    'amount': 800,
    'category': "Bebes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Silla de auto para bebés",
    'marketer': "Bebés y Más",
    'price': 180000,
    'description': "Silla de auto segura y cómoda para bebés de 0 a 12 meses.",
    'bought': 100,
    'amount': 150,
    'category': "Bebes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Set de ropa para bebé recién nacido",
    'marketer': "Bebés y Más",
    'price': 45000,
    'description':
        "Set de ropa de algodón para bebé recién nacido, incluye 5 piezas.",
    'bought': 400,
    'amount': 700,
    'category': "Bebes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Cuna plegable portátil",
    'marketer': "Bebés y Más",
    'price': 250000,
    'description': "Cuna plegable portátil, fácil de transportar y armar.",
    'bought': 80,
    'amount': 100,
    'category': "Bebes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Mordedor de silicona para bebé",
    'marketer': "Bebés y Más",
    'price': 10000,
    'description':
        "Mordedor de silicona suave y seguro para aliviar las encías del bebé.",
    'bought': 500,
    'amount': 1500,
    'category': "Bebes",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Protector de pantalla de vidrio templado",
    'marketer': "Celular Express",
    'price': 15000,
    'description':
        "Protector de pantalla de vidrio templado para smartphones, resistente a rayones.",
    'bought': 1000,
    'amount': 2000,
    'category': "Celulares",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Funda de silicona para iPhone",
    'marketer': "Celular Express",
    'price': 25000,
    'description':
        "Funda de silicona suave y flexible, protección completa para iPhone.",
    'bought': 900,
    'amount': 1500,
    'category': "Celulares",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Cargador rápido USB-C 18W",
    'marketer': "Celular Express",
    'price': 40000,
    'description':
        "Cargador rápido USB-C compatible con múltiples dispositivos.",
    'bought': 800,
    'amount': 1000,
    'category': "Celulares",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Auriculares Bluetooth inalámbricos",
    'marketer': "Celular Express",
    'price': 60000,
    'description':
        "Auriculares Bluetooth con calidad de sonido superior y batería de larga duración.",
    'bought': 700,
    'amount': 900,
    'category': "Celulares",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Leche entera 1 litro",
    'marketer': "Lácteos del Valle",
    'price': 3500,
    'description': "Leche entera fresca, rica en vitaminas y minerales.",
    'bought': 500,
    'amount': 1500,
    'category': "Lacteos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Yogur natural 500g",
    'marketer': "Lácteos del Valle",
    'price': 5000,
    'description':
        "Yogur natural con probióticos, ideal para una dieta saludable.",
    'bought': 400,
    'amount': 1200,
    'category': "Lacteos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Queso fresco 200g",
    'marketer': "Lácteos del Valle",
    'price': 6000,
    'description': "Queso fresco, ideal para ensaladas y sándwiches.",
    'bought': 350,
    'amount': 800,
    'category': "Lacteos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Mantequilla 250g",
    'marketer': "Lácteos del Valle",
    'price': 7000,
    'description': "Mantequilla 100% natural, ideal para cocinar y untar.",
    'bought': 300,
    'amount': 600,
    'category': "Lacteos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Crema de leche 1 litro",
    'marketer': "Lácteos del Valle",
    'price': 8000,
    'description':
        "Crema de leche rica y espesa, perfecta para cocinar y postres.",
    'bought': 250,
    'amount': 500,
    'category': "Lacteos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Leche deslactosada 1 litro",
    'marketer': "Lácteos del Valle",
    'price': 4000,
    'description':
        "Leche deslactosada, ideal para personas con intolerancia a la lactosa.",
    'bought': 450,
    'amount': 1000,
    'category': "Lacteos",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Detergente líquido para ropa 1 litro",
    'marketer': "AseoPlus",
    'price': 7000,
    'description':
        "Detergente líquido eficaz para limpiar y mantener el color de la ropa.",
    'bought': 300,
    'amount': 700,
    'category': "Aseo",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Limpiador multiusos 500 ml",
    'marketer': "AseoPlus",
    'price': 5000,
    'description':
        "Limpiador multiusos para superficies, elimina manchas y suciedad.",
    'bought': 400,
    'amount': 800,
    'category': "Aseo",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Desinfectante en aerosol 300 ml",
    'marketer': "AseoPlus",
    'price': 6000,
    'description':
        "Desinfectante en aerosol que elimina gérmenes y bacterias del hogar.",
    'bought': 350,
    'amount': 600,
    'category': "Aseo",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Esponjas de limpieza pack de 6",
    'marketer': "AseoPlus",
    'price': 4000,
    'description':
        "Pack de 6 esponjas de limpieza duraderas y eficientes para el hogar.",
    'bought': 500,
    'amount': 1000,
    'category': "Aseo",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Toallas de papel 2 rollos",
    'marketer': "AseoPlus",
    'price': 3000,
    'description':
        "Toallas de papel absorbentes, ideales para la cocina y el hogar.",
    'bought': 600,
    'amount': 1500,
    'category': "Aseo",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
  {
    'name': "Jabón líquido antibacterial 500 ml",
    'marketer': "AseoPlus",
    'price': 5500,
    'description':
        "Jabón líquido antibacterial para manos, elimina gérmenes y bacterias.",
    'bought': 450,
    'amount': 900,
    'category': "Aseo",
    'images': [
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
      "assets/img/televisor.png",
    ]
  },
];
